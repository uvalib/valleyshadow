$(function () { 
	$('.context').each(function () {
		var context = $(this).text();
		//alert(context.length);
		open_em = context.indexOf("<em>");
		while (open_em != - 1) {
			context = context.replace("<em>", '<span class="highlightme">');
			open_em = context.indexOf("<em>");
		}
		close_em = context.indexOf("</em>");
		while (close_em != - 1) {
			context = context.replace("</em>", "</span>");
			close_em = context.indexOf("</em>");
		}
		$(this).html(context);
	});
});