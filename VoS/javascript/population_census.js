$(document) .ready(function () {

    /* disable submit click event propagation to prevent conflict with form submit event */
    $('#search_button').click( function (event) {
        event.stopPropagation();
       // event.preventDefault();
    });
    $('#search_button').submit( function (event) {
        event.stopPropagation();
        event.preventDefault();
    });

    /* a single object should store our query fields */
    var solrQuery = {
        database : ''
    };

    /* if due to reload we have no checked year or county, correct this */
    if ( !($('#year_cell') .children("input:checked") .attr('value')) ) {
        $('#year_cell input#year_1860').attr({checked: 'checked'});
    }
    if ( !($('#county_cell') .children("input:checked") .attr('value')) ) {
        $('#county_cell input#county_augusta').attr({checked: 'checked'});
    }

    var queryString; // constructor variable for 'q' param, which will pass all solr search fields
    var solrParams = {
        year   : $('#year_cell') .children("input:checked") .attr('value'),
        county : $('#county_cell') .children("input:checked") .attr('value'),
        sort   : 'last asc, first asc'

    }; // other params passed via GET method to next pipeline

    function buildQuery(obj) {
        var qString = '';
            for (key in obj) {
            if ( key != 'county' ) {
                if ( qString == '' || key == 'age' ) {
                    qString += obj[key]; }
                else if (key.substr(0,4) != ' AND' ) {
                	qString += ' ' + obj[key];
                }
                else {
                    qString += ' AND ' + obj[key];
                }
            }
        }
        return qString;
    };

    /* declare variables */

    var persests_range = '';
    var realests_range = '';
    var page_num_range = '';
    var detailed = $('#census_interface_marker') .attr('value');
    var color = $('#color_cell') .children("input:checked") .attr('value');
    var year = $('#year_cell') .children("input:checked") .attr('value');
    if ( year == 'undefined' ) { year='1860'; }
    var county = $('#county_cell') .children("input:checked") .attr('value');
    var db = validateDB(year, county);  // validate this var immediately -- it will be used in all solr queries

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

    /* helper function to add fields to our query object */
    function addSQfield(node) {
        var nodeName = $(node) .attr('name');
        var nodeVal = $(node) .attr('value');
        // clear sibling inputs
        $('input[name=' + nodeName + ']').removeAttr("checked");
        // must unbind or retoggle other (sibling) inputs to get proper behavior
        $(node) .attr({
            checked: "checked"
        });
        solrQuery[nodeName] = nodeVal;
        // inspectSQ();
    };

    /* changes form action URL if 'both' radio button is selected */
    function validateFormAction(y) {
        var year = y;
        if (y == 'both') {
            $('form#basic_census') .attr({
                'action' : '/census_dual_search_results'
            });
        } else {
            $('form#basic_census') .attr({
                'action' : '/census_search_results'
            });
        }
        // inspectSQ();
    };

    /* sets the db field (and db1 and db2 in cases of dual census search */
    function validateDB(y, c) {
        var database = 'indeterminate db field!';
        var year = y; var county = c;
       // alert(year + ' and ' + county);
        if (year == 'both') {
            if (county == 'aug') {
                database = 'dualSearchRequestAug';
                solrParams.db1 = 'db:pop_aug_60';
                solrParams.db2 = 'db:pop_aug_70';
            } else {
                database = 'dualSearchRequestFr';
                solrParams.db1 = 'db:pop_fr_60';
                solrParams.db2 = '(db:pop_fr_70 OR db:pop_fr_70_v2)';
            }
        } else {
            if (county === 'aug') {
                if (year == '1860') {
                    database = 'db:pop_aug_60';
                } else {
                    database = 'db:pop_aug_70';
                }
            } else {
                if (year === '1860') {
                    database = 'db:pop_fr_60';
                } else {
                    database = '(db:pop_fr_70 OR db:pop_fr_70_v2)';
                }
            }
            delete solrParams.db1; delete solrParams.db2;
        }
        solrQuery.database = database;
        return database;
    };


    $('input[name="sex"]') .click(function () {
        addSQfield($(this));
    });

    $('input[name="colors"]').click(function () {
        addSQfield($(this));
    });

    $('select#result_order') .change(function () {
        solrParams.sort = $('select#result_order').attr('value');
    });

    /* Do some validation on document ready */
    validateFormAction(year);
    db = validateDB(year, county);

//    queryString = buildQuery(solrQuery);

    /* Make sure you amend the form action when switching the 'year' radio buttons: the 'both' value alters the URL!!  */

    $('td#year_cell input') .click(function () {
        $('td#year_cell input') .removeAttr("checked");
        $(this) .attr({
            checked: "checked"
        });
        solrParams['year'] = $(this) .attr('value');
        validateFormAction(solrParams['year']);
        db = validateDB(solrParams['year'], solrParams['county']);
        // inspectSQ();
    });

    $('td#county_cell input') .click(function () {
        $('td#county_cell input') .removeAttr('checked');
        $(this) .attr({
            checked: "checked"
        });
        solrParams['county'] = $(this) .attr('value');
        db = validateDB(solrParams['year'], solrParams['county']);
        // inspectSQ();
    });

    /* Hitting <RETURN> in this text field submits the form */
    $('input.text') .keydown(function (e) {
        if (e.keyCode == 13) {
            $('form#basic_census') .submit();
            return false;
        }
    });

    /* form validation - called on document.ready and form.submit events */
    function validateForm(y) {
        var whatShouldIdo = false;
        var year= y;
        // add any text fields to main query object
        $('input.text').each( function() {
            var myId = $(this).attr('id');
            if ( $(this).val() != '' && $(this).val() != 'undefined' ) {
                solrQuery[myId] = myId + ':' + checkQuery( $(this) );
            } else {
            delete solrQuery[myId];
            }
        });

        var age = $('#age') .attr('value');
        var age_range = '';

        if (age != null) {
            var ages_op = $('#ages-op') .attr('value');
            if (ages_op == 'gt') {
                age_range = ' AND age:[' + age + ' TO *] NOT age:' + age;
            } else if (ages_op == 'equal') {
                age_range = ' AND age:' + age;
            } else if (ages_op == 'lt') {
                age_range = ' AND age:[* TO ' + age + '] NOT age:' + age;
            } else if (ages_op == 'not') {
                age_range = '(age:[0 TO *] -age:' + age +')';
            }
        solrQuery.age = age_range;
        } else {
            delete solrQuery.age;
        }

        var realest_value = $('#realests') .attr('value');
        if ( realest_value != null ) {
            var realests_op = $('#realests-op') .attr('value');
            if (realests_op == 'gt') {
                realests_range = ' AND realest:[' + realest_value + ' TO *] NOT realest:' + realest_value;
            } else if (realests_op == 'equal') {
                realests_range = ' AND realest:' + realest_value;
            } else if (realests_op == 'lt') {
                realests_range = ' AND realest:[* TO ' + realest_value + '] NOT realest:' + realest_value;
            } else if (realests_op == 'not') {
                realests_range = '(realest:[0 TO *] -realest:' + realest_value +')';
            }
            solrQuery.realests_range = realests_range;
        } else {
            delete solrQuery.realests_range;
        }

        var persest_value = $('#persests') .attr('value');
        if ( persest_value != null ) {
            var persests_op = $('#persests-op') .attr('value');
            if (persests_op == 'gt') {
                persests_range = ' AND persest:[' + persest_value + ' TO *] NOT persest:' + persest_value;
            } else if (persests_op == 'equal') {
                persests_range = ' AND persest:' + persest_value;
            } else if (persests_op == 'lt') {
                persests_range = ' AND persest:[* TO ' + persest_value + '] NOT persest:' + persest_value;
            } else if (persests_op == 'not') {
                persests_range = '(persest:[0 TO *] -persest:' + persest_value +')';
            }
            solrQuery.persests_range = persests_range;
        } else {
            delete solrQuery.persests_range;
        }

        var page_num_value = $('#page_num') .attr('value');
        if (page_num_value != null) {
            var page_num_op = $('#page_num-op') .attr('value');
            if (page_num_op == 'gt') {
                page_num_range = ' AND page_num:[' + page_num_value + ' TO *] NOT page_num:' + page_num_value;
            } else if (page_num_op == 'equal') {
                page_num_range = ' AND page_num:' + page_num_value;
            } else if (page_num_op == 'lt') {
                page_num_range = ' AND page_num:[* TO ' + page_num_value + '] NOT page_num:' + page_num_value;
            } else if (page_num_op == 'not') {
                page_num_range = ' NOT page_num:' + page_num_value;
            }
        }

        $('input#sort').val(solrParams.sort);
        $('input#county').val(solrParams.county);
        $('td#year_cell input[year="' + year + '"]').attr({'checked': "checked"} );
       // alert('at this point sP.year is ' + solrParams.year);
       // alert('at this point checked input name=year is ' + $('td#year_cell input:checked').attr('value') );
       // alert('at this point var year is ' + year);
        $('input#db') .attr({ 'value' : solrQuery.database  }); // only gets passed to XSLT for styling -- not needed for Solr querying, but omission will break links

        if ( solrParams['year'] === 'both' ) {
            $('input#db1').attr({'value': solrParams.db1});
            $('input#db2').attr({'value': solrParams.db2});
           // alert('ending dual branch in VF');
        } else {
            // alert ('single year search');
            /* searching a single census year - not two */
            $('input#query1') .remove();
            $('input#query2') .remove();
            $('input#query_dual') .remove();
        }
       // alert('wrapping up validate Form ');
        // inspectSQ();
        return whatShouldIdo;

    };

    /* form submission */
    $('form').submit( function() {
        validateForm(solrParams.year);
        queryString = buildQuery(solrQuery);
        var myResult = queryString.indexOf('dualSearchRequest');
        if ( queryString.indexOf('dualSearchRequest') == 0 ) {
           // alert('I will change queryString var');
            var myReplacement = solrQuery.database + ' AND ';
            var myAmount = 0;
		if ( queryString.indexOf(myReplacement) == 0 ) {
            myAmount = myReplacement.length;
            queryString = queryString.substr(myAmount);
	}  else {
	    myAmount = solrQuery.database.length;
            queryString = queryString.substr(myAmount);
	}
        }

        $('input#query').val(queryString);  /* this is the q parameter, which is the solr query itself */
        // inspectSQ();
        return true;
        });


    /* lastly, hide no-javascript warning on load */
    $('#no-javascript') .remove();

});
