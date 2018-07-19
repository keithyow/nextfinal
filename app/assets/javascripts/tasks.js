//= require jquery
$(document).ready(function() { 
  $("#new_task").submit(function(event){
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