$(function() {
  $(".choose").click(function(event) {
    event.preventDefault();
    var $form = $(this).parents("form");
    var $vimeo = $(this).parents(".vimeo-result");
    var valuesToSubmit = $form.serialize();
    $.ajax($form.attr("action"), {
      type: "POST",
      data: valuesToSubmit,
      success: function() {
        $vimeo.addClass("chosen");
      },
      error: function() {
        alert("ERROR!");
      }
    });
  });
});
