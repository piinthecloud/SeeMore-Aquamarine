$(function(){
  $(".twubmit").click(function(event) {
    event.preventDefault();

    var button = $(this);
    if (button.val == "Subscribe") {
      (button.val = "Un-Subscribe");
      }

    console.log(button.val());


  });
});
