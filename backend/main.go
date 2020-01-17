/* ===================================================================================

		Declare package name

====================================================================================*/

package main

/* ===================================================================================

		Define imports

====================================================================================*/

import (
	"fmt"
	"html"
	"html/template"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"os"
	"path/filepath"
	"regexp"
	"strconv"
	"strings"
	"github.com/gorilla/mux"
)

/* ===================================================================================

	It MAY be beneficial to precompile the templates. Evaluate once app is
	completely finished

====================================================================================*/

//var templates = template.Must(template.ParseGlob("templates/*.tpl"))

/* ===================================================================================

	Init mux router and declare named routes


====================================================================================*/

func newRouter() *mux.Router {
	r := mux.NewRouter()
	r.HandleFunc("/", hndl_webroot_html)
	r.HandleFunc("/news-topicitem/{period}/", hndl_news_topicitem_list_html)
	r.HandleFunc("/news-calendar/", hndl_news_calendar)
	r.HandleFunc("/news-calendar-pdfs/", hndl_news_calendar_pdfs)
	r.HandleFunc("/news/{paper_year}/{filename}", hndl_news_xml)
	r.HandleFunc("/or/{filename}", hndl_or_xml)
	r.HandleFunc("/papers/{filename}", hndl_papers_xml)
	r.HandleFunc("/head/{filename}", hndl_head_xml)
	r.HandleFunc("/mod/{filename}", hndl_mod_xml)
	r.HandleFunc("/mem/{filename}", hndl_mem_xml)
	r.HandleFunc("/claims/{filename}", hndl_claims_xml)
	r.HandleFunc("/VoS/images/{filename}", hndl_single_image_result_html)
	//r.HandleFunc("/newspapers-pdfs/", hndl_newspapers_pdfs)

	r.HandleFunc("/dossier_record", hndl_dossier_record_html)
	r.HandleFunc("/sc_record", hndl_sc_record_html)


	staticFileDirectory_root := http.Dir("./VoS")
	staticFileHandler_root := http.StripPrefix("/VoS/", http.FileServer(staticFileDirectory_root))
	r.PathPrefix("/VoS/").Handler(staticFileHandler_root).Methods("GET")

	//staticFileDirectory_javascript := http.Dir("./javascript/")
	//staticFileHandler_javascript := http.StripPrefix("/javascript/", http.FileServer(staticFileDirectory_javascript))
	//r.PathPrefix("/javascript/").Handler(staticFileHandler_javascript).Methods("GET")

	//staticFileDirectory_css := http.Dir("./css/")
	//staticFileHandler_css := http.StripPrefix("/css/", http.FileServer(staticFileDirectory_css))
	//r.PathPrefix("/css/").Handler(staticFileHandler_css).Methods("GET")

	staticFileDirectory_papers := http.Dir("./papers")
	staticFileHandler_papers := http.StripPrefix("/papers/", http.FileServer(staticFileDirectory_papers))
	r.PathPrefix("/papers/").Handler(staticFileHandler_papers).Methods("GET")

	staticFileDirectory_mem := http.Dir("./mem/")
	staticFileHandler_mem := http.StripPrefix("/mem/", http.FileServer(staticFileDirectory_mem))
	r.PathPrefix("/mem/").Handler(staticFileHandler_mem).Methods("GET")

	staticFileDirectory_claims := http.Dir("./claims/")
	staticFileHandler_claims := http.StripPrefix("/claims/", http.FileServer(staticFileDirectory_claims))
	r.PathPrefix("/claims/").Handler(staticFileHandler_claims).Methods("GET")

	staticFileDirectory_or := http.Dir("./or/")
	staticFileHandler_or := http.StripPrefix("/or/", http.FileServer(staticFileDirectory_or))
	r.PathPrefix("/or/").Handler(staticFileHandler_or).Methods("GET")

	staticFileDirectory_news := http.Dir("./news/")
	staticFileHandler_news := http.StripPrefix("/news/", http.FileServer(staticFileDirectory_news))
	r.PathPrefix("/news/").Handler(staticFileHandler_news).Methods("GET")

	staticFileDirectory_newspapers_pdfs := http.Dir("./newspapers_pdfs/")
	staticFileHandler_newspapers_pdfs := http.StripPrefix("/newspapers_pdfs/", http.FileServer(staticFileDirectory_newspapers_pdfs))
	r.PathPrefix("/newspapers_pdfs/").Handler(staticFileHandler_newspapers_pdfs).Methods("GET")

	// Subrouter for letters search to maintain legacy url structure
	letter_search_router := r.PathPrefix("/letters_search").Subrouter().StrictSlash(true)
	letter_search_router.HandleFunc("/", hndl_letters_search_html)
	r.HandleFunc("/letters_search_results.html", hndl_letters_search_results_html)

	// Subrouter for diaries search to maintain legacy url structure
	diaries_search_router := r.PathPrefix("/diaries_search").Subrouter().StrictSlash(true)
	diaries_search_router.HandleFunc("/", hndl_diaries_search_html)
	r.HandleFunc("/diaries_search_results.html", hndl_diaries_search_results_html)

	// Subrouter for church search to maintain legacy url structure
	church_search_router := r.PathPrefix("/church").Subrouter().StrictSlash(true)
	church_search_router.HandleFunc("/", hndl_church_search_html)
	r.HandleFunc("/church_search_results.html", hndl_church_search_results_html)

	// Subrouter for church search to maintain legacy url structure
	images_search_router := r.PathPrefix("/images").Subrouter().StrictSlash(true)
	images_search_router.HandleFunc("/", hndl_images_search_html)
	r.HandleFunc("/images_search_results.html", hndl_images_search_results_html)

	// Subrouter for or (official records ) search to maintain legacy url structure
	or_search_router := r.PathPrefix("/or_search").Subrouter().StrictSlash(true)
	or_search_router.HandleFunc("/", hndl_or_search_html)
	r.HandleFunc("/or_search_results.html", hndl_or_search_results_html)

	// Subrouter for church search to maintain legacy url structure
	newspapers_search_router := r.PathPrefix("/newspapers").Subrouter().StrictSlash(true)
	newspapers_search_router.HandleFunc("/", hndl_newspapers_search_html)
	r.HandleFunc("/newspapers_search_results.html", hndl_newspapers_search_results_html)

	// Subrouter for news-topics search to maintain legacy url structure
	news_topics_index_router := r.PathPrefix("/news-topics/{filename}").Subrouter().StrictSlash(true)
	news_topics_index_router.HandleFunc("/", hndl_news_topics_index_html)
	//r.HandleFunc("/newspapers_search_results.html", hndl_newspapers_search_results_html)

	// Subrouter for population census search to maintain legacy url structure
	census_search_router := r.PathPrefix("/population_census").Subrouter().StrictSlash(true)
	census_search_router.HandleFunc("/", hndl_census_search_html)
	r.HandleFunc("/census_search_results", hndl_census_search_results_html)
	r.HandleFunc("/census_dual_search_results", hndl_census_dual_search_results_html)

	// Subrouter for advanced population census search to maintain legacy url structure
	advanced_census_search_router := r.PathPrefix("/advanced").Subrouter().StrictSlash(true)
	advanced_census_search_router.HandleFunc("/", hndl_advanced_search_html)
	r.HandleFunc("/advanced_search_results.html", hndl_advanced_search_results_html)

	// Subrouter for thickbox advanced population census search to maintain legacy url structure
	thickbox_census_results_router := r.PathPrefix("/census_results").Subrouter().StrictSlash(true)
	thickbox_census_results_router.HandleFunc("/", hndl_thickbox_census_results_html)

	// Subrouter for agriculture census search to maintain legacy url structure
	ag_census_search_router := r.PathPrefix("/ag_census").Subrouter().StrictSlash(true)
	ag_census_search_router.HandleFunc("/", hndl_ag_census_search_html)
	r.HandleFunc("/ag_census_search_results.html", hndl_ag_census_search_results_html)

	// Subrouter for agriculture record  to maintain legacy url structure
	ag_record_results_router := r.PathPrefix("/ag_record").Subrouter().StrictSlash(true)
	ag_record_results_router.HandleFunc("/", hndl_ag_record_results_html)

	// Subrouter for manmufacturing census search to maintain legacy url structure
	manu_census_search_router := r.PathPrefix("/manu_census").Subrouter().StrictSlash(true)
	manu_census_search_router.HandleFunc("/", hndl_manu_census_search_html)
	r.HandleFunc("/manu_census_search_results.html", hndl_manu_census_search_results_html)

	// Subrouter for manufacturing record  to maintain legacy url structure
	manu_record_results_router := r.PathPrefix("/manu_record").Subrouter().StrictSlash(true)
	manu_record_results_router.HandleFunc("/", hndl_manu_record_results_html)

	// Subrouter for slave owner census search to maintain legacy url structure
	slave_census_search_router := r.PathPrefix("/slave_census").Subrouter().StrictSlash(true)
	slave_census_search_router.HandleFunc("/", hndl_slave_census_search_html)
	r.HandleFunc("/slave_census_search_results.html", hndl_slave_census_search_results_html)

	// Subrouter for tax search to maintain legacy url structure
	tax_search_router := r.PathPrefix("/tax").Subrouter().StrictSlash(true)
	tax_search_router.HandleFunc("/", hndl_tax_search_html)
	r.HandleFunc("/tax_search_results.html", hndl_tax_search_results_html)

	// Subrouter for mapdata search to maintain legacy url structure
	mapdata_search_router := r.PathPrefix("/mapdata").Subrouter().StrictSlash(true)
	mapdata_search_router.HandleFunc("/", hndl_mapdata_search_html)
	r.HandleFunc("/mapdata_search_results.html", hndl_mapdata_search_results_html)

	// Subrouter for dossiers search to maintain legacy url structure
	dossiers_search_router := r.PathPrefix("/dossiers").Subrouter().StrictSlash(true)
	dossiers_search_router.HandleFunc("/", hndl_dossiers_search_html)
	r.HandleFunc("/dossiers_search_results.html", hndl_dossiers_search_results_html)

	// Subrouter for paclaims search to maintain legacy url structure
	paclaims_search_router := r.PathPrefix("/paclaims").Subrouter().StrictSlash(true)
	paclaims_search_router.HandleFunc("/", hndl_paclaims_search_html)
	r.HandleFunc("/claims_search_results.html", hndl_paclaims_search_results_html)

	// Subrouter for soclaims search to maintain legacy url structure
	soclaims_search_router := r.PathPrefix("/soclaims").Subrouter().StrictSlash(true)
	soclaims_search_router.HandleFunc("/", hndl_soclaims_search_html)
	r.HandleFunc("/soclaims_search_results.html", hndl_soclaims_search_results_html)

	// Subrouter for veterans search to maintain legacy url structure
	veteran_search_router := r.PathPrefix("/veteran").Subrouter().StrictSlash(true)
	veteran_search_router.HandleFunc("/", hndl_veteran_search_html)
	r.HandleFunc("/veteran_search_results.html", hndl_veteran_search_results_html)

	// Subrouter for cohabitation search to maintain legacy url structure
	cohabitation_search_router := r.PathPrefix("/cohabitation").Subrouter().StrictSlash(true)
	cohabitation_search_router.HandleFunc("/", hndl_cohabitation_search_html)
	r.HandleFunc("/cohabitation_search_results.html", hndl_cohabitation_search_results_html)
	r.HandleFunc("/cohab_children", hndl_cohab_children_search_results_html)

	return r
}

