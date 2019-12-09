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
            $('#search_text').click();
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
	

	$('#search_button') .click(function () {
		var db = 'db:"xml_memory"';  // don't know why, but this one needs quoting for solr to parse
		var query = db;
		var year_range ;
		var start_range;
		var end_range;
		
	    if ($('[name="search_text"]') .attr('value') == null) {
			alert('Please input search text.');
			return false;
		} else {
		    queryString = ' AND fulltext:' + checkQuery( $('input[name="search_text"]') );
			query = query + queryString;
		}
		
		
		if ($('#county') .children("input:checked") .attr('value') != 'all') {
			queryString = ' AND county:' + $('#county') .children("input:checked") .attr('value');
			query = query + queryString;
		}

		
		if ($('[name="start_year"]') .attr('value') != null) {
			start_range = $('[name="start_year"]').attr('value');
		}
		
		if ($('[name="end_year"]') .attr('value') != null) {
			end_range = $('[name="end_year"]') .attr('value');
		}
		
		if (start_range != null || end_range != null) {
			if (start_range == null) {
				start_range = '*';
			}
			if (end_range == null) {
				end_range = '*';
			}
			year_range = ' AND year:[' + start_range + ' TO ' + end_range + ']';
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
		var url = document.memorySearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value');
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;

		
	});

/* hide 'enable javascript' warning */
$('#no-javascript').remove();


});
