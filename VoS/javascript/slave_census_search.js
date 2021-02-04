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
        if (rangeOp == '>' || rangeOp == 'gt') {
            queryTerm = ' AND ' + solrFieldName + ':' + '[' + rangeTerm + ' TO *]';
        } else if (rangeOp == '<' || rangeOp == 'lt') {
            queryTerm = ' AND ' + solrFieldName + ':' + '[* TO ' + rangeTerm + ']';
        } else if (rangeOp == '<>' || rangeOp == '><' || rangeOp == 'not') {
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
	

    $('#people').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
    });
    
	$('#search_button') .click(function () {
		var db = 'db:slave_aug_60';
		var query = db;
        var sort = '';
        var queryString = '';
		
		// text query fields (lowercasing required to make solr wildcard queries successful)
		if ($('input[name="last_name"]') .attr('value') != null) {
			queryString = ' AND last:' + checkQuery( $('input[name="last_name"]') );
			query = query + queryString;
		}
		if ($('input[name="first_name"]') .attr('value') != null) {
			queryString = ' AND first:' + checkQuery( $('input[name="first_name"]') );
			query = query + queryString;
		}
		if ($('input[name="location"]') .attr('value') != null) {
			queryString = ' AND location:' + checkQuery( $('input[name="location"]') );
			query = query + queryString;
		}
		if ($('input[name="emp_name"]') .attr('value') != null) {
			queryString = ' AND emp_name:' + checkQuery( $('input[name="emp_name"]') );
			query = query + queryString;
		}
		if ($('input[name="emp_location"]') .attr('value') != null) {
			queryString = ' AND emp_location:' + checkQuery( $('input[name="emp_location"]') );
			query = query + queryString;
		}
		
		// range query fields 

		
		var tot_slaves = $('[name="total_slaves"]') .attr('value');
		if (tot_slaves != null) {
			queryString = buildRange($('[name="total_slaves"]') .attr('value'), 'total_slaves', $('[name="tot_slaves-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var male_slaves = $('[name="male_slaves"]') .attr('value');
		if (male_slaves != null) {
			queryString = buildRange($('[name="male_slaves"]') .attr('value'), 'male_slaves', $('[name="male_slaves-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var female_slaves = $('[name="female_slaves"]') .attr('value');
		if (female_slaves != null) {
			queryString = buildRange($('[name="female_slaves"]') .attr('value'), 'female_slaves', $('[name="female_slaves-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var black_slaves = $('[name="black_slaves"]') .attr('value');
		if (black_slaves != null) {
			queryString = buildRange($('[name="black_slaves"]') .attr('value'), 'black_slaves', $('[name="black_slaves-op"]') .attr('value'));
            query = query + queryString;
		}
		
		var mulatto_slaves = $('[name="mulatto_slaves"]') .attr('value');
		if (mulatto_slaves != null) {
		    queryString = buildRange($('[name="mulatto_slaves"]') .attr('value'), 'mulatto_slaves', $('[name="mulatto_slaves-op"]') .attr('value'));
            query = query + queryString;
		}
		
		$('#sort') .attr('value', sort);
        $('#query') .attr('value', query);
        $('#db') .attr('value', db);
        var url = document.slaveCensusSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + $('[name="sort"]').attr('value');
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
	
	});
	
	/* hide no-javascript warning on load */
    $('#no-javascript').remove();


});