/* ===================================================================================

		Instance router and start server

====================================================================================*/

func main() {

	dir, err := filepath.Abs(filepath.Dir(os.Args[0]))
	 if err != nil {
					 log.Fatal(err)
	 }
	 fmt.Println(dir)

	r := newRouter()
	log.Println("Host " + os.Getenv("site_url") + " is listening on port " + os.Getenv("listen_port"))
	log.Fatal(http.ListenAndServe(fmt.Sprintf( ":%s", os.Getenv("listen_port")), r))


}

/* ===================================================================================

	Global funcs passed to html templates

	Normalizing the data in solr will make the getstate, getcounty and getyear funcs unnecessary.
	Until then, they are needed.

====================================================================================*/

func noescape(str string) template.HTML {
	return template.HTML(str)
}

/*-----------------------------------------------------------------------------------*/

func noext(str string) string {
	filename_noext := strings.TrimSuffix(str, filepath.Ext(str))
	return filename_noext

}

/*-----------------------------------------------------------------------------------*/

func titlecase(str string) string {
	return strings.Title(str)
}

/*-----------------------------------------------------------------------------------*/

// Load from config eventually
func getsiteurl() string {
	return os.Getenv("site_url")
}

/*-----------------------------------------------------------------------------------*/

func getyear(str string) string {

	var answer = ""

	switch strings.ToLower(str) {
	case "70":
		answer = "1870"
	case "80":
		answer = "1870"
	}
	return answer
}

