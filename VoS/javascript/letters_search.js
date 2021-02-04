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
    
    $('input#county_default').attr({ 'checked' : 'true'});

/*
	var highlightterm = GetURLParameter('raw_st');
	alert(highlightterm);


	function GetURLParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}

*/    
	$('#people').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_text').click();
            return false;
        }
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
	

	$('#search_button').click(function () {
		var db = 'db:xml_letters';
		var query = db;
		var queryString;
		var search_text = '';
		var docs = '';
		var year_range = '';
		var author = '';
		var keyword = '';
		var sort = 'valley_id asc';
		var raw_st = '';
		
		//alert("the value is " + db);
		
		if ($('[name="search_text"]') .attr('value') != null){
			queryString = ' AND fulltext:' + checkQuery($('[name="search_text"]'));		
			query = query + queryString;
			raw_st = $('[name="search_text"]') .attr('value');
		} else {
			alert('Please input search text.');
			return false;
		}
		
		if ($('[name="author"]') .attr('value') != null) {
			queryString = ' AND author:' + checkQuery($('[name="author"]'));		
			query = query + queryString;
		}
		
		if ($('[name="keyword"]') .attr('value') != null) {
			queryString = ' AND keyword:' + checkQuery($('[name="keyword"]'));		
			query = query + queryString;
		}
				
		if ($('[name="docs"]') .attr('value') == 'augusta') {
			queryString = ' AND county:augusta';
			query = query + queryString;
		} else if ($('[name="docs"]') .attr('value') == 'franklin') {
			queryString = ' AND county:franklin';
			query = query + queryString;
		}else if ($('[name="docs"]') .attr('value') == 'bureau') {
			queryString = ' AND county:bureau';
			query = query + queryString;
		}

		if ($('[name="begin_year"]') .attr('value') != null && $('[name="end_year"]') .attr('value') != null) {
			queryString = ' AND year:[' + $('[name="begin_year"]') .attr('value') + ' TO ' + $('[name="end_year"]') .attr('value') + ']';
			query = query + queryString;			
		} else if ($('[name="begin_year"]') .attr('value') == null && $('[name="end_year"]') .attr('value') != null) {
			queryString = ' AND year:[* TO ' + $('[name="end_year"]') .attr('value') + ']';
			query = query + queryString;
		} else if ($('[name="begin_year"]') .attr('value') != null && $('[name="end_year"]') .attr('value') == null) {
			queryString = ' AND year:[' + $('[name="begin_year"]') .attr('value') + ' TO *]';
			query = query + queryString;
		}
		
		if ($('[name="grouping"]') .attr('value') == 'title_string') {
			sort = 'title_string asc';
		}
		if ($('[name="grouping"]') .attr('value') == 'year') {
			sort = 'year asc';
		}
		
		var url = document.lettersSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + sort + "&raw_st=" + raw_st;
		//alert(url);
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
	});
	
/* hide no-javascript warning on load */
$('#no-javascript').remove();	
});
