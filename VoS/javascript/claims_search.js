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

	
    $('#people').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
    });


    
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
	
    function buildRange(rangeTerm, solrFieldName, rangeOp) {
        // this is a general method for building range queries for solr/lucene
        // note it includes boolean operator, so must be used on 2nd and later query fields
        
        var queryTerm = ' AND ' + solrFieldName + ':' + rangeTerm;
        if (rangeOp == '>' || rangeOp == 'gt') {
            queryTerm = ' AND ' + solrFieldName + ':' + '[' + rangeTerm + ' TO *]';
        } else if (rangeOp == '<' || rangeOp == 'lt') {
            queryTerm = ' AND ' + solrFieldName + ':' + '[* TO ' + rangeTerm + ']';
        } else if (rangeOp == '<>' || rangeOp == '><'   || rangeOp == 'not' ) {
            queryTerm = ' NOT ' + solrFieldName + ':' + rangeTerm;
        } else if (rangeOp == '' || rangeOp == 'equal' ) {
            // do nothing
        } else { queryTerm = ''; }
        
        return queryTerm;
    };
    


	$('#search_button') .click(function () {
	
		var db = 'db:claims';
		var query = db;
		var sort = $('[name="sort"]') .attr('value');
		
		// text search fields
		if ($('input[name="last_name"]') .attr('value') != null){
			queryString = ' AND last:' + checkQuery( $('input[name="last_name"]') );
			query = query + queryString;
		}
		if ($('input[name="first_name"]') .attr('value') != null){
			queryString = ' AND first:' + checkQuery( $('input[name="first_name"]') );
			query = query + queryString;
		}
		
		// radio buttons
		if ($('#sex_cell') .children("input:checked") .attr('value') != null){
			queryString = ' AND sex:' + $('#sex_cell') .children("input:checked") .attr('value');
			query = query + queryString;

		}
		if($('#race_cell') .children("input:checked") .attr('value') != null){
			queryString = ' AND race:' + $('#race_cell') .children("input:checked") .attr('value');
			query = query + queryString;
		}
		
		// range query fields 
		var claim_total = $('[name="claim_total"]') .attr('value');
		if (claim_total != null){
		    queryString = buildRange($('[name="claim_total"]') .attr('value'), 'claim_total', $('#claim_total-op') .attr('value'));
            query = query + queryString;
		}
				
		var pers_prop = $('[name="pers_prop"]') .attr('value');
		if (pers_prop != null){
		    queryString = buildRange($('[name="pers_prop"]') .attr('value'), 'personal_property', $('#pers_prop-op') .attr('value'));
            query = query + queryString;
		}
		
		var real_prop = $('[name="real_prop"]') .attr('value');
		if (real_prop != null){
		    queryString = buildRange($('[name="real_prop"]') .attr('value'), 'real_property', $('#real_prop-op') .attr('value'));
            query = query + queryString;
		}
		
		var amount_award = $('[name="amount_award"]') .attr('value');
		if (amount_award != null){
		    queryString = buildRange($('[name="amount_award"]') .attr('value'), 'amount_award', $('#amount_award-op') .attr('value'));
            query = query + queryString;
		}
		
		var amount_rec = $('[name="amount_rec"]') .attr('value');
		if (amount_rec != null){
		    queryString = buildRange($('[name="amount_rec"]') .attr('value'), 'amount_rec', $('#amount_rec-op') .attr('value'));
            query = query + queryString;
		}
		
	    if (sort != 'last asc, first asc') {
	        sort = sort + ', last asc, first asc';
	        }
        $('#query') .attr('value', query);
        $('#db') .attr('value', db);
        var url = document.claimsSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + $('[name="sort"]').attr('value');
        // alert (url);
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
        
		});
		
/* hide no-javascript warning on load */
$('#no-javascript').remove();
});