/*-----------------------------------------------------------------------------------*/

func getstate(str string) string {

	var answer = ""

	switch strings.ToLower(str) {
	case "fr":
		answer = "Pennsylvania"
	case "franklin":
		answer = "Pennsylvania"
	case "church_fr":
		answer = "Pennsylvania"
	case "au":
		answer = "Virginia"
	case "aug":
		answer = "Virginia"
	case "church_au":
		answer = "Virginia"
	case "augusta":
		answer = "Virginia"
	}
	return answer
}

/*-----------------------------------------------------------------------------------*/

func getcounty(str string) string {

	var answer = ""

	switch strings.ToLower(str) {
	case "fr":
		answer = "Franklin"
	case "franklin":
		answer = "Franklin"
	case "church_fr":
		answer = "Franklin"
	case "au":
		answer = "Augusta"
	case "aug":
		answer = "Augusta"
	case "augusta":
		answer = "Augusta"
	case "church_au":
		answer = "Augusta"
	case "church_aug":
		answer = "Augusta"

	}
	return answer
}

/* ===================================================================================

		Reads a static html file from disc and serves it to client

====================================================================================*/

func read_then_write_static_html(ww http.ResponseWriter, tgt string) {

	ww.Header().Set("Content-Type", "text/html; charset=utf-8")
	data, err := ioutil.ReadFile(string(tgt))
	if err == nil {
		ww.Write(data)
	} else {
		ww.WriteHeader(404)
		ww.Write([]byte("HTTP 404a  - " + http.StatusText(404)))
	}

}

