$(function () {
 /* disable submit click event propagation to prevent conflict with form submit event */
    $('[name="search_button"]').click( function (event) {
        event.stopPropagation();
        event.preventDefault(); 
    });
    $('[name="search_button"]').submit( function (event) {
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
	
    $('input[name="search_text"]').keydown(function(e){
        if (e.keyCode == 13) {
            $('[name="search_button"]').click();
            return false;
        }
    });

	
	$('[name="start_year"]') .change(function () {
		if ($(this) .attr('value') != null) {
			$('[name="start_month"]') .removeAttr('disabled');
		} else {
			$('[name="start_month"]') .attr('disabled', 'disabled');
		}
	});
	
	$('[name="end_year"]') .change(function () {
		if ($(this) .attr('value') != null) {
			$('[name="end_month"]') .removeAttr('disabled');
		} else {
			$('[name="end_month"}') .attr('disabled', 'disabled');
		}
	});
	

	$('[name="search_button"]') .click(function () {
		var db = 'db:xml_newspapers';
		var sort = 'newspaper_date asc';
		var queryString = '';
		var start_date = '*';
		var end_date = '*';
		var date_range = '';
		var search_text='';
		var raw_st = '';
		
		if ($('[name="search_text"]') .attr('value') == null) {
			alert('Please input search text.');
			return false;
		} else {
		    search_text = ' AND fulltext:' + checkQuery( $('input[name="search_text"]') );
		}
		
		raw_st = $('[name="search_text"]') .attr('value');
		
		if ($('[name="start_year"]') .attr('value') != null) {
			start_date = $('[name="start_year"]') .attr('value') + $('[name="start_month"]') .attr('value');
		}
		
		if ($('[name="end_year"]') .attr('value') != null) {
			end_date = $('[name="end_year"]') .attr('value') + $('[name="end_month"]') .attr('value');
		}
		
		if (start_date != '*' || end_date != '*') {
			date_range = ' AND newspaper_datenum:[' + start_date + ' TO ' + end_date + ']';
		}
		// build query only after parsing search_text AND date_range
		var query = db + search_text + date_range;
		
		if ($('[name="sort"]') .attr('value') != null) {
			sort = $('[name="sort"]') .attr('value');
		}
		
		var warningString = 'Start of date range must be prior to end of date range.';
		var test   = '';

		if ( isNaN(parseInt(start_date, 10)) || isNaN(parseInt(end_date, 10)) ) { test=true; }
		else { 
		    if ( parseInt(start_date, 10) > parseInt(end_date, 10) ) { 
		        test=false; 
		        } 
		    else { 
		        test=true; 
		        }
		   }
		if (! test) {
		$('<span></span>').addClass('warning').append(warningString).insertAfter('#validationField').fadeOut(7500);
		return false;
		}
		
		var newspapers = new Array();
		var count = 0;
		
		$('.newspaper:checked') .each(function () {			
			newspapers[count] = 'newspaper:"' + $(this) .attr('value') + '"';
			count++;
		})
		newspaperQuery = newspapers.join(' OR ');
		
		if (newspaperQuery != null && newspaperQuery != ''){
			query += ' AND (' + newspaperQuery + ')';
		}
		
		
		var url = document.newspaperSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value') + "&start=" + $('[name="start"]').attr('value') + "&sort=" + sort + "&raw_st=" + raw_st;
//		alert(url);
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
	});
		
/* hide no-javascript warning on load */
$('#no-javascript').remove();
    
});
