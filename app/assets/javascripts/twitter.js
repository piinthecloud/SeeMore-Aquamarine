$(function(){
  $(".twubmit").click(function(event) {
    event.preventDefault();

    var button = $(this);
    if (button == "Subscribe") {
      (button.val() = "Subscribed");
    }

    console.log(button.val());


  });
});
