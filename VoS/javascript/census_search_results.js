$(function () {
	$('.pagingBtn') .click(function (e) {
		var href = $(this) .attr('href');
		var windowName = $(this) .attr('class');

        if (windowName.indexOf('1860') >= 0){
			$.get(href, {
			}, function (data) {
				$('#search1') .html(data); TB_init();
			});
			return false;
		}
		if (windowName.indexOf('1870') >= 0){
			$.get(href, {
			}, function (data) {
				$('#search2') .html(data); TB_init();
			});
			return false;
		}
		else {
			$.get(href, {
			},function (data) {
				$('#search') .html(data); TB_init();
			});
			return false;
		}
		
	});
	
})