/* ===================================================================================

		Determines total pages needed from record count

====================================================================================*/

func calculate_total_pages(reccount int) int {

	var pagecount = 0
	var quotient, remainder int

	if reccount <= 0 {
		// this is an error, handle better but fall thru for now
		pagecount = 0
		return pagecount
	}

	if reccount > 0 && reccount <= 50 {
		pagecount = 1
		return pagecount
	}

	quotient, remainder = reccount/50, reccount%50

	if remainder <= 0 {
		pagecount = quotient
	} else {
		pagecount = quotient + 1
	}

	return pagecount
}

/* ===================================================================================

		Determines current page number based on solr start value

====================================================================================*/

func calculate_current_pagenumber(c string) int {

	var current_page = 0
	var quotient, remainder int

	if c == "0" {
		current_page = 1
		return current_page
	}
	cursor, err := strconv.Atoi(c)
	if err != nil {
		current_page = 1
		return current_page
	}

	if cursor == 0 {
		current_page = 1
		return current_page
	}

	quotient, remainder = cursor/50, cursor%50

	if remainder == 0 {
		current_page = quotient + 1
	} else {
		current_page = quotient + 2
	}

	return current_page

}

/* ===================================================================================

		Determine solr start value from the page number

====================================================================================*/

func start2page(pagenum int) int {
	var start = 0
	if pagenum == 1 {
		start = 0
	} else if pagenum >= 2 {
		start = (pagenum - 1) * 50
	}

	return start

}

