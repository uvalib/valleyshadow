$(document).ready(function() {
    $('input#county_default').attr({ 'checked' : 'true'});
    $('.augusta_form').show();

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


    function buildRange(rangeTerm, solrFieldName, rangeOp) {
        // this is a general method for building range queries for solr/lucene
        // note it includes boolean operator, so must be used on 2nd and later query fields

        var queryTerm = ' AND ' + solrFieldName + ':' + rangeTerm;
        if (rangeOp == '>' || rangeOp == 'gt') {
            queryTerm = ' AND ' + solrFieldName + ':' + '[' + rangeTerm + ' TO *]';
        } else if (rangeOp == '<' || rangeOp == 'lt') {
            queryTerm = ' AND ' + solrFieldName + ':' + '[* TO ' + rangeTerm + ']';
        } else if (rangeOp == '<>' || rangeOp == '><'   || rangeOp == 'not' ) {
            queryTerm = ' NOT ' + solrFieldName + ':' + rangeTerm;
        } else if (rangeOp == '' || rangeOp == 'equal' ) {
            // do nothing
        } else { queryTerm = ''; }

        return queryTerm;
    };



    $('#people').keydown(function(e){
        if (e.keyCode == 13) {
            $('#search_button').click();
            return false;
        }
    });

	$('#county_cell') .children("input").click(function () {
		if ($(this) .attr('value') == 'augusta' ) {
			$('.augusta_form').show();
			$('.franklin_form') .hide();
			$('.franklin_form') .children('td') .children('input') .each(function(){
				var type = this.type;
				var tag = this.tagName.toLowerCase();

    				if (type == 'text'){
					this.value = "";
				}
    				else if (type == 'checkbox' || type == 'radio'){
					this.checked = false;
				}
				else if (tag == 'select'){
	      				this.selectedIndex = -1;
	      			}
			});
		} else if ($(this) .attr('value') == 'franklin') {
			$('.augusta_form') .hide();
			$('.franklin_form') .show();
			$('.augusta_form') .children('td') .children('input') .each(function(){
				var type = this.type;
				var tag = this.tagName.toLowerCase();

    				if (type == 'text'){
					this.value = "";
				}
    				else if (type == 'checkbox' || type == 'radio'){
					this.checked = false;
				}
				else if (tag == 'select'){
	      				this.selectedIndex = -1;
	      			}
			});

		}
	});

	$('#search_button') .click(function () {

		var db;
    var cnty;

		if ($('#county_cell') .children("input:checked") .attr('value') == 'augusta') {
			db = 'db:tax_staunton_60';
      cnty = "augusta";
		}
		else if ($('#county_cell') .children("input:checked") .attr('value') == 'franklin') {
			db = 'db:tax_chburg_60';
      cnty = "franklin";
		}

		var query = db;
		var sort = $('input[name="sort"]') .attr('value');
        var queryString = '';


		if ($('[name="last_name"]') .attr('value') != null){
			queryString = ' AND last:' + checkQuery( $('input[name="last_name"]') );
			query = query + queryString;
		}
		if ($('[name="first_name"]') .attr('value') != null){
			queryString = ' AND first:' + checkQuery( $('input[name="first_name"]') );
			query = query + queryString;
		}
		if ($('[name="occupation"]') .attr('value') != null){
			queryString = ' AND occupation:' + checkQuery( $('input[name="occupation"]') );
			query = query + queryString;
		}

		/*Franklin figures*/
		/*County Tax*/
		var co_tax = $('[name="co_tax"]') .attr('value');
		if (co_tax != null){
		    queryString = buildRange($('[name="co_tax"]') .attr('value'), 'county_tax', $('#co_tax-op') .attr('value'));
            query = query + queryString;
		}
		/*State Tax*/
		var st_tax = $('[name="st_tax"]') .attr('value');
		if (st_tax != null){
		    queryString = buildRange($('[name="st_tax"]') .attr('value'), 'state_tax', $('#st_tax-op') .attr('value'));
            query = query + queryString;
		}
		/*State Personal Tax*/
		var st_per_tax = $('[name="st_per_tax"]') .attr('value');
		if (st_per_tax != null){
		    queryString = buildRange($('[name="st_per_tax"]') .attr('value'), 'state_personal_tax', $('#st_per_tax-op') .attr('value'));
            query = query + queryString;
		}

		/*Augusta Figures*/
		/*Building Value*/
		var build = $('[name="build"]') .attr('value');
		if (build != null){
		    queryString = buildRange($('[name="build"]') .attr('value'), 'building_val', $('#build-op') .attr('value'));
            query = query + queryString;
		}
		/*Lot-Building Value*/
		var lot_build = $('[name="lot_build"]') .attr('value');
		if (lot_build != null){
		    queryString = buildRange($('[name="lot_build"]') .attr('value'), 'lot_building_val', $('#lot_build-op') .attr('value'));
            query = query + queryString;
		}
		/*Tax Amount*/
		var tax_amt = $('[name="tax_amt"]') .attr('value');
		if (tax_amt != null){
		    queryString = buildRange($('[name="tax_amt"]') .attr('value'), 'tax_amt', $('#tax_amt-op') .attr('value'));
            query = query + queryString;
		}
		/*City Tax Amount*/
		var city_tax_amt = $('[name="city_tax_amt"]') .attr('value');
		if (city_tax_amt != null){
		    queryString = buildRange($('[name="city_tax_amt"]') .attr('value'), 'city_tax_amt', $('#city_tax_amt-op') .attr('value'));
            query = query + queryString;
		}


		$('input[name="sort"]') .attr('value', sort);
        $('input[name="q"]') .attr('value', query);
        $('input[name="db"]') .attr('value', db);
        var url = document.taxSearchForm.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + $('[name="sort"]').attr('value') + "&county=" + cnty;
        alert("county=" + cnty);
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;



	});


/* hide no-javascript warning on load */
$('#no-javascript').remove();

});
