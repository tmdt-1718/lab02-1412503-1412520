$(function(){
	$('.unfriend').bind('ajax:complete', function(){
		$(this).parent().parent().remove()
	})
});