/* ===================================================================================

		Write the pagination links to page

====================================================================================*/

func write_pagination(allcount int, start int, current_url string) string {

	var pagecount = 0
	var tmpstr = ""
	var current_page_int = 0

	u, err := url.Parse(current_url)
	if err != nil {
		log.Fatal(err)
	}
	q := u.Query()

	current_page_int = calculate_current_pagenumber(q.Get("start"))
	pagecount = calculate_total_pages(allcount)

	if pagecount > 1 {
		q.Set("start", fmt.Sprintf("%d", (50*(current_page_int-1))-50))
		u.RawQuery = q.Encode()
		if start >= 50 {
			tmpstr += fmt.Sprintf(" <a href=\"%v/%v?%v\">Previous</a> ", os.Getenv("site_url"), u.Path, u.RawQuery)
		} else {
			tmpstr += " "
		}
	}

	if current_page_int > 1 && current_page_int <= pagecount && pagecount > 1 {
		q.Set("start", fmt.Sprintf("%d", (50*(current_page_int-1))-50))
		u.RawQuery = q.Encode()
		tmpstr += fmt.Sprintf(" <a href=\"%v/%v?%v\">Previous</a> ", os.Getenv("site_url"), u.Path, u.RawQuery)
	}

	tnum := 1
	for tnum <= pagecount {

		if tnum == 1 {
			q.Set("start", "0")
		} else {
			q.Set("start", fmt.Sprintf("%d", (50*tnum)-50))
		}

		u.RawQuery = q.Encode()

		if current_page_int == tnum {
			tmpstr += fmt.Sprintf(" %v ", tnum)
		} else {
			tmpstr += fmt.Sprintf("<a href=\"%v/%v?%v\">%v</a>", os.Getenv("site_url"), u.Path, u.RawQuery, tnum)
		}

		if tnum < pagecount {
			tmpstr += " | "
		}

		tnum += 1
	}

	if current_page_int < pagecount {
		q.Set("start", fmt.Sprintf("%d", (50*(current_page_int+1))-50))
		u.RawQuery = q.Encode()
		tmpstr += fmt.Sprintf(" <a href=\"%v/%v?%v\">Next</a> ", os.Getenv("site_url"), u.Path, u.RawQuery)
	}

	return tmpstr

}

/* ===================================================================================

	All of the static html search pages are built using templates

====================================================================================*/

func load_html_template(w2 http.ResponseWriter, r2 *http.Request, tpl string) {

	cwd, _ := os.Getwd()
	fname := filepath.Join(cwd, "./templates/*.tpl")

	fmap := template.FuncMap{
		"noescape":   noescape,
		"noext":      noext,
		"titlecase":  titlecase,
		"getstate":   getstate,
		"getcounty":  getcounty,
		"getyear":    getyear,
		"getsiteurl": getsiteurl,
		"unescape":   html.UnescapeString,
	}

	t, err := template.New(fname).Funcs(fmap).ParseGlob(fname)
	if err != nil {
		log.Fatal("Error loading templates:" + err.Error())
	}

	w2.Header().Set("Content-Type", "text/html")

	err = t.ExecuteTemplate(w2, tpl, nil)
	if err != nil {
		http.Error(w2, err.Error(), http.StatusInternalServerError)
	}

}

/* ===================================================================================

	Executes solr query, receives json response, passes to template and serves to client

====================================================================================*/

