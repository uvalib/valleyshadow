$(function () {
	$('.pagingBtn') .click(function () {
		var href = $(this) .attr('href');
		$.get(href, {
		},
		function (data) {
			$('#search') .html(data);
		});
		return false;
	});
})