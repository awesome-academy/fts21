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

$(document).on('click', '#add_trainee', function(e){
  var checked = []
  $("input[name='course[trainee_ids][]']:checked").each(function ()
  {
    checked.push(parseInt($(this).val()));
  });
  if( checked.length == 0 ){
    alertify.error(I18n.t("courses.add_trainee"));
  } else {
    alertify.confirm(I18n.t("confirm_text"), I18n.t("confirm"),
      function(){
        $.ajax({
          url: window.location.href + '/add_trainee',
          type: 'POST',
          data: {trainee_ids: checked},
        })
        .done(function(el) {
          if(el && el.error){
            alertify.error(el.error);
          } else {
            var sum_trainees = parseInt($('#sum_trainees').html());
            $('#sum_trainees').html(el.length + sum_trainees);
            $('#no_trainees').remove();
            el.forEach(function (user) {
              $('#pills-trainee .list-group').prepend('<li class="list-group-item">'+user.name+
                '<div class="pull-right action-buttons">'+
                '<i class="fa fa-pencil"></i>'+
                '<i class="fa fa-trash" id="delete_trainee" trainee_id="'+user.id+'"></i>'+
                '</div></li>');
            })
          }
        })
        .fail(function(err) {
          alertify.error(err);
        });
        $('#modal-trainee').modal('hide');
        $('.nav-item a[href="#pills-trainee"]').tab('show');
      },
      function(){
        alertify.error(I18n.t("cancel"));
      });
  };
});
$(document).on('click', '#delete_trainee', function(e){
  var this_el = $(this);
  var trainee_id = parseInt($(this).attr('trainee_id'));
  alertify.confirm(I18n.t("confirm_text"), I18n.t("confirm"),
    function(){
      $.ajax({
        url: window.location.href + '/delete_trainee',
        data: {user_id: trainee_id},
        type: 'DELETE'
      })
      .done(function(el) {
        if(el.success){
          this_el.closest('li').slideUp().remove();
          alertify.success(el.success);
          var sum_trainees = parseInt($('#sum_trainees').html()) - 1;
          $('#sum_trainees').html(sum_trainees)
        } else {
          alertify.error(el.error);
        }
      })
      .fail(function(err) {
        alertify.error(err);
      });
    },
    function(){
      alertify.error(I18n.t("cancel"));
    });
});
