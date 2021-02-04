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
    
    // a function to lowercase string (regardless of contents) and put parens around non-wildcard search strings, if whitespace is present
    function checkQuery(item) {
        var newQuery = item.attr('value').toLowerCase();
         if (newQuery.match(/\*|\?/g)) {
        // do nothing
        }  else if (newQuery.match(/\s/g)) {
             newQuery = '(' + newQuery + ')';
        }
        return newQuery;
    }; 
	

	$('#search_button') .click(function () {
		var db = 'db:agr_' + $('#county_cell') .children("input:checked") .attr('value') + '_' + $('#year_cell') .children("input:checked") .attr('value');
		var query = db;
        var sort = '';
        var queryString = '';
		var county = $('#county_cell') .children("input:checked") .attr('value')
		var year = $('#year_cell') .children("input:checked") .attr('value')
		
		// text query fields (lowercasing required to make solr wildcard queries successful)
		if ($('input[name="last_name"]') .attr('value') != null) {
			queryString = ' AND last:' + checkQuery($('input[name="last_name"]') );
			query = query + queryString;
		}
		if ($('input[name="first_name"]') .attr('value') != null) {
			queryString = ' AND first:' + checkQuery($('input[name="first_name"]'));
			query = query + queryString;
		}
		
		
		// range query fields 
		var no_tot_land = $('[name="no_tot_land"]') .attr('value');
		if (no_tot_land != null){
		    queryString = buildRange($('[name="no_tot_land"]') .attr('value'), 'tot_land', $('[name="no_tot_land-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var farm_val = $('[name="farm_val"]') .attr('value');
		if (farm_val != null){
			queryString = buildRange($('[name="farm_val"]') .attr('value'), 'farm_val', $('[name="farm_val-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var no_tobacco = $('[name="no_tobacco"]') .attr('value');
		if (no_tobacco != null){
		    queryString = buildRange($('[name="no_tobacco"]') .attr('value'), 'tobacco', $('[name="no_tobacco-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var no_tot_grain = $('[name="no_tot_grain"]') .attr('value');
		if (no_tot_grain != null){
			queryString = buildRange($('[name="no_tot_grain"]') .attr('value'), 'tot_grain', $('[name="no_tot_grain-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var tot_livestock = $('[name="tot_livestock"]') .attr('value');
		if (tot_livestock != null){
			queryString = buildRange($('[name="tot_livestock"]') .attr('value'), 'tot_livestock', $('[name="tot_livestock-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var no_tot_animals = $('[name="no_tot_animals"]') .attr('value');
		if (no_tot_animals != null){
			queryString = buildRange($('[name="no_tot_animals"]') .attr('value'), 'tot_animals', $('[name="no_tot_animals-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var no_manu = $('[name="no_manu"]') .attr('value');
		if (no_manu != null){
			queryString = buildRange($('[name="no_manu"]') .attr('value'), 'home_manu', $('[name="no_manu-op"]') .attr('value'));
            query = query + queryString;
		}
		
		
		
		$('#sort') .attr('value', sort);
        $('#query') .attr('value', query);
        $('#db') .attr('value', db);
        var url = document.ag_censusSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + $('[name="sort"]').attr('value') + "&county=" + county + "&year=" + year;
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;

	});
	
	/* hide no-javascript warning on load */
    $('#no-javascript').remove();

});
