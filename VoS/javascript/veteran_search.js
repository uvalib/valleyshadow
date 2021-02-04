$(document).ready(function() {
 /* disable submit click event propagation to prevent conflict with form submit event */
    $('#search_button').click( function (event) {
        event.stopPropagation();
        event.preventDefault(); 
    });
    $('#search_button').submit( function (event) {
        event.stopPropagation();
        event.preventDefault(); 
    });
    
    $('input#county_default').attr({ 'checked' : 'true'});


    
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
	


    $('input.textField').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
    });

	$('#search_button') .click(function () {
	
		var db;
		if ($('#county_cell') .children("input:checked") .attr('value') == 'augusta') {
			db = 'db:vet_census_aug_90';
		}
		else if ($('#county_cell') .children("input:checked") .attr('value') == 'franklin') {
			db = 'db:vet_census_90';
		}
		var query = db;
        var sort = $('input[name="sort"]') .attr('value');
        var queryString = '';
		
		if ($('input[name="last_name"]') .attr('value') != null){
			queryString = ' AND last:' + checkQuery( $('input[name="last_name"]') );
			query = query + queryString;
		}
		if ($('input[name="first_name"]') .attr('value') != null){
			queryString = ' AND first:' + checkQuery( $('input[name="first_name"]') );
			query = query + queryString;
		}	
		if ($('input[name="company"]') .attr('value') != null){
			queryString = ' AND company:' + checkQuery( $('input[name="company"]') );
			query = query + queryString;
		}
		if ($('input[name="location"]') .attr('value') != null){
			queryString = ' AND location:' + checkQuery( $('input[name="location"]') );
			query = query + queryString;
		}
		if ($('select[name="rank"]') .attr('value') != null){
			queryString = ' AND rank:' + checkQuery( $('select[name="rank"]') );
			query = query + queryString;
		}
		if ($('select[name="regiment"]') .attr('value') != null){
			queryString = ' AND regiment:' + checkQuery( $('select[name="regiment"]') );
			query = query + queryString;
		}		
		
		$('input[name="sort"]') .attr('value', sort);
        $('input[name="q"]') .attr('value', query);
        $('input[name="db"]') .attr('value', db);
        var url = document.veteranSearch.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + $('[name="sort"]').attr('value') + "&county=" + $('#county_cell') .children("input:checked") .attr('value');
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
        
	}); 
	
		
/* hide no-javascript warning on load */
$('#no-javascript').remove();

});
