$(function(){
  $(".twubmit").click(function(event) {
    event.preventDefault();

    var button = $(this);
    if (button == "Subscribe") {
      (button = "Subscribed");
    }

    console.log(button.val());


  });
});
