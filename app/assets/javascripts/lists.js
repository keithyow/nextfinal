//= require jquery
$(document).ready(function() { 
  $("form").submit(function(event){
    event.preventDefault();

    // comment
  	var action = $(this).attr('action');
    var method = $(this).attr('method');

    // var title = $(this).find('#list_title').val();
    // comment on serializeArray
    var data = $(this).serializeArray();

    // comment
    $.ajax({
      method: method,
      url: action,
      data: data,
      // this line makes the response format JavaScript and not html.
      dataType: 'script'
      // dataType: 'JSON',
      // success: function(response){
      // 	console.log("success");
      // 	console.log(response);
      // },
      // error: function(error){
      // 	console.log(error);
      // }

    });

    // debugger;
  });
});


$(document).ready(function() { 
  $("button").click(function(event){
    event.preventDefault();

    var action = $(this).attr('action');
    var method = $(this).attr('method');

    $.ajax({
      method: method,
      url: action,
      dataType: 'script'

    });
	 });
});
