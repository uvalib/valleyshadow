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
	


	$('[name="search_text"]').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
    });
    
	$('[name="start_year"]') .change(function () {
		var selected_id = $(this) .children("option:selected") .attr('value');
		if (selected_id != null) {
			$('[name="start_month"]') .removeAttr("disabled");
		} else {
			$('[name="start_month"]') .attr('disabled', 'disabled');
		}
	});
	
	$('[name="end_year"]') .change(function () {
		var selected_id = $(this) .children("option:selected") .attr('value');
		if (selected_id != null) {
			$('[name="end_month"]') .removeAttr("disabled");
		} else {
			$('[name="end_month"]') .attr('disabled', 'disabled');
		}
	});
	
	// submission event
	$('#search_button') .click(function () {
		var db = 'db:xml_or';
		var query = db;
		var queryString = '';
		var county = ''; var year_range = '';
		
		if ($('[name="search_text"]') .attr('value') == null) {
			alert('Please input search text.');
			return false;
		} else {
		    queryString = ' AND fulltext:' + checkQuery( $('input[name="search_text"]') );
			query = query + queryString;
			raw_st = $('[name="search_text"]') .attr('value');

		}
		
		
		if ($('#county') .children("input:checked") .attr('value') != 'all') {
			queryString = ' AND county:' + $('#county') .children("input:checked") .attr('value');
			query = query + queryString;
		}
		
		var start_range;
		var end_range;
		
		if ($('[name="start_year"]') .attr('value') != null) {
			start_range = $('[name="start_year"]') .attr('value') + $('[name="start_month"]') .attr('value');
		}
		
		if ($('[name="end_year"]') .attr('value') != null) {
			end_range = $('[name="end_year"]') .attr('value') + $('[name="end_month"]') .attr('value');
		}
		
		if (start_range != null || end_range != null) {
			if (start_range == null) {
				start_range = '*';
			}
			if (end_range == null) {
				end_range = '*';
			}
			year_range = ' AND or_date:[' + start_range + ' TO ' + end_range + ']';
		}
		
		var warningString = 'Start of date range must be prior to end of date range.'
		var test   = '';

		if ( isNaN(parseInt(start_range, 10)) || isNaN(parseInt(end_range, 10)) ) { test=true; }
		else { 
		    if ( parseInt(start_range, 10) > parseInt(end_range, 10) ) { 
		        test=false; 
		        } 
		    else { 
		        test=true; 
		        }
		   }
		if (! test) {
		$('<span></span>').addClass('warning').append(warningString).insertAfter('#validationField').fadeOut(3000);
		return false;
		}

		query = query + year_range;

		
		var url = document.orSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value')  + "&raw_st=" + raw_st;
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;

	});
	
	/* hide no-javascript warning on load */
    $('#no-javascript').remove();
});