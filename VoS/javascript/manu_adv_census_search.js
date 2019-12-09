$(function () {
    /* disable submit click event propagation to prevent conflict with form submit event */
    $('#search_button').click( function (event) {
        event.stopPropagation();
        event.preventDefault(); 
    });
    $('#search_button').submit( function (event) {
        event.stopPropagation();
        event.preventDefault(); 
    });
    function buildRange(rangeTerm, solrFieldName, rangeOp) {
        // this is a general method for building range queries for solr/lucene
        // note it includes boolean operator, so must be used on 2nd and later query fields
        
        var queryTerm = ' AND ' + solrFieldName + ':' + rangeTerm;
        if (rangeOp == '>') {
            queryTerm = ' AND ' + solrFieldName + ':' + '[' + rangeTerm + ' TO *]';
        } else if (rangeOp == '<') {
            queryTerm = ' AND ' + solrFieldName + ':' + '[* TO ' + rangeTerm + ']';
        } else if (rangeOp == '<>' || rangeOp == '><') {
            queryTerm = ' NOT ' + solrFieldName + ':' + rangeTerm;
        } else if (rangeOp == '' || rangeOp == undefined ) {
            queryTerm = '';
        }
        
        return queryTerm;
    };

        
    // a function to lowercase string (regardless of contents) and put quotes around non-wildcard search strings, if whitespace is present
    function checkQuery(item) {
        var newQuery = item.attr('value').toLowerCase();
         if (newQuery.match(/\*|\?/g)) {
        // do nothing
        }  else if (newQuery.match(/\s/g)) {
            newQuery = '"' + newQuery + '"';
        }
        return newQuery;
    }; 
	

$('#search_button') .click(function () {    
//    $('#manuAdvCensusSearch') .submit(function () {
        var year = $('#year_cell') .children("input:checked") .attr('value');
        
        var db = 'db:man_' + $('#county_cell') .children("input:checked") .attr('value') + '_' + year;
        var query = db;
        var sort = '';
        var queryString = '';
        
        // text query fields
        if ($('#name') .attr('value') != null) {
            queryString = ' AND name:' + checkQuery($('#name') );
            query = query + queryString;
        } 
        
        if ($('#business') .attr('value') != null) {
            queryString = ' AND business:' + checkQuery($('#business') );
            query = query + queryString;
        } 
        
        if ($('[name="location"]') .attr('value') != null) {
            queryString = ' AND location:' + checkQuery($('[name="location"]') );
            query = query + queryString;
        } 
        
        if ($('[name="products"]') .attr('value') != null) {
            if (year == '60') {
                queryString = ' AND kinds_annual:' + checkQuery($('[name="products"]') );
            } else if (year == '70') {
                queryString = ' AND business:' + checkQuery($('[name="products"]') );
            }
            query = query + queryString;
        } 
        
        if ($('[name="qty_annual"]') .attr('value') != null) {
            queryString = ' AND qty_annual:' + checkQuery($('[name="qty_annual"]') );
            query = query + queryString;
        } 
        
        if ($('[name="kinds_raw"]') .attr('value') != null) {
            queryString = ' AND kinds_raw:' + checkQuery($('[name="kinds_raw"]') );
            query = query + queryString;
        } 
        
        if ($('[name="qty_raw"]') .attr('value') != null) {
            queryString = ' AND qty_raw:' + checkQuery($('[name="qty_raw"]') );
            query = query + queryString;
        } 
        
        if ($('[name="power"]') .attr('value') != null) {
            queryString = ' AND power:' + checkQuery($('[name="power"]') );
            query = query + queryString;
        } 
        
        
        // range-able query fields
        if ($('[name="capital"]') .attr('value') != null) {
            queryString = buildRange($('[name="capital"]') .attr('value'), 'cap_inv', $('[name="capital-op"]') .attr('value'));
            query = query + queryString;
        } 
        
        if ($('[name="male_hands"]') .attr('value') != null) {
            queryString = buildRange($('[name="male_hands"]') .attr('value'), 'male_hands', $('[name="male_hands-op"]') .attr('value'));
            query = query + queryString;
        } 
        
        if ($('[name="female_hands"]') .attr('value') != null) {
            queryString = buildRange($('[name="female_hands"]') .attr('value'), 'female_hands', $('[name="female_hands-op"]') .attr('value'));
            query = query + queryString;
        } 
        
        if ($('[name="male_wage"]') .attr('value') != null) {
            queryString = buildRange($('[name="male_wage"]') .attr('value'), 'male_wage', $('[name="male_wage-op"]') .attr('value'));
            query = query + queryString;
        } 
        
        if ($('[name="female_wage"]') .attr('value') != null) {
            queryString = buildRange($('[name="female_wage"]') .attr('value'), 'female_wage', $('[name="female_wage-op"]') .attr('value'));
            query = query + queryString;
        } 
        
        if ($('[name="val_annual"]') .attr('value') != null) {
            queryString = buildRange($('[name="val_annual"]') .attr('value'), 'val_annual', $('[name="val_annual-op"]') .attr('value'));
            query = query + queryString;
        } 
        
        if ($('[name="val_raw"]') .attr('value') != null) {
            queryString = buildRange($('[name="val_raw"]') .attr('value'), 'val_raw', $('[name="val_raw-op"]') .attr('value'));
            query = query + queryString;
        } 
        
        if ($('[name="pageno"]') .attr('value') != null) {
            queryString = buildRange($('[name="pageno"]') .attr('value'), 'page_num', $('[name="pageno-op"]') .attr('value'));
            query = query + queryString;
        } 
        
        /* $('#form') .hide(); */
        
        // query = db + name + business + location + products;
        $('#sort') .attr('value', sort);
        $('#query') .attr('value', query);
        $('#db') .attr('value', db);
//        alert(query);
        var url = document.manuAdvCensusSearch.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + $('[name="sort"]').attr('value');
//        alert(url);
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;

    });
    
    /* hide no-javascript warning on load */
    $('#no-javascript') .remove();
});
