$(function(){
	$('div.mailbox-border > table > tbody > tr').on('click', function(){
		var sender = $(this).find('td').eq(0).text()
		var mess = $(this).find('td').eq(1).text()
		$('#myModal').find('#mSender').html('<p>' + sender + '</p>')
		$('#myModal').find('#mBody').html('<p>' + mess + '</p>')
		if ($(this).hasClass("highlight"))
		{
			$(this).removeClass("highlight")
			$.ajax({
		        type: "POST",
		        url: "inbox/read",
		        data: { 
		            id: $(this).data('id')
		        },
		        success: function(result) {
		        	if (result.data == 'fail')
		            	alert('server error');
		        },
		        error: function(result) {
		            alert('error');
		        }
		    });
		}

	})
});