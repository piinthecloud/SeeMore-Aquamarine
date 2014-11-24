$(function() {
  $(".choose").click(function(event) {
    event.preventDefault();
    var $vimeo = $(this).parents(".vimeo-result");
    var $form = $(this).parents("form");
    var valuesToSubmit = $form.serialize();
    // $("#hiddenHandle").val(get_vimeo_handle(vimeo.url);
    // $("#hiddenSM").val("Vimeo");
    // $("#hiddenID").val(@feed.id);
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
