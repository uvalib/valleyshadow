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
	 
	
	
	$('[name="place"]') .change(function () {
		var selected_id = $(this) .children("option:selected") .attr('value');
		if (selected_id == 'other') {
			$('[name="other_place"]') .removeAttr("disabled");
		} else {
			$('[name="other_place"]') .attr('disabled', 'disabled');
		}
	});
	
	$(function(){
    $('input').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
    });
});

	$('#search_button') .click(function () {
		var db = 'db:images';
		var query = db;
		var queryString;
	
		
		if ($('[name="place"]') .attr('value') != 'all' && $('[name="place"]') .attr('value') != 'other') {
			queryString = ' AND place_name:' + checkQuery($('[name="place"]'));
			query = query + queryString;
		} else if ($('[name="place"]') .attr('value') == 'other') {
			if ($('[name="other_place"]') .attr('value') != null) {
				queryString = ' AND place_name:' + checkQuery($('[name="other_place"]'));
				query = query + queryString;
			}
		}
		
		if ($('[name="subject_type"]') .attr('value') != 'all') {
			queryString = ' AND subject_type:' + checkQuery($('[name="subject_type"]'));
			query = query + queryString;
		}
		
		if ($('[name="orig_location"]') .attr('value') != 'all') {
			queryString = ' AND orig_location:' + checkQuery($('[name="orig_location"]'));
			query = query + queryString;
		}
		
		if ($('[name="people"]') .attr('value') != null) {
			queryString = ' AND people_name:' + checkQuery($('[name="people"]'));
			query = query + queryString;
		}
		
		
		var url = document.imageSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value');
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
	});
	
/* hide no-javascript warning on load */
$('#no-javascript').remove();
});
