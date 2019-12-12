/* ===================================================================================

		Declare package

====================================================================================*/

package main

/* ===================================================================================

		Declare imports

====================================================================================*/

import (
	"encoding/json"
	"errors"
	"fmt"
	"net/url"
	"os"
)

/* ===================================================================================

		Define the usual errors

====================================================================================*/

var (
	ErrNoResponseHeader = errors.New("Missing response header")
	ErrNoDocs           = errors.New("No documents found")
	ErrBadResponseType  = errors.New("Response is an unexpected type")
	ErrBadDocs          = errors.New("Documents is an unexpected type")
	ErrInvalidHeader    = errors.New("ResponseHeader was invalid")
)

/* ===================================================================================

		Custom Solr response struct

====================================================================================*/

type SolrQuery struct {
	Rows   int
	Start  int
	Query  string
	Facet  string // not used
	Filter string // not used
	Sort   string
	Params map[string]interface{}
}

/* ---------------------------------------------------------------------------------*/

type DocumentCollection struct {
	Docs     []map[string]interface{}
	NumFound int
	Start    int
	ST       string
	CURSOR   int
	QS       string
	County   string
	Year     string
	//Backdoor *datapipe
}

/* ---------------------------------------------------------------------------------*/

type SolrResponse struct {
	Facets   map[string]interface{}
	Response *DocumentCollection
	Status   int
	QTime    int
	Error    error
}

/* ===================================================================================

		Funcs to retrieve site or solr host url's

====================================================================================*/

func GetSolrUrl() string {
	return os.Getenv("solr_url")
}

/* ---------------------------------------------------------------------------------*/

func GetSiteUrl() string {
	return os.Getenv("site_url")
}

/* ===================================================================================

		Builds a solr query

====================================================================================*/

func ConstructSolrQuery(x string) string {

	qun, err := url.QueryUnescape(x)
	if err != nil {
		panic(err)
	}
	m, _ := url.ParseQuery(qun)

	params := url.Values{}
	params.Add("q", m.Get("q"))
	params.Add("rows", "50")
	params.Add("start", m.Get("start"))
	params.Add("sort", m.Get("sort"))
	params.Add("facet", "")
	params.Add("filter", "")
	params.Add("hl", "true")
	params.Add("hl.fl", "fulltext")
	params.Add("hl.fragsize", "200")
	params.Add("hl", "*,score")
	params.Add("wt", "json")

	finalUrl := GetSolrUrl() + params.Encode()

	return finalUrl
}

/* ===================================================================================

	Receives an unmarshalled json solr response and populates our custom struct
	Only the "responseHeader" field is required. If there
	is a "response" field, it must contain "docs", even if empty.

====================================================================================*/

func PopulateResponse(j map[string]interface{}) (*SolrResponse, error) {

	response_root := j
	response := response_root["response"]

	r := SolrResponse{}

	r_header, ok := response_root["responseHeader"].(map[string]interface{})
	if !ok {
		return nil, ErrNoResponseHeader
	}

	if status, ok := r_header["status"]; ok {
		r.Status = int(status.(float64))
	} else {
		return nil, ErrInvalidHeader
	}

	if qtime, ok := r_header["QTime"]; ok {
		r.QTime = int(qtime.(float64))
	} else {
		return nil, ErrInvalidHeader
	}

	if response != nil {
		responseMap, ok := response.(map[string]interface{})
		if !ok {
			return nil, ErrBadResponseType
		}

		docs, ok := responseMap["docs"]
		if !ok {
			return nil, ErrNoDocs
		}

		docsSlice, ok := docs.([]interface{})
		if !ok {
			return nil, ErrBadDocs
		}

		// the total amount of results, irrespective of the amount returned in the response
		num_found := int(responseMap["numFound"].(float64))
		fmt.Printf("NumFound: %v \n", num_found)

		// and the amount actually returned
		num_results := len(docsSlice)
		fmt.Printf("NumReturned: %v \n", num_results)

		coll := DocumentCollection{}
		coll.NumFound = num_found

		ds := make([]map[string]interface{}, 0, num_results)

		for i := 0; i < num_results; i++ {
			document, ok := docsSlice[i].(map[string]interface{})
			if ok {
				//fmt.Printf("DOC %v : %v", i, fmt.Sprint(document))
				ds = append(ds, document)
			}
		}

		coll.Docs = ds
		r.Response = &coll
	}

	// If facets exist, add them as well
	facets := response_root["facets"]
	if facets != nil {
		r.Facets = facets.(map[string]interface{})
	}

	if r.Status >= 400 {
		solrError, ok := response_root["error"]
		if ok {
			errMap, ok := solrError.(map[string]interface{})
			if ok {
				solrMsg, ok := errMap["msg"]
				if ok {
					r.Error = errors.New(solrMsg.(string))
				}
			}
		}
	}

	return &r, nil
}

/* ===================================================================================

		Solr json response is unmarshalled into a custom struct

====================================================================================*/

func SolrFromHTTP(b []byte) (*SolrResponse, error) {

	// SAVE TO TROUBLESHOOT
	// fmt.Printf("container : %v", string(b))

	var container map[string]interface{}

	err := json.Unmarshal(b, &container)
	if err != nil {
		return nil, err
	}

	resp, err := PopulateResponse(container)
	if err != nil {
		return nil, err
	}

	return resp, nil
}

/* ===================================================================================

====================================================================================*/
