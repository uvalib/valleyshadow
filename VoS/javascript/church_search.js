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

	


$('input').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
    });
    
	$('#search_button') .click(function () {
		var db = $('select[name="church"]') .children("option:selected") .attr('class');
		
		if (db == null ) {
			alert('please select a church or county to search');
			return false;
		}
		var query = "db:" + db;
		var queryString;
		var sort = $('[name="sort"]') .attr('value');

		if ($('[name="last"]') .attr('value') != null) {
			queryString = ' AND last:' + checkQuery($('[name="last"]'));
			query = query + queryString;
		}
		if ($('[name="first"]') .attr('value') != null) {
			queryString = ' AND first:' + checkQuery($('[name="first"]'));
			query = query + queryString;
		}
		if ($('[name="church"]') .attr('value') != null && $('[name="church"]') .attr('value') != "[* TO *]" ) {
			queryString = ' AND church:' + checkQuery($('[name="church"]'));
			query = query + queryString;
		}

		var url = document.churchSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + sort + "&county=" + db;
		window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
	});
		
/* hide no-javascript warning on load*/
$('#no-javascript').remove();
});
