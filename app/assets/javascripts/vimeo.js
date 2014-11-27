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
        document.location.reload(true);
      },
      error: function() {
        alert("ERROR!");
      }
    });
  });
});

$(function() {
  $(".delete").click(function(event) {
    event.preventDefault();
    var $form = $(this).parents("form");
    var $vimeo = $(this).parents(".vimeo-result");
    var valuesToSubmit = $form.serialize();
    $.ajax($form.attr("action"), {
      type: "DELETE",
      data: valuesToSubmit,
      success: function() {
        $vimeo.removeClass("chosen");
        document.location.reload(true);
      },
      error: function() {
        alert("ERROR!");
        }
      });
    });
  });
