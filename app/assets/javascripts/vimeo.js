// $(function() {
//   $(".choose").click(function(event) {
//     event.preventDefault();
//     var $form = $(this).parents("form");
//     var $vimeo = $(this).parents(".vimeo-result");
//     var valuesToSubmit = $form.serialize();
//     $.ajax($form.attr("action"), {
//       type: "POST",
//       data: valuesToSubmit,
//       success: function() {
//         $vimeo.addClass("chosen");
//         document.location.reload(true);
//       },
//       error: function() {
//         alert("ERROR!");
//       }
//     });
//   });
// });

// $(".delete").click(function(event) {
//   event.preventDefault();
//   var $vimeo = $(this).parents(".vimeo-result");
//   // var valuesToSubmit = $(this).serialize();
//   $.ajax($(this).attr("action"), {
//     url: "/vimeos/" + '?' + $.param({"Id": Id, "bolDeleteReq" : bolDeleteReq}),
//     type: "DELETE",
//     // data: valuesToSubmit,
//     success: function() {
//     $vimeo.fadeOut("slow");
//   },
//     error: function() {
//     alert("ERROR!");
//     }
//   });
// });
