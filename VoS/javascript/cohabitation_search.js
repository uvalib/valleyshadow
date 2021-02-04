$(function () {
// this form is unusual in that is has wildcard name searches built into the form
// the values in each option are used to build a solr query e.g., search on A has value="a*"

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
		var db = 'db:cohabitation_1866';
		var query = db;
		var queryString;
		
		/* HUSBAND */
		if ($('[name="cohab_husband_last_name"]') .attr('value') != null){
			queryString = ' AND cohab_husband_last_name:' + checkQuery($('[name="cohab_husband_last_name"]'));
			query = query + queryString;
		}
		
		if ($('[name="cohab_husband_occupation"]') .attr('value') != null){
			queryString = ' AND cohab_husband_occupation:' + checkQuery($('[name="cohab_husband_occupation"]'));
			query = query + queryString;
		}
		
		if ($('[name="cohab_husband_birth_place"]') .attr('value') != null){
			queryString = ' AND cohab_husband_birth_place:' + checkQuery($('[name="cohab_husband_birth_place"]'));
			query = query + queryString;
		}
		
		var cohab_husband_age_min = $('[name="cohab_husband_age_min"]') .attr('value');
		var cohab_husband_age_max = $('[name="cohab_husband_age_max"]') .attr('value');
		
		if (cohab_husband_age_min != null || cohab_husband_age_max != null){
			if (cohab_husband_age_min != null && cohab_husband_age_max == null){
				queryString = ' AND cohab_husband_age:[' + cohab_husband_age_min + ' TO *]';
			}
			else if (cohab_husband_age_min == null && cohab_husband_age_max != null){
				queryString = ' AND cohab_husband_age:[* TO ' + cohab_husband_age_max + ']';
			}
			else if (cohab_husband_age_min != null && cohab_husband_age_max != null){
				queryString = ' AND cohab_husband_age:[' + cohab_husband_age_min + ' TO ' + cohab_husband_age_max + ']';
			}
			query = query + queryString;
		}
		
		/* WIFE */
		if ($('[name="cohab_wife_last_name"]') .attr('value') != null){
			queryString = ' AND cohab_wife_last_name:' + checkQuery($('[name="cohab_wife_last_name"]') );
			query = query + queryString;
		}
		
		if ($('[name="cohab_wife_occupation"]') .attr('value') != null){
			queryString = ' AND cohab_wife_occupation:' + checkQuery($('[name="cohab_wife_occupation"]') );
			query = query + queryString;
		}
		
		if ($('[name="cohab_wife_birth_place"]') .attr('value') != null){
			queryString = ' AND cohab_wife_birth_place:' + checkQuery($('[name="cohab_wife_birth_place"]') );
			query = query + queryString;
		}
		
		var cohab_wife_age_min = $('[name="cohab_wife_age_min"]') .attr('value');
		var cohab_wife_age_max = $('[name="cohab_wife_age_max"]') .attr('value');
		
		if (cohab_wife_age_min != null || cohab_wife_age_max != null){
			if (cohab_wife_age_min != null && cohab_wife_age_max == null){
				queryString = ' AND cohab_wife_age:[' + cohab_wife_age_min + ' TO *]';
			}
			else if (cohab_wife_age_min == null && cohab_wife_age_max != null){
				queryString = ' AND cohab_wife_age:[* TO ' + cohab_wife_age_max + ']';
			}
			else if (cohab_wife_age_min != null && cohab_wife_age_max != null){
				queryString = ' AND cohab_wife_age:[' + cohab_wife_age_min + ' TO ' + cohab_wife_age_max + ']';
			}
			query = query + queryString;
		}
		
		/*RESIDENCE*/
		
		if ($('[name="cohab_current_residence"]') .attr('value') != null){
			queryString = ' AND cohab_current_residence:' + checkQuery($('[name="cohab_current_residence"]'));
			query = query + queryString;
		}
		
		/* NUMBER OF CHILDREN */
		var cohab_num_children_min = $('[name="cohab_num_children_min"]') .attr('value');
		var cohab_num_children_max = $('[name="cohab_num_children_max"]') .attr('value');
		
		if (cohab_num_children_min != null || cohab_num_children_max != null){
			if (cohab_num_children_min != null && cohab_num_children_max == null){
				queryString = ' AND cohab_num_children:[' + cohab_num_children_min + ' TO *]';
			}
			else if (cohab_num_children_min == null && cohab_num_children_max != null){
				queryString = ' AND cohab_num_children:[* TO ' + cohab_num_children_max + ']';
			}
			else if (cohab_num_children_min != null && cohab_num_children_max != null){
				queryString = ' AND cohab_num_children:[' + cohab_num_children_min + ' TO ' + cohab_num_children_max + ']';
			}
			query = query + queryString;
		}
		
		var sort = $('[name="sort"]') .attr('value');
		
		var url = document.cohabitationSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + sort;
		window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;

		
	});
	
/* hide no-javascript warning on load*/
$('#no-javascript').remove();

});