func get_solr_search_results(w1 http.ResponseWriter, r1 *http.Request, current_template string) {

	var string_contents string

	u, err := url.Parse(r1.RequestURI)
	if err != nil {
		log.Fatal(err)
	}

	tmpq := u.RawQuery
	qun, err := url.QueryUnescape(tmpq)
	m, _ := url.ParseQuery(qun)

	//fmt.Println("RQ = : " + qun)
	//fmt.Println("raw_st = : " + m.Get("raw_st"))
	zz := ConstructSolrQuery(qun + "&raw_st=" + m.Get("raw_st"))
	//log.Println(" QS out from CSQ: " + zz)

	// Make solr call
	response, err := http.Get(zz)

	if err != nil {
		fmt.Printf("Error getting data from solr %s", err)
		os.Exit(1)
	}

	defer response.Body.Close()

	contents, err := ioutil.ReadAll(response.Body)

	if m.Get("raw_st") != "" {
		rx := regexp.MustCompile("(?i)" + m.Get("raw_st"))
		em_string := "<em>" + m.Get("raw_st") + "</em>"
		string_contents = rx.ReplaceAllString(string(contents), em_string)
	} else {
		string_contents = string(contents)

	}

	//clean_string := html.UnescapeString(string_contents)
	//fmt.Println("CLEAN:" + clean_string)

	//THIS IS WORKING on bytes - save
	//replaceall := bytes.Replace(contents, []byte(m.Get("raw_st")), []byte(em_string), -1)

	if err != nil {
		fmt.Printf("Error reading response body into contents%s", err)
		os.Exit(1)
	}

	solrResponse, err := SolrFromHTTP([]byte(string_contents))
	if err != nil {
		log.Println("SolrResponseFromHTTPResponse() failed. %v.", err)
		log.Println("SolrResponseFromHTTPResponse() failed. %+v.", solrResponse)

	}

	alldocs_count := solrResponse.Response.NumFound
	//numdocs_returned := len(solrResponse.Response.Docs)

	//fmt.Println("right before pagination call:")
	//fmt.Println(GetSiteUrl())

	tmpvar := write_pagination(alldocs_count, solrResponse.Response.Start, r1.URL.RequestURI())
	//fmt.Println("right after pagination call:" + html.UnescapeString(tmpvar) + "\n")

	solrResponse.Response.ST = html.UnescapeString(tmpvar)
	solrResponse.Response.CURSOR = solrResponse.Response.Start + 50
	solrResponse.Response.QS = qun

	if m.Get("county") != "" {
		solrResponse.Response.County = m.Get("county")
	}
	if m.Get("year") != "" {
		solrResponse.Response.Year = m.Get("year")
	}

	cwd, _ := os.Getwd()
	fname := filepath.Join(cwd, "./templates/*.tpl")

	fmap := template.FuncMap{
		"noescape":   noescape,
		"noext":      noext,
		"titlecase":  titlecase,
		"getstate":   getstate,
		"getcounty":  getcounty,
		"getyear":    getyear,
		"getsiteurl": getsiteurl,
		"unescape":   html.UnescapeString,
	}

	t, err := template.New(fname).Funcs(fmap).ParseGlob(fname)
	if err != nil {
		log.Fatal("Error loading templates:" + err.Error())
	}

	w1.Header().Set("Content-Type", "text/html")

	err = t.ExecuteTemplate(w1, current_template, solrResponse.Response)
	if err != nil {
		http.Error(w1, err.Error(), http.StatusInternalServerError)
	}

}

/* ===================================================================================

		Begin callback handlers for defined routes

====================================================================================*/

func hndl_webroot_html(w http.ResponseWriter, r *http.Request) {
	fmt.Println("WEBROOT FIRED!")
	read_then_write_static_html(w, "./VoS/index.html")
}

