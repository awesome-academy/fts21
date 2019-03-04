$(document).on("turbolinks:load", function(){
  $('[id^=subject-]').hide();
  $('[id^=menu_show-]').hide();
  $("#course_subjects").chosen();
  $("#suppervisor_course, #suppervisor_subject").chosen({
  disable_search_threshold: I18n.t("disable_search_threshold"),
  allow_single_deselect: true,
  no_results_text: I18n.t("not_found")
});

  if($('.nested_form_tasks').length > 0) {
    nestedForm = $('.nested_form_tasks').last().clone();
  }

  if($('textarea').length > 0) {
    $('textarea').each (function(){
      Id = $(this).attr('id');
      new SimpleMDE({ element: document.getElementById(Id) });
    });
  };
});

$(document).on('click', '.toggle_subject, .toggle_menu', function(e){
  $input = $( this );
  $target = $('#'+$input.attr('data-toggle'));
  $target.slideToggle();
});

$(document).on('click', '.duplicate_nested_form', function(e){
  e.preventDefault();
  lastNestedForm = $('.nested_form_tasks').last();
  newNestedForm  = $(nestedForm).clone();
  formsOnPage    = $('.nested_form_tasks').length;
  $(newNestedForm).find('input, textarea').each (function(e){
    oldId = $(this).attr('id');
    $(this).val('');
    $(this).parent().find('.number').text(formsOnPage + 1);
    $('#number_sum').html(formsOnPage + 1);
    newId = oldId.replace(new RegExp(/_[0-9]+_/), '_'+formsOnPage+'_');
    $(this).attr('id', newId);
    oldName = $(this).attr('name');
    newName = oldName.replace(new RegExp(/\[[0-9]+\]/), '['+formsOnPage+']');
    $(this).attr('name', newName);
    $(newId).hide();
  });
  $( newNestedForm ).insertAfter( lastNestedForm);
  new SimpleMDE({ element: document.getElementById(newId)});
});

$(document).on('click', '.destroy_nested_form_tasks', function(e){
  e.preventDefault();
  if( $('.nested_form_tasks').length > $('.task_delete').length + 1) {
    $(this).closest('.nested_form_tasks').find('input:hidden').val(1);
    alertify.warning(I18n.t('subjects.task.confirm_save'));
    $(this).closest('.nested_form_tasks').addClass("task_delete");
  } else {
    alertify.error(I18n.t('subjects.task.not_accept'));
  }
});
