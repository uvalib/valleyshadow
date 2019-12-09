$(function () {
	$('#year_cell') .children("input").click(function () {
		if ($(this) .attr('value') == '1860') {
			$('.form_1860').show();
			$('.form_1870') .hide();
			$('#location_label') .show();
			$('.form_1870') .children('td') .children('input') .each(function(){
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
		} else if ($(this) .attr('value') == '1870') {
			$('.form_1860') .hide();
			$('.form_1870') .show();
			$('#location_label') .show();			
			$('.form_1860') .children('td') .children('input') .each(function(){
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
});