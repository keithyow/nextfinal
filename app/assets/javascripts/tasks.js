//= require jquery
$(document).ready(function() { 
  $("#new_task").submit(function(event){
    event.preventDefault();
    // gets path (/tasks)
  	var action = $(this).attr('action');
    // gets method type (post)
    var method = $(this).attr('method');

    // serializeArray turns all the form data into a nicely structured object including nesting
    // Since currently using strong params(for better security - private params), nested structure where “tasks” is a top level key is needed
    // eg. data: { tasks: {description: description} }
    var data = $(this).serializeArray();

    // AJAX request using jQuery
    $.ajax({
      method: method,
      url: action,
      data: data,
      // this line makes the response format JavaScript and not html. AJAX using JavaScript
      dataType: 'script'
    });
  });
});

// $(document).ready(function() { 
//   $(".button_to").submit(function(event){
//     event.preventDefault();
//     console.log("prevented Default");


//     var action = $(this).attr('action');
//     var method = this.children[0].value;

//     $.ajax({
//       method: 'DELETE',
//       url: action,
//       data: "&authenticity_token="+this.children[2].value, 
//       dataType: 'script'

//     });
//  });
// });


// $(document).ready(function() { 
//   $("button").submit(function(event){
//     event.preventDefault();

//     var action = $(this).attr('action');
//     var method = $(this).attr('method');

//     $.ajax({
//       method: method,
//       url: action,
//       dataType: 'script'

//     });
// 	 });
// });