$(document).on('turbolinks:load', function(){
	$('.toggle').click(function(){
  // Switches the Icon
  $(this).children('i').toggleClass('fa-pencil');
  // Switches the forms  
  $('.form').animate({
    height: "toggle",
    'padding-top': 'toggle',
    'padding-bottom': 'toggle',
    opacity: "toggle"
  }, "slow");
});

  $('#registerForm').submit(function(e){
    var url = "/user";

    var password = $('#pass').val()
    var rePassword = $('#rePass').val()
    var $thisParent = $(this).parent()
    var $firstDiv = $thisParent.find('div').eq(0)

    if ($firstDiv.hasClass('alert'))
    {
      $firstDiv.remove()
    }

    if (password === rePassword)
    {
          $.ajax({
           type: "POST",
           url: url,
           data: $(this).serialize(), 
           success: function(result)
           {
              if (result.data == '1')
              {
                $thisParent.prepend('<div class="alert alert-info"> User is created successfully </div>')                
              }
              else
              {
                $thisParent.prepend('<div class="alert alert-danger"> Email has been used </div>')
              }
           },
           error: function(xhr, ajaxOptions, thrownError)
           {
              alert(thrownError);
           }
         });
    }
    else
    {
      $thisParent.prepend('<div class="alert alert-danger"> Passwords do not match </div>')
    }
    e.preventDefault();
  })
})