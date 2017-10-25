
$(function(){
	$('div.mailbox-border > table > tbody > tr').on('click', function(){
		var senttime = $(this).find('td').eq(2).text()
		var mess = $(this).find('td').eq(1).text()
		var mes_id = $(this).find('td').eq(3).text();		

		$('#myModal').find('#mSenttime').html('<h4 class="modal-title">'+ senttime + '</h4>')
		$('#myModal').find('#mBody').html('<p>' + mess + '</p>')	
			
		$.ajax({
		        type: "GET",
		        url: "sent_mes/get_recipient",
		        data: { 
		            mes_id: $(this).data('id')
		        },
		        success: function(result) {
		        	// console.log(result.recipients)
		        	var rec_list = ""
		        	var update
		        	result.recipients.forEach(function(element){
		        		if (element.isRead == true){
		        			update =  "&nbsp;&nbsp Seen at: " + element.updated_at
		        		}
		        		else{
		        			update = "&nbsp;&nbsp Not seen"
		        		}
						rec_list = rec_list + element.email + update + "<br>"
					})
		        	// var rec_list = result.recipients
		        	$('#myModal').find('#mRecipient').html(	'<p style="font-size: 13px; color: gray">' +
		        											rec_list +
		        											'</p>')
		        },
		        error: function(result) {
		            alert('error');
		        }
		    });

	})
});