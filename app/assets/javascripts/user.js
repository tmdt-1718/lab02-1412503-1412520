$(function(){
	$('td').on('ajax:complete', '.userUnfriend', function(){
		var url = "/friend.3?friend_id=" + $(this).data('id')
		$(this).parent().html('<a class="btn btn-info userAddFriend" data-method="post" data-remote="true"' + 'data-id='+ $(this).data('id') + ' href=' + url + '>Add friend</a>')
		$(this).remove()
	})
	
	$('td').on('ajax:complete', '.userAddFriend', function(){
		var url = "/friend/" + $(this).data('id')
		$(this).parent().html('<a class="btn btn-danger userUnfriend" data-confirm="Are you sure you want to unfriend this person?" data-method="delete" data-remote="true"' + 'data-id='+ $(this).data('id') + ' href=' + url  + '>Unfriend</a>')
		$(this).remove()
	})

	// $('.userUnfriend').on('ajax:complete', function(){

	// })
	// $('.userAddFriend').on('ajax:complete', function(){
	// 	var url = "/friend/" + $(this).data('id')
	// 	$(this).parent().html('<a class="btn btn-danger userUnfriend" data-confirm="Are you sure you want to unfriend this person?" data-method="delete" data-remote="true"' + 'data-id='+ $(this).data('id') + ' href=' + url  + '>Unfriend</a>')
	// 	$(this).remove()
	// })
})