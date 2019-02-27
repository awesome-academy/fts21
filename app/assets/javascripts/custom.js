$(document).on("turbolinks:load", function(){
  new SimpleMDE({ element: document.getElementById("course_description") });
  $('[id^=subject-]').hide();
  $('[id^=menu_show-]').hide();
  $("#course_subjects").chosen();
  $("#suppervisor_course").chosen({
  disable_search_threshold: I18n.t("disable_search_threshold"),
  allow_single_deselect: true,
  no_results_text: I18n.t("not_found")
});
});

$(document).on('click', '.toggle_subject, .toggle_menu', function(e){
  $input = $( this );
  $target = $('#'+$input.attr('data-toggle'));
  $target.slideToggle();
});
