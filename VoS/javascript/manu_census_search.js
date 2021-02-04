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

// some large arrays to build options menus dynamically
		var businessOptions1860 = [
		    '[?]',
		    'Agr. Implements',
		    'Baker',
		    'Baker &amp; Confectioner',
		    'Bit Maker',
		    'Blacksmith Shop',
		    'Boot and Shoemaker',
		    'Brewer',
		    'Brickyard',
		    'Butcher',
		    'Cabinet Maker',
		    'Candles',
		    'Carriage Maker',
		    'Cement Mill',
		    'Chopping &amp; Sawmill',
		    'Chopping Mill',
		    'Cigar Manufactory',
		    'Clover Mill',
		    'Coach',
		    'Confectioner',
		    'Cooper',
		    'Daguerrotypist',
		    'Dentist',
		    'Distillery',
		    'Edge Tools',
		    'F. Shop',
		    'Flour &amp;/or Grist Mill',
		    'Foundry',
		    'Foundry &amp; Machine Shop',
		    'Furniture Manufacturer',
		    'Harness',
		    'Hatter',
		    'Iron Furnace',
		    'Iron Furnance',
		    'Lime Kiln',
		    'Lumber',
		    'Machine Shop',
		    'Manufacture of Gas',
		    'Merchant[?] Tailor',
		    'Milliner',
		    'Mining Co.',
		    'Nursery',
		    'Paper Mill',
		    'Planing Mill',
		    'Plaster Mill',
		    'Potter',
		    'Rolling Mill',
		    'Roofing[?] Mill',
		    'Rope Manufactory',
		    'Saddle &amp;/or Harness Shop',
		    'Sawmill',
		    'Silver Plate &amp; [?]',
		    'Slaughterhouse',
		    'Stone Cutter',
		    'Sumac Mill',
		    'Tailor Shop',
		    'Tannery',
		    'Tar Manufacturing',
		    'Tin and Coppersmith',
		    'Tobbaconist',
		    'W. M.[?] Shop',
		    'Wagon Maker',
		    'Windmill Manufacturer',
		    'Wool Carding',
		    'Woolen Factory'
		    ];
        var businessOptions1870 = [
            'Agr. Implements',
            'B. Stone Mason',
            'Barrels',
			'Blacksmith &amp; Wagon Builder',
			'Blacksmith Shop',
			'Blacksmith Shop',
			'Blood Cleanser &amp; Panacea',
			'Boot &amp; Shoes',
			'Boots &amp; Shoes',
			'Bread &amp; Cakes',
			'Brewers',
			'Brickmaker',
			'Burial Cares',
			'Butcher',
			'Cabinet Maker',
			'Cabinet Maker &amp; Undertaker',
			'Carding Machine',
			'Carpenter',
			'Carpenter &amp; Undertaker',
			'Carpet Manufacturing',
			'Carpets',
			'Carriage Factory',
			'Carriage Manufacturer',
			'Carriages &amp; Buggies',
			'Carriages, Buggies &amp; Wagons',
			'Cement Manufacturing',
			'Chair &amp; Cabinet Makers',
			'Chair Maker &amp; Painter',
			'Charcoal Blast Furnace',
			'Chopping Mill',
			'Cigars',
			'Coach Maker',
			'Cold Blast Charcoal Furnace',
			'Confectioner',
			'Cooper',
			'Cradles, Forks, &amp; Rakes',
			'Crockery Ware',
			'Distiller',
			'Edge Tools',
			'Elizabeth Furnace',
			'Felloe Bender',
			'Flour Mill', 'Foundry',
			'Foundry &amp; Machine Shop',
			'Foundry &amp; Machinists',
			'Furnace &amp; Forge',
			'Furniture',
			'Grain Drills',
			'Grist &amp; Flour Mill',
			'Grist Mill',
			'Iron Manufacturing',
			'Iron Suplements Sash Doors, &amp; Building Material',
			'Laythe',
			'Leather Manufacturer',
			'Lime Burner',
			'Lime Kiln',
			'Machine Carding',
			'Machinist',
			'Mantua Maker',
			'Manufacture of Fancy Casimeres',
			'Manufacturer of Ale',
			'Manufacturer of Furniture',
			'Manufacturer of Medicines &amp; Cattle powders',
			'Marble &amp; Brown Stone worker',
			'Marble Works',
			'Mason',
			'Merchant Mill',
			'Merchant Tailor',
			'Mill',
			'Mill Chopping',
			'Mill Wright',
			'Miller',
			'Miller &amp; Dealer in grain',
			'Miners',
			'Monuments &amp; Headstones',
			'Monuments &amp; Tombstones',
			'Paper Manufacturing',
			'Paper Mill',
			'Photographs',
			'Planing &amp; Sawing',
			'Plasterer',
			'Plow Maker',
			'Plow Maker &amp; Foundry',
			'Potter',
			'Rakes &amp; Forks',
			'Saddle &amp; Harness Shop',
			'Saddlery',
			'Sash &amp; Door Factory',
			'Sash, Blind, &amp; Door Factory',
			'Sash, Frames, Etc',
			'Saw Mill',
			'Saw Mill, Grist Mill',
			'Shoe Boot &amp; Harnes', 'Shoemaker',
			'Soap &amp; Candles',
			'Sorghum Molasses Factory',
			'Steam Engine Boilers &amp; Foundry',
			'Steel &amp; Iron',
			'Stone Cutters',
			'Store &amp; * Textiles',
			'Stoves &amp; Tin Ware &amp; Gas. Fiting',
			'Stoves, Tin &amp; Copperworks',
			'Straw Paper',
			'Tailor Shop',
			'Tan Yard',
			'Tannery',
			'Taylor',
			'Threshers, Separators &amp; Horse Powers',
			'Tin &amp; Coppersmith' ,
			'Tin Ware Manufacturer',
			'Tinner Shop',
			'Tobacco',
			'Tombstone Cutter',
			'Undertaking',
			'Wagon Maker',
			'Weaver',
			'Weaver shop',
			'Weaving',
			'Window &amp; Door Frames, Shutters, Doors &amp;c',
			'Wool Carder',
			'Woolen &amp; Carpet Mill',
			'Woolen Factory',
			'Woolen Mill'
			];



	$('input[@name="year"]') .click(function () {
		var year = $(this) .attr('value');

        if (year == '60') {
		    $('#business option').remove();
            $('#business').append('<option/>');
            for (var i in businessOptions1860 ) {
                newOption = document.createElement("option");
                newOption.textContent =  businessOptions1860[i] ;
                $('#business') .append( newOption );
            }
            $('#location').html('<option/><option value="1st District">Augusta: 1st District</option><option value="North Subdiv.">Augusta: North Subdiv.</option><option value="Staunton Dist. 1">Augusta: Staunton Dist. 1</option><option value="Antrim Tshp.">Franklin: Antrim Tshp.</option><option value="Bor. of Ch\'burg">Franklin: Bor. of Ch\'burg</option><option value="Ch\'burg-S.Ward">Franklin: Ch\'burg-S.Ward</option><option value="Chambersburg">Franklin: Chambersburg</option><option value="Fannett Tshp.">Franklin: Fannett Tshp.</option><option value="Greencastle Bor.">Franklin: Greencastle Bor.</option><option value="Greene Tshp.">Franklin: Greene Tshp.</option><option value="Guilford Tshp.">Franklin: Guilford Tshp.</option><option value="Hamiton Tshp.">Franklin: Hamiton Tshp.</option><option value="LetterkennyTshp.">Franklin: LetterkennyTshp.</option><option value="Lurgan Tshp.">Franklin: Lurgan Tshp.</option><option value="Metal Tshp.">Franklin: Metal Tshp.</option><option value="Montgomery Tshp.">Franklin: Montgomery Tshp.</option><option value="Peters Tshp.">Franklin: Peters Tshp.</option><option value="Quincy Tshp.">Franklin: Quincy Tshp.</option><option value="S\'hampton Tshp.">Franklin: S\'hampton Tshp.</option><option value="St. Thomas Tshp.">Franklin: St. Thomas Tshp.</option><option value="Washington Tshp.">Franklin: Washington Tshp.</option><option value="Waynesboro">Franklin: Waynesboro</option>');
		} else if (year == '70') {
			$('#business option').remove();
			$('#business').append('<option/>');
			for (var i in businessOptions1870 ) {
                newOption = document.createElement("option");
                newOption.textContent =  businessOptions1870[i] ;
                $('#business') .append( newOption );
            }
			$('#location') .html('<option/><option value="1st District">Augusta: 1st District</option><option value="2nd District">Augusta: 2nd District</option><option value="3rd District">Augusta: 3rd District</option><option value="6th District">Augusta: 6th District</option><option value="Pastures Township">Augusta: Pastures Township</option><option value="Riverheads Township">Augusta: Riverheads Township</option><option value="South River &amp; Riverheads Townships" >Augusta: South River &amp; Riverheads Townships</option><option value="Antrim Township">Franklin: Antrim Township</option><option value="Boro. of Mercersburg">Franklin: Boro. of Mercersburg</option><option value="Borough of Greencastle">Franklin: Borough of Greencastle</option><option value="Dist 200 Fannett Township">Franklin: Dist 200 Fannett Township</option><option value="Dist 200 Lurgan Township">Franklin: Dist 200 Lurgan Township</option><option value="Dist 200 Southampton Township">Franklin: Dist 200 Southampton Township</option><option value="Dist 201 Metal Township">Franklin: Dist 201 Metal Township</option><option value="Greene Township">Franklin: Greene Township</option><option value="Guilford Township">Franklin: Guilford Township</option><option value="Hamilton Township">Franklin: Hamilton Township</option><option value="Letterkenny Township">Franklin: Letterkenny Township</option><option value="Montgomery Township">Franklin: Montgomery Township</option><option value="North Ward Borough Chambersburg">Franklin: North Ward Borough Chambersburg</option><option value="Quincy Township">Franklin: Quincy Township</option><option value="South Ward Chambersburg">Franklin: South Ward Chambersburg</option><option value="Township of Peters">Franklin: Township of Peters</option><option value="Township of Saint Thomas">Franklin: Township of Saint Thomas</option><option value="Warren Township">Franklin: Warren Township</option><option value="Washington Township">Franklin: Washington Township</option><option value="Waynesboro">Franklin: Waynesboro</option>');
		}
		$('#business') .children('option') .each(function () {
			if ($(this) .attr('value') == null) {
				$(this) .attr('selected', 'selected');
			}
		});
		$('#location') .children('option') .each(function () {
			if ($(this) .attr('value') == null) {
				$(this) .attr('selected', 'selected');
			}
		});
	});


	$('#search_button') .click(function () {
		var county = $('#county_cell') .children("input:checked") .attr('value')
		var year = $('#year_cell') .children("input:checked") .attr('value');
		var db = 'db:man_' + $('#county_cell') .children("input:checked") .attr('value') + '_' + year;
		var query = db;
		var queryString;
		var sort = $('[name="sort"]').attr('value');
//		if and when index is changed to include products field for 1870 data, add this line to amend sort param
//		if (sort == 'kinds_annual asc') { sort = 'products asc'; }

		if ($('#name') .attr('value') != null) {
			queryString = ' AND name:' + checkQuery( $('#name') );
			query = query + queryString;
		}
		if ($('#business') .attr('value') != null) {
			queryString = ' AND business:' + checkQuery( $('#business') );
			query = query + queryString;
		}

		if ($('#location') .attr('value') != null) {
			queryString = ' AND location:' + checkQuery( $('#location') );
			query = query + queryString;
		}

		if ($('#products') .attr('value') != null) {
			if (year == '60'){
				queryString = ' AND kinds_annual:' + checkQuery($('#products') );
			}
			else if (year == '70'){
				queryString = ' AND products:' + checkQuery($('#products') );
			}
			query = query + queryString;

		}

		var url = document.manuCensusSearch.action + "?q=" + query + "&rows=" + $('[name="rows"]').attr('value')  + "&start=" + $('[name="start"]').attr('value') + "&sort=" + sort + "&county=" + county + "&year=" + year;
        window.location.href=url; // this is a replacement for the form SUBMIT event.
        return false;


	});

/* hide no-javascript warning on load */
$('#no-javascript').remove();
});
