//= require jquery
$(document).ready(function() { 
  $("#submitform").click(function(event){
    event.preventDefault();

    // comment
  	var action = $(this).attr('action');
    var method = $(this).attr('method');

    // comment on serializeArray
    var data = $(this).serializeArray();

    // comment
    $.ajax({
      method: method,
      url: action,
      data: data,
      // this line makes the response format JavaScript and not html.
      dataType: 'script'
    });
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
