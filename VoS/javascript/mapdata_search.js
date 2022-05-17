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
	

	
	$('[name="start_month"]') .change(function () {
		var selected_id = $(this) .children("option:selected") .attr('value');
		$('[name="start_day"]') .removeAttr('disabled');
		if (selected_id == '04' | selected_id == '06' | selected_id == '09' | selected_id == '11') {
			$('[name="start_day"]') .html('');
			var i = 1;
			for (i = 1; i <= 30; i++) {
				var day = i.toString()
				if (i < 10) {
					day = '0' + day;
				}
				$('[name="start_day"]') .append('<option>' + day + '</option>');
			}
			$('[name="start_day"]') .children('option') .each(function () {
				if ($(this) .attr('value') == '01') {
					$(this) .attr('selected', 'selected');
				}
			});
		} else if (selected_id == '02') {
			$('[name="start_day"]') .html('');
			var i = 1;
			for (i = 1; i <= 28; i++) {
				var day = i.toString()
				if (i < 10) {
					day = '0' + day;
				}
				$('[name="start_day"]') .append('<option>' + day + '</option>');
			}
			$('[name="start_day"]') .children('option') .each(function () {
				if ($(this) .attr('value') == '01') {
					$(this) .attr('selected', 'selected');
				}
			});
		} else {
			$('[name="start_day"]') .html('');
			var i = 1;
			for (i = 1; i <= 31; i++) {
				var day = i.toString()
				if (i < 10) {
					day = '0' + day;
				}
				$('[name="start_day"]') .append('<option>' + day + '</option>');
			}
			$('[name="start_day"]') .children('option') .each(function () {
				if ($(this) .attr('value') == '01') {
					$(this) .attr('selected', 'selected');
				}
			});
		}
	});
	
	$('[name="end_month"]') .change(function () {
		var selected_id = $(this) .children("option:selected") .attr('value');
		$('[name="end_day"]') .removeAttr('disabled');
		if (selected_id == '04' | selected_id == '06' | selected_id == '09' | selected_id == '11') {
			$('[name="end_day"]') .html('');
			var i = 1;
			for (i = 1; i <= 30; i++) {
				var day = i.toString()
				if (i < 10) {
					day = '0' + day;
				}
				$('[name="end_day"]') .append('<option>' + day + '</option>');
			}
			$('[name="end_day"]') .children('option') .each(function () {
				if ($(this) .attr('value') == '01') {
					$(this) .attr('selected', 'selected');
				}
			});
		} else if (selected_id == '02') {
			$('[name="end_day"]') .html('');
			var i = 1;
			for (i = 1; i <= 28; i++) {
				var day = i.toString()
				if (i < 10) {
					day = '0' + day;
				}
				$('[name="end_day"]') .append('<option>' + day + '</option>');
			}
			$('[name="end_day"]') .children('option') .each(function () {
				if ($(this) .attr('value') == '01') {
					$(this) .attr('selected', 'selected');
				}
			});
		} else {
			$('[name="end_day"]') .html('');
			var i = 1;
			for (i = 1; i <= 31; i++) {
				var day = i.toString()
				if (i < 10) {
					day = '0' + day;
				}
				$('[name="end_day"]') .append('<option>' + day + '</option>');
			}
			$('[name="end_day"]') .children('option') .each(function () {
				if ($(this) .attr('value') == '01') {
					$(this) .attr('selected', 'selected');
				}
			});
		}
	});
	
	$('#search_button') .click(function () {
		var db = 'db:mapdata';
		var query = db;
		var queryString;
		var start_date;
		var end_date;
		
		if ($('[name="battle"]') .attr('value') != null) {
			queryString = ' AND battle:' + checkQuery( $('[name="battle"]') );
			query = query + queryString;
		}
		if ($('[name="regiment"]') .attr('value') != null) {
			queryString = ' AND regiment:' + checkQuery( $('[name="regiment"]') );
			query = query + queryString;

		}
		if ($('[name="brigade"]') .attr('value') != null) {
			queryString = ' AND brigade:' + checkQuery( $('[name="brigade"]') );
			query = query + queryString;
		}
		if ($('[name="division"]') .attr('value') != null) {
			queryString = ' AND division:' + checkQuery( $('[name="division"]') );
			query = query + queryString;
		}
		if ($('[name="corps"]') .attr('value') != null) {
			queryString = ' AND corps:' + checkQuery( $('[name="corps"]') );
			query = query + queryString;
		}
		if ($('[name="state"]') .attr('value') != null) {
			queryString = ' AND state:' + checkQuery( $('[name="state"]') );
			query = query + queryString;
		}
		if ($('[name="commander"]') .attr('value') != null) {
			queryString = ' AND commander:' + checkQuery( $('[name="commander"]') );
			query = query + queryString;
		}
		
		// dates are stored in ISO 8601 standard form (e.g., 1864-12-31T00:00:00Z)
		if ($('[name="start_year"]').attr('value') != null) {
			start_date = $('[name="start_year"]').attr('value');
			if ($('[name="start_month"]').attr('value') != null) {
				start_date = start_date + '-' + $('[name="start_month"]').attr('value'); 
				if ($('[name="start_day"]').attr('value') != null) {
					start_date = start_date + '-' + $('[name="start_day"]').attr('value');
				}
			}
		} else if ($('[name="start_month"]').attr('value') != null || $('[name="start_day"]').attr('value') != null) { 
			alert('please select a year to complete your search by date');
			return false;
		}
		
		if ($('[name="end_year"]').attr('value') != null) {
			end_date = $('[name="end_year"]').attr('value');
			if ($('[name="end_month"]').attr('value') != null) {
				end_date = end_date + '-' + $('[name="end_month"]').attr('value'); 
				if ($('[name="end_day"]').attr('value') != null) {
					end_date = end_date + '-' + $('[name="end_day"]').attr('value');
				}
			}
		} else if ($('[name="end_month"]').attr('value') != null || $('[name="end_day"]').attr('value') != null) { 
			alert('please select a year to complete your search by date');
			return false;
		}

		var warningString = 'Start of date range must be prior to end of date range.'
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
		alert(warningString);
		return false;
		}
		
		if (start_date != null) {
			queryString = ' AND battle_date:[' + start_date + ' TO *]';
			query = query + queryString;		
		} 
		if (end_date != null) {
			queryString = ' AND battle_date2:[* TO ' + end_date + ']';
			query = query + queryString;
		}
		
		
        var url = document.mapdataSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value');
//alert(url);
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
		
	});
	
/* hide no-javascript warning on load */
$('#no-javascript').remove();
    	
});
