$(document) .ready(function () {

/* hide no-javascript warning on load */
$('#no-javascript').remove();


/* Make sure you amend the form action when switching the 'year' radio buttons: the 'both' value alters the URL!!  */

$('td#year_cell input').click(function () {
    $('td#year_cell input').removeAttr("checked");
    $(this).attr({ checked: "checked" });
    var whichYear = $(this).attr('value');
    if ( whichYear == 'both' ) {
    $('form#basic_census') .attr({'action' : 'census_dual_search_results' });
    } else {
    $('form#basic_census') .attr({'action' : 'census_search_results' });
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

    $('input.text').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
    });

	$('#search_button') .click(function () {
		var query;
		var last = '';
		var first = '';
		var age_range = '';
		var head_num_range = '';
		var persests_range = '';
		var realests_range = '';
		var occupation = '';
		var birth_place = '';
		var married = '';
		var school = '';
		var readwrite = '';
		var handicap = '';
		var read = '';
		var write = '';
		var male_21 = '';
		var male_novote = '';
		var for_father = '';
		var for_mother = '';
		var subdistrict = '';
		var district = '';
		var post_office = '';
		var page_num_range = '';
		var dwelling_num_range = '';
		var family_num_range = '';

		var sort_order = '';

		var detailed = $('#census_interface_marker') .attr('value');

		var color  = $('#color_cell') .children("input:checked") .attr('value');
		var year   = $('#year_cell') .children("input:checked") .attr('value');
		var county = $('#county_cell') .children("input:checked") .attr('value');
		var sex    = $('#sex_cell') .children("input:checked") .attr('value');

		var db;
		if (year == '1860' && county == 'aug') {
			db = 'db:pop_aug_60';
		}
		else if (year == '1860' && county == 'fr') {
			db = 'db:pop_fr_60';
		}
		else if (year == '1870' && county == 'aug') {
			db = 'db:pop_aug_70';
		}
		else if (year == '1870' && county == 'fr') {
			db = 'db:[pop_fr_70 TO pop_fr_70_v2]';
		}

		if ($('#last_name') .attr('value') != null){
			last = ' AND last:' + $('#last_name') .attr('value');
		}
		if ($('#first_name') .attr('value') != null){
			first = ' AND first:' + $('#first_name') .attr('value');
		}
		if ($('#occupation') .attr('value') != null){
			occupation = ' AND occupation:' + checkQuery( $('#occupation') );
		}
		if ($('#birth_place') .attr('value') != null){
			birth_place = ' AND birth_place:' + checkQuery( $('#birth_place') );
		}

		var age = $('#age') .attr('value');
		if (age != null){
			var ages_op = $('#ages-op') .attr('value');
			if (ages_op == 'gt'){
				age_range = ' AND age:[' + age + ' TO *] NOT age:' + age;
			}
			else if (ages_op == 'equal'){
				age_range = ' AND age:' + age;
			}
			else if (ages_op == 'lt'){
				age_range = ' AND age:[* TO ' + age + '] NOT age:' + age;
			}
			else if (ages_op == 'not'){
				age_range = ' NOT age:' + age;
			}
		}
		var age2 = $('#age2') .attr('value');
		if (age2 != null){
			var ages_op2 = $('#ages-op2') .attr('value');
			if (ages_op2 == 'gt'){
				age_range2 = ' AND age:[' + age2 + ' TO *] NOT age:' + age2;
			}
			else if (ages_op2 == 'equal'){
				age_range = ' AND age:' + age2;
			}
			else if (ages_op2 == 'lt'){
				age_range2 = ' AND age:[* TO ' + age2 + '] NOT age:' + age2;
			}
			else if (ages_op2 == 'not'){
				age_range2 = ' NOT age:' + age2;
			}
		}
		var head_num = $('#head_num') .attr('value');
		if (head_num != null){
			var head_op = $('#head-op') .attr('value');
			if (head_op == 'gt'){
				head_num_range = ' AND head_num:[' + head_num + ' TO *] NOT head_num:' + head_num;
			}
			else if (head_op == 'equal'){
				head_num_range = ' AND head_num:' + head_num;
			}
			else if (head_op == 'lt'){
				head_num_range = ' AND head_num:[* TO ' + head_num + '] NOT head_num:' + head_num;
			}
			else if (head_op == 'not'){
				head_num_range = ' NOT head_num:' + head_num;
			}
		}

		var realest_value = $('#realests') .attr('value');
		if (realest_value != null){
			var realests_op = $('#realests-op') .attr('value');
			if (realests_op == 'gt'){
				realests_range = ' AND realest:[' + realest_value + ' TO *] NOT realest:' + realest_value;
			}
			else if (realests_op == 'equal'){
				realests_range = ' AND realest:' + realest_value;
			}
			else if (realests_op == 'lt'){
				realests_range = ' AND realest:[* TO ' + realest_value + '] NOT realest:' + realest_value;
			}
			else if (realests_op == 'not'){
				realests_range = ' NOT realest:' + realest_value;
			}
		}

		var persest_value = $('#persests') .attr('value');
		if (persest_value != null){
			var persests_op = $('#persests-op') .attr('value');
			if (persests_op == 'gt'){
				persests_range = ' AND persest:[' + persest_value + ' TO *] NOT persest:' + persest_value;
			}
			else if (persests_op == 'equal'){
				persests_range = ' AND persest:' + persest_value;
			}
			else if (persests_op == 'lt'){
				persests_range = ' AND persest:[* TO ' + persest_value + '] NOT persest:' + persest_value;
			}
			else if (persests_op == 'not'){
				persests_range = ' NOT persest:' + persest_value;
			}
		}
		if (color == null){
			color = '';
		}
		else{
			color = ' AND ' + color;
		}

		if (sex == null){
			sex = '';
		}
		else{
			sex = ' AND sex:' + sex;
		}

		var county_reg;
		var state;
		if (county == 'fr'){
			county_reg = 'Franklin';
			state = 'Pennsylvania';
		}
		else if (county == 'aug'){
			county_reg = 'Augusta';
			state = 'Virginia';
		}

		if ($('#married_cell') .children("input:checked") .attr('value') != null){
			married = $('#married_cell') .children("input:checked") .attr('value');
		}

		if ($('#school_cell_1860') .children("input:checked") .attr('value') != null || $('#school_cell_1870') .children("input:checked") .attr('value') != null){
			if (year == '1860'){
				school = $('#school_cell_1860') .children("input:checked") .attr('value');
			}
			else if (year == '1870'){
				school = $('#school_cell_1870') .children("input:checked") .attr('value');
			}
		}

		if ($('#readwrite_cell') .children("input:checked") .attr('value') != null){
			readwrite = $('#readwrite_cell') .children("input:checked") .attr('value');
		}

		if ($('#handicap_1860') .attr('value') != null || $('#handicap_1870') .attr('value') != null){
			if (year == '1860'){
				handicap = $('#handicap_1860') .attr('value');
			}
			else if (year == '1870'){
				handicap = $('#handicap_1870') .attr('value');
			}
		}

		if ($('#read_cell') .children("input:checked") .attr('value') != null){
			read = $('#read_cell') .children("input:checked") .attr('value');
		}
		if ($('#write_cell') .children("input:checked") .attr('value') != null){
			write = $('#write_cell') .children("input:checked") .attr('value');
		}
		if ($('#male_21_cell') .children("input:checked") .attr('value') != null){
			male_21 = $('#male_21_cell') .children("input:checked") .attr('value');
		}
		if ($('#male_novote_cell') .children("input:checked") .attr('value') != null){
			male_novote = $('#male_novote_cell') .children("input:checked") .attr('value');
		}
		if ($('#for_father_cell') .children("input:checked") .attr('value') != null){
			for_father = $('#for_father_cell') .children("input:checked") .attr('value');
		}
		if ($('#for_mother_cell') .children("input:checked") .attr('value') != null){
			for_mother = $('#for_mother_cell') .children("input:checked") .attr('value');
		}

		if ($('#subdistrict') .attr('value') != null){
			subdistrict = ' AND subdistrict_text:' + checkQuery( $('#subdistrict') );
		}

		if ($('#district') .attr('value') != null){
			district = ' AND district_text:' + checkQuery( $('#district') );
		}

		if ($('#post_office') .attr('value') != null){
			post_office = ' AND post_office_text:' + checkQuery( $('#post_office') );
		}

		var page_num_value = $('#page_num') .attr('value');
		if (page_num_value != null){
			var page_num_op = $('#page_num-op') .attr('value');
			if (page_num_op == 'gt'){
				page_num_range = ' AND page_num:[' + page_num_value + ' TO *] NOT page_num:' + page_num_value;
			}
			else if (page_num_op == 'equal'){
				page_num_range = ' AND page_num:' + page_num_value;
			}
			else if (page_num_op == 'lt'){
				page_num_range = ' AND page_num:[* TO ' + page_num_value + '] NOT page_num:' + page_num_value;
			}
			else if (page_num_op == 'not'){
				page_num_range = ' NOT page_num:' + page_num_value;
			}
		}

		var family_num_value = $('#family_num') .attr('value');
		if (family_num_value != null){
			var family_num_op = $('#family_num-op') .attr('value');
			if (family_num_op == 'gt'){
				family_num_range = ' AND family_num:[' + family_num_value + ' TO *] NOT family_num:' + family_num_value;
			}
			else if (family_num_op == 'equal'){
				family_num_range = ' AND family_num:' + family_num_value;
			}
			else if (family_num_op == 'lt'){
				family_num_range = ' AND family_num:[* TO ' + family_num_value + '] NOT family_num:' + family_num_value;
			}
			else if (family_num_op == 'not'){
				family_num_range = ' NOT family_num:' + family_num_value;
			}
		}

		var dwelling_num_value = $('#dwelling_num') .attr('value');
		if (dwelling_num_value != null){
			var dwelling_num_op = $('#dwelling_num-op') .attr('value');
			if (dwelling_num_op == 'gt'){
				dwelling_num_range = ' AND dwelling_num:[' + dwelling_num_value + ' TO *] NOT dwelling_num:' + dwelling_num_value;
			}
			else if (dwelling_num_op == 'equal'){
				dwelling_num_range = ' AND dwelling_num:' + dwelling_num_value;
			}
			else if (dwelling_num_op == 'lt'){
				dwelling_num_range = ' AND dwelling_num:[* TO ' + dwelling_num_value + '] NOT dwelling_num:' + dwelling_num_value;
			}
			else if (dwelling_num_op == 'not'){
				dwelling_num_range = ' NOT dwelling_num:' + dwelling_num_value;
			}
		}

		/*SORT ORDER */
		if ($('#result_order') .attr('value') == 'name'){
			sort_order = 'last asc, first asc';
		}
		else if ($('#result_order') .attr('value') == 'family_num'){
			sort_order = 'family_num asc';
		}
	    else if ($('#result_order') .attr('value') == 'location'){
			if (year == '1860'){
				sort_order = 'subdistrict asc';
			}
			else if (year == '1870'){
				sort_order = 'district asc, post_office asc';
			}
		}
		/*HIDE SEARCH FORM AND HEADER INFORMATION*/
		/* $('#form') .hide(); */

		/* changes to form regardless of search type */
        $('input#sort') .attr({'value' : sort_order });


		/* BEGIN QUERIES */
		/* Note: for queries on both census years, form action must be changed to reflect custom pipeline */
		if (year == 'both'){
			if (county == 'aug'){
				query = last + first + age_range + persests_range + realests_range + color + sex + occupation + birth_place;
				$('#search') .html('');
				/* change the pipeline URL specified in the form ACTION attribute */
				$('form#basic_census') .attr({'action' : 'census_dual_search_results' });
				$('input#query') .attr({'value' : query});
				$('input#db1') .attr({'value' : 'db1:pop_aug_60' });
				$('input#db2') .attr({'value' : 'db2:pop_aug_70' });

			};
			if (county == 'fr'){
				query = last + first + age_range + persests_range + realests_range + color + sex + occupation + birth_place;
				$('#search') .html('');
				/* change the pipeline URL specified in the form ACTION attribute */
				$('form#basic_census') .attr({'action' : 'census_dual_search_results' });
				$('input#query') .attr({'value' : query});
				$('input#db1') .attr({'value' : 'db1:pop_fr_60' });
				$('input#db2') .attr({'value' : 'db2:[pop_fr_70 TO pop_fr_70_v2]' });


			}
		/*
			$('#search') .html('<h1 style="color: rgb(153, 0, 0); text-align: center;">Results from Searching Both Censuses</h1>  <b>Please cite results as coming from:</b> ' + county_reg + ' County, ' + state +
			', 1860 & 1870 Population Census, Valley of the Shadow: Two Communities in the American Civil War, Virginia Center for Digital History, University of Virginia (http://valley.vcdh.virginia.edu/govdoc/census.both.html).' + '<p>' + query1 + '</p>');
		*/
		}
		else{
		/* searching a single census year -- not two */
			$('#search1') .html('');
			$('#search2') .html('');
			query = db + last + first + age_range + age_range2 + persests_range + realests_range + color + sex + occupation + birth_place + head_num_range + married + school + readwrite + handicap +
			read + write + male_21 + male_novote + for_father + for_mother + subdistrict + district + post_office + page_num_range + dwelling_num_range + family_num_range + county_reg + year;
		$('input#query') .attr({'value' : query});
		$('input#db') .attr({'value' : db });
		$('input#db1').remove();
		$('input#db2').remove();
		$('input#query1').remove();
		$('input#query2').remove();
		$('input#query_dual').remove();
		/*
		$.get('census_search_results', {
			q : query, start:0, rows:50, year:year, county:county_reg, detailed:'no', sort:sort_order
				},function (data) {
				$('#search') .html(data);
			});
			*/
		}
	});
});
