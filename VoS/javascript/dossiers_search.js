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

	

	$('[name="regiment"]') .change(function(){
		var selected_id = $(this) .children("option:selected") .attr('class');
		if(selected_id == 'other_reg'){
			$('[name="other_rgmnt"]') .removeAttr("disabled");
		}
		else{
			$('[name="other_rgmnt"]') .attr('disabled', 'disabled');
		}
	});
	$('[name="rank"]') .change(function(){
		var selected_id = $(this) .children("option:selected") .attr('class');
		if(selected_id == 'other_rank'){
			$('[name="other_rank"]') .removeAttr("disabled");
		}
		else{
			$('[name="other_rank"]') .attr('disabled', 'disabled');
		}
	});
	$('[name="casualty"]') .change(function(){
		var selected_id = $(this) .children("option:selected") .attr('class');
		if(selected_id == 'other_casualty'){
			$('#cas_year-op') .attr('disabled', 'disabled');
			$('[name="cas_year"]') .attr('disabled', 'disabled');
		}
		else{
			$('#cas_year-op') .removeAttr("disabled");
			$('[name="cas_year"]') .removeAttr("disabled");
		}
	});
	$('[name="pers_ev_type"]') .change(function(){
		var selected_id = $(this) .children("option:selected") .attr('class');
		if(selected_id == 'other_pers_ev_type'){
			$('#pers_ev-op') .attr('disabled', 'disabled');
			$('[name="pers_ev"]') .attr('disabled', 'disabled');
		}
		else{
			$('#pers_ev-op') .removeAttr("disabled");
			$('[name="pers_ev"]') .removeAttr("disabled");
		}
	});
	$('[name="mil_rec"]') .change(function(){
		var selected_id = $(this) .children("option:selected") .attr('class');
		if(selected_id == 'other_mil_rec'){
			$('[name="mil_rec_date"]') .attr('disabled', 'disabled');
			$('[name="mil_rec_place"]') .attr('disabled', 'disabled');
			$('[name="other_place"]') .attr('disabled', 'disabled');
		}
		else{
			$('[name="mil_rec_date"]') .removeAttr("disabled");
			$('[name="mil_rec_place"]') .removeAttr("disabled");
		}
	});
	$('[name="mil_rec_place"]') .change(function(){
		var selected_id = $(this) .children("option:selected") .attr('class');
		if(selected_id == 'other_mil_rec_place'){
			$('[name="other_place"]') .removeAttr("disabled");
		}
		else{
			$('[name="other_place"]') .attr('disabled', 'disabled');
		}
	});

	$('.search_button') .click(function () {
		var db = "db:dossiers_*";
		if ($('[name="county_cell"]') .children("input:checked") .attr('value') == 'augusta') {
			db = 'db:dossiers_augusta';
		} else if ($('[name="county_cell"]') .children("input:checked") .attr('value') == 'franklin') {
			db = 'db:dossiers_franklin_full';
		}
		
		var query = db;
		var queryString;
		var sort = $('[name="sort"]').attr('value');

		if ($('[name="last_name"]') .attr('value') != null) {
			queryString = ' AND last:' + checkQuery($('[name="last_name"]'));
			query = query + queryString;
		}
		if ($('[name="first_name"]') .attr('value') != null) {
			queryString = ' AND first:' + checkQuery($('[name="first_name"]'));
			query = query + queryString;
		}
		if ($('[name="date"]') .attr('value') != null) {
			queryString = ' AND year_enl:' + checkQuery($('[name="date"]'));
			query = query + queryString;
		}
		if ($('[name="place_enl"]') .attr('value') != null) {
			queryString = ' AND place_enl:' + checkQuery($('[name="place_enl"]'));
			query = query + queryString;
		}
		if ($('[name="occ_enl"]') .attr('value') != null) {
			queryString = ' AND occ_enl:' + checkQuery($('[name="occ_enl"]'));
			query = query + queryString;
		}
		
		var age_enl = $('[name="age_enl"]') .attr('value');
		if (age_enl != null) {
			var age_enl_op = $('#age_enl-op') .attr('value');
			if (age_enl_op == 'gt') {
				queryString = ' AND age_enl:[' + age_enl + ' TO *] NOT age_enl:' + age_enl;
			} else if (age_enl_op == 'equal') {
				queryString = ' AND age_enl:' + age_enl;
			} else if (age_enl_op == 'lt') {
				queryString = ' AND age_enl:[* TO ' + age_enl + '] NOT age_enl:' + age_enl;
			} else if (age_enl_op == 'not') {
				queryString = ' NOT age_enl:' + age_enl;
			}
			query = query + queryString;
		}
		
		if ($('[name="regiment"]') .attr('value') != null && $('[name="regiment"]') .attr('value') != 'other') {
			queryString = ' AND regiment:' + checkQuery($('[name="regiment"]'));
			query = query + queryString;
		} else if ($('[name="regiment"]') .attr('value') != null && $('[name="regiment"]') .attr('value') == 'other') {
			queryString = ' AND regiment:' + checkQuery($('[name="other_rgmnt"]'));
			query = query + queryString;
		}
		
		if ($('[name="company"]') .attr('value') != null) {
			queryString = ' AND company:' + checkQuery($('[name="company"]'));
			query = query + queryString;
		}
		
		if ($('[name="rank"]') .attr('value') != null && $('[name="rank"]') .attr('value') != 'other') {
			queryString = ' AND rank_enl:' + checkQuery($('[name="rank"]'));
			query = query + queryString;
		} else if ($('[name="rank"]') .attr('value') != null && $('[name="rank"]') .attr('value') == 'other') {
			queryString = ' AND rank_enl:' + checkQuery($('[name="other_rank"]'));
			query = query + queryString;
		}
		
		if ($('[name="casualty"]') .attr('value') != null && $('[name="cas_year"]') .attr('value') == null) {
			queryString = ' AND ' + $('[name="casualty"]') .attr('value') + ':[* TO *]';
			query = query + queryString;
		}
		
		if ($('[name="pers_ev_type"]') .attr('value') != null && $('[name="pers_ev"]') .attr('value') == null) {
			queryString = ' AND ' + $('[name="pers_ev_type"]') .attr('value') + ':[* TO *]';
			query = query + queryString;
		}
		
		
		var cas_year = $('[name="cas_year"]') .attr('value');
		if (cas_year != null) {
			var cas_year_op = $('#cas_year-op') .attr('value');
			
			var abbr_cas;
			if($('[name="casualty"]') .attr('value') == 'dead_wounds'){
				abbr_cas = 'dow';
			}
			else if($('[name="casualty"]') .attr('value') == 'dead_disease'){
				abbr_cas = 'dod';
			}
			else{
				abbr_cas = $('[name="casualty"]') .attr('value');
			}
			
			if (cas_year_op == 'gt') {
				queryString = ' AND ' + abbr_cas + '_year:[' + cas_year + ' TO *] NOT ' + abbr_cas + '_year:' + cas_year;
			} else if (cas_year_op == 'equal') {
				queryString = ' AND ' + abbr_cas + '_year:' + cas_year;
			} else if (cas_year_op == 'lt') {
				queryString = ' AND ' + abbr_cas + '_year:[* TO ' + cas_year + '] NOT ' + abbr_cas + '_year:' + cas_year;
			} else if (cas_year_op == 'not') {
				queryString = ' NOT ' + abbr_cas + '_year:' + cas_year;
			}
			query = query + queryString;
		}
		
		
		var pers_ev = $('[name="pers_ev"]') .attr('value');
		if (pers_ev != null) {
			var pers_ev_op = $('#pers_ev-op') .attr('value');
			if (pers_ev_op == 'gt') {
				queryString = ' AND ' + $('[name="pers_ev_type"]') .attr('value') + '_year:[' + pers_ev + ' TO *] NOT ' + $('[name="pers_ev_type"]') .attr('value') + '_year:' + pers_ev;
			} else if (pers_ev_op == 'equal') {
				queryString = ' AND ' + $('[name="pers_ev_type"]') .attr('value') + '_year:' + pers_ev;
			} else if (pers_ev_op == 'lt') {
				queryString = ' AND ' + $('[name="pers_ev_type"]') .attr('value') + '_year:[* TO ' + pers_ev + '] NOT ' + $('[name="pers_ev_type"]') .attr('value') + '_year:' + pers_ev;
			} else if (pers_ev_op == 'not') {
				queryString = ' NOT ' + $('[name="pers_ev_type"]') .attr('value') + '_year:' + pers_ev;
			}
			query = query + queryString;
		}
		
		if ($('[name="mil_rec"]') .attr('value') != null) {
			queryString = ' AND ' + $('[name="mil_rec"]') .attr('value') + ':[* TO *]';
			query = query + queryString;
		}
		
		if ($('[name="mil_rec_date"]') .attr('value') != null) {
			queryString = ' AND ' + $('[name="mil_rec"]') .attr('value') + ':' + $('[name="mil_rec_date"]') .attr('value');
			query = query + queryString;
		}
		if ($('[name="mil_rec"]') .attr('value') != null && $('[name="mil_rec_place"]') .attr('value') != null && $('[name="mil_rec_place"]') .attr('value') != 'other') {
			var place=checkQuery($('[name="mil_rec_place"]'));
			queryString = ' AND ' + $('[name="mil_rec"]') .attr('value') + ':' + place;
			query = query + queryString;
		} else if ($('[name="mil_rec"]') .attr('value') != null && $('[name="mil_rec_place"]') .attr('value') == 'other') {
			queryString = ' AND ' + $('[name="mil_rec"]') .attr('value') + ':' + checkQuery($('[name="other_place"]'));
			query = query + queryString;
		} else if ($('[name="mil_rec"]') .attr('value') == null && $('[name="mil_rec_place"]') .attr('value') == 'other') {
			var place=checkQuery($('[name="other_place"]'));
			queryString = ' AND (promotions:' + place + ' OR transfers:' + place + ' OR hospital_record:' + place + ')';
			query = query + queryString;
		} else if ($('[name="mil_rec"]') .attr('value') == null && $('[name="mil_rec_place"]') .attr('value') != 'other' && $('[name="mil_rec_place"]') .attr('value') != null) {
			var place=checkQuery($('[name="mil_rec_place"]'));
			queryString = ' AND (promotions:' + place + ' OR transfers:' + place + ' OR hospital_record:' + place + ')';
			query = query + queryString;
		} 
		// final check on query
		if (query == null) {
			query = "db:dossiers_*";
		}
		var url = document.dossiersSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + '&sort=' + sort;
		window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;
		
	});
	
/* hide no-javascript warning on load */
$('#no-javascript').remove();
});
