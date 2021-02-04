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
	
	$('input') .click(function (e) {
			if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
	});


	$('#search_button') .click(function () {
		var db = 'xml_diaries';
		var query = "db:" + db;
		var queryString;
		var sort = 'score asc';
		
		if ($('[name="search_text"]') .attr('value') != null) {
			queryString = " AND fulltext:" + checkQuery($('[name="search_text"]'));
			query = query + queryString;
			raw_st = $('[name="search_text"]').attr('value');
		} else {
			alert('Please input search text.');
			return false;
		}
		
		if ($('[name="docs"]').attr('value')) {
			if ($('[name="docs"]').attr('value') == 'augusta' || $('[name="docs"]').attr('value') == 'franklin') {
				queryString = " AND county:" + checkQuery($('[name="docs"]'));
			} else {
				queryString = " AND keyword:" + checkQuery($('[name="docs"]'));
			}
			query = query + queryString;
		}
		
		if ($('[name="begin_year"]') .attr('value') != null || $('[name="end_year"]') .attr('value') != null) {
			if ( $('[name="begin_year"]') .attr('value') && $('[name="end_year"]') .attr('value') ) {
				queryString = ' AND year:[' + $('[name="begin_year"]') .attr('value') + ' TO ' + $('[name="end_year"]') .attr('value') + ']';
			} else if ($('[name="begin_year"]') .attr('value')) {
				queryString = ' AND year:[' + $('[name="begin_year"]') .attr('value') + ' TO *]';
			} else if ($('[name="end_year"]') .attr('value')) {
				queryString = ' AND year:[* TO ' + $('[name="end_year"]') .attr('value') + ']';
			}
			query = query + queryString;
		}
		
		if ($('[name="sort"]') .attr('value')) {
			sort = $('[name="sort"]') .attr('value');
		}
				
		
        var url = document.diariesSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + sort + "&raw_st=" + raw_st;
		window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
	});
		
/* hide no-javascript warning on load */
$('#no-javascript').remove();
    
});