func hndl_news_calendar(w http.ResponseWriter, r *http.Request) {

	param1 := r.URL.Query().Get("paper")
	target := "./news/newspaper_calendar_" + param1 + ".html"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_news_calendar_pdfs(w http.ResponseWriter, r *http.Request) {

	param1 := r.URL.Query().Get("paper")
	target := "./news/news_calendar_pdf_" + param1 + ".html"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_newspaper_pdfs(w http.ResponseWriter, r *http.Request) {

	param1 := r.URL.Query().Get("paper")
	target := "./newspapers_pdfs" + param1 + ".pdf"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_news_xml(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))
	target := "./news/" + vars["paper_year"] + "/" + filename_noext + ".html"

	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_or_xml(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))
	target := "./or/" + filename_noext + ".html"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_papers_xml(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)

	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))
	target := "./papers/" + filename_noext + ".html"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_head_xml(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))
	target := "./head/" + filename_noext + ".html"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_mod_xml(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))
	target := "./mod/" + filename_noext + ".html"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_mem_xml(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))
	target := "./mem/" + filename_noext + ".html"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_claims_xml(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))
	target := "./claims/" + filename_noext + ".html"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_letters_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "letters_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_letters_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "test.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_diaries_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "diaries_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_diaries_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "diaries_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_church_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "church_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_church_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "church_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_images_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "images_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_images_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "images_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_single_image_result_html(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))
	fmt.Printf("No ext: %v", filename_noext)
	get_solr_search_results(w, r, "images_single_result.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_or_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "or_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_or_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "or_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_newspapers_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "newspapers_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_newspapers_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "newspapers_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_news_topics_index_html(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))
	target := "./news/" + filename_noext + "topics.html"

	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_news_topicitem_index_html(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	filename_noext := strings.TrimSuffix(vars["filename"], filepath.Ext(vars["filename"]))

	//fmt.Printf("topicvar : %v", filename_noext)
	//p1 := vars["p1"]
	//p2 := vars["p2"]
	//fmt.Printf("p1 : %v : p2 : %v", p1, p2)

	target := "./news-topicitem/" + filename_noext + "topics.html"

	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_news_topicitem_list_html(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	list := r.URL.Query().Get("list")
	area := r.URL.Query().Get("area")

	period := strings.TrimSuffix(vars["period"], filepath.Ext(vars["period"]))
	target := "./news/" + period + "_" + list + "_" + area + ".html"
	read_then_write_static_html(w, target)

}

/* ===================================================================================


====================================================================================*/

func hndl_census_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "census_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_census_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "census_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_census_dual_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "census_dual_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_advanced_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "advanced_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_advanced_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "advanced_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_thickbox_census_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "thickbox_census_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_ag_census_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "ag_census_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_ag_census_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "ag_census_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_ag_record_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "ag_record_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_manu_census_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "manu_census_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_manu_census_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "manu_census_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_manu_record_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "manu_record_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_slave_census_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "slave_census_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_slave_census_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "slave_census_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_tax_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "tax_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_tax_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "tax_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_dossiers_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "dossiers_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_dossiers_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "dossiers_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_mapdata_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "mapdata_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_mapdata_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "mapdata_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_dossier_record_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "dossier_record.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_sc_record_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "sc_record.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_paclaims_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "paclaims_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_paclaims_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "paclaims_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_soclaims_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "so_claims_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_soclaims_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "soclaims_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_veteran_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "veteran_search.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_veteran_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "veteran_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_cohabitation_search_html(w http.ResponseWriter, r *http.Request) {

	load_html_template(w, r, "cohabitation_search.tpl")

}

// ===================================================================================
//
// ===================================================================================

func hndl_cohabitation_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "cohabitation_search_results.tpl")

}

/* ===================================================================================


====================================================================================*/

func hndl_cohab_children_search_results_html(w http.ResponseWriter, r *http.Request) {

	get_solr_search_results(w, r, "cohab_children.tpl")

}

/* ===================================================================================


====================================================================================*/
