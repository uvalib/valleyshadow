$(function () {	
// NOTE: this form has two submit buttons!
 /* disable submit click event propagation to prevent conflict with form submit event */
    $('#search_button').click( function (event) {
        event.stopPropagation();
        event.preventDefault(); 
    });
    $('#search_button').submit( function (event) {
        event.stopPropagation();
        event.preventDefault(); 
    });
    $('#browse_button').click( function (event) {
        event.stopPropagation();
        event.preventDefault(); 
    });
    $('#browse_button').submit( function (event) {
        event.stopPropagation();
        event.preventDefault(); 
    });
    var keywordQuery = '';
    var db = 'db:xml_claims';

    
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

    function checkRange() {
    	if ( parseInt($('[name="start_year"]').attr('value')) > parseInt($('[name="start_year"]').attr('value')) ) {
			alert('Please select a start year that precedes the end year of your date range.');
			return false;
		} else { 
		return true; 
		}
    };
	

    $('#people').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
    });
    
	$('[name="keyword"]') .change(function () {
		keywordQuery = ' AND keyword:"' +$(this).children("option:selected").attr('value') + '"'; // quoting is important here.
	});
	
	
	$('#search_button') .click(function () {
		if ($('[name="search_text"]') .attr('value') == null) {
			alert('Please input search text.');
			return false;
		}
        var rangeValidation=checkRange();
		if (rangeValidation != true) { return false; }
		
		var query = db + ' AND fulltext:' + $('[name="search_text"]') .attr('value');
		var year_range = '';
		if ($('[name="start_year"]') .attr('value') != null || $('[name="end_year"]') .attr('value') != null) {
			var start = $('[name="start_year"]') .attr('value');
			var end = $('[name="end_year"]') .attr('value');
			if (start == null) {
				start = '*';
			}
			if (end == null) {
				end = '*';
			}
			year_range = ' AND year:[' + start + ' TO ' + end + ']';
			query = query + year_range;
		}

        var url = document.soclaimsSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value');
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
	
	});
	
	$('#browse_button') .click(function () {
	    var query = db + keywordQuery; 
	    var url = document.soclaimsBrowseForm.action + "?q=" + query + "&rows=" + $('#browse_rows').attr('value')  + "&start=" + $('#browse_start').attr('value');
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
	});
		
/* hide no-javascript warning on load */
$('#no-javascript').remove();
    
});
