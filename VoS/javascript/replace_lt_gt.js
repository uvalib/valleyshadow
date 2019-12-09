$(function () { 
	$('.title').each(function () {
		var context = $(this).text();
		//alert(context.length);
		open_em = context.indexOf("&lt;em&gt;");
		while (open_em != - 1) {
			context = context.replace("&lt;em&gt;", '<span class="highlightme">');
			open_em = context.indexOf("&lt;em&gt;");
		}
		close_em = context.indexOf("&lt;/em&gt;");
		while (close_em != - 1) {
			context = context.replace("&lt;/em&gt;", "</span>");
			close_em = context.indexOf("&lt;/em&gt;");
		}
		$(this).html(context);
	});
	
	$('.context').each(function () {
		var title = $(this).text();
		//alert(context.length);
		open_em1 = title.indexOf("&lt;em&gt;");
		while (open_em1 != - 1) {
			title = title.replace("&lt;em&gt;", '<span class="highlightme">');
			open_em1 = title.indexOf("&lt;em&gt;");
		}
		close_em1 = title.indexOf("&lt;/em&gt;");
		while (close_em1 != - 1) {
			title = title.replace("&lt;/em&gt;", "</span>");
			close_em1 = title.indexOf("&lt;/em&gt;");
		}
		$(this).html(title);
	});
	
	
});

