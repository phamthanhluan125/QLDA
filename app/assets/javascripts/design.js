function load_input() {
  $('input').each(function(){
    if($(this).val().length > 0)
      $(this).parents('.form-group').removeClass('is-empty');
    else {
      if($(this).parents('.form-group').hasClass('is-empty') === false)
        $(this).parents('.form-group').addClass('is-empty');
    }
    if($(this).hasClass('date') && ($(this).val().length > 0)) {
      date = $(this).val().split('-');
      if(date[0].length == 4) {
        $(this).val(date[2] + '/' + date[1] + '/' + date[0])
      }
    }
  });
  $('textarea').each(function(){
    if($(this).val().length > 0)
      $(this).parents('.form-group').removeClass('is-empty');
    else {
      if($(this).parents('.form-group').hasClass('is-empty') === false)
        $(this).parents('.form-group').addClass('is-empty');
    }
  });
}

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('.edit-user-avatar').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

function compare_date(date1, date2) {
    date_list1 = date1.split('/');
    date_list2 = date2.split('/');
    first = new Date(date_list1[2], date_list1[1], date_list1[0]);
    last = new Date(date_list2[2], date_list2[1], date_list2[0]);
    if(first > last)
      return true;
    else
      return false
}

function validate_time_start_deadline_project(){
  $('.date-start').change(function(){
    var date_start = $(this).val();
    debugger
    if($(this).parents('.row').find('.limit-time').length > 0) {
      date_limit_start = $(this).parents('.row').find('.limit-time').data('start');
      date_limit_end = $(this).parents('.row').find('.limit-time').data('end');
      if(compare_date(date_limit_start, date_start)) {
        sweetAlert('Lỗi!!!', 'Công việc không thể bắt đầu trước ngày bắt đầu '
          + $(this).parents('.row').find('.limit-time').data('name') + '('
          + date_limit_start +  ')', 'error');
        $(this).val(date_limit_start);
        return;
      }
      if(compare_date(date_start, date_limit_end)) {
        sweetAlert('Cảnh báo!!!', 'Thời gian chọn lớn hơn thời gian kết thúc dự kiến của '
          + $(this).parents('.row').find('.limit-time').data('name') + '('
          + date_limit_start +  '). Thời gian chọn này có thể làm cho '
          + $(this).parents('.row').find('.limit-time').data('name') + ' chậm tiến độ.', 'warning');
        return;
      }
    }
    var date_end = $('.date-end').val();
    if(date_end.length > 0) {
      if(compare_date(date_start, date_end)){
        sweetAlert('Lỗi!!!', 'Ngày bắt đầu phải nhỏ hơn ngày kết thúc.', 'error');
        $(this).val(date_end);
      }
    }
  });
  $('.date-end').change(function(){
    var date_end = $(this).val();
    if($(this).parents('.row').find('.limit-time').length > 0) {
      date_limit_end = $(this).parents('.row').find('.limit-time').data('end');
      if(compare_date(date_end, date_limit_end)) {
        sweetAlert('Cảnh báo!!!', 'Thời gian chọn lớn hơn thời gian kết thúc dự kiến của '
          + $(this).parents('.row').find('.limit-time').data('name') + '('
          + date_limit_start +  '). Thời gian chọn này có thể làm cho '
          + $(this).parents('.row').find('.limit-time').data('name') + ' chậm tiến độ.', 'warning');
        return;
      }
    }
    var date_start = $('.date-start').val();
    if(date_start.length > 0) {
      if(compare_date(date_start, date_end)){
        sweetAlert('Lỗi!!!', 'Ngày kết thúc phải lớn hơn ngày bắt đầu.', 'error');
        $(this).val(date_start);
      }
    }
  });
}

function ajax_change_choose_project() {
  $('#choose-project').change(function(){
    var id = $(this).val();
    var url = window.location.href;
    if(url.indexOf('choose_id') < 1) {
      url += ('?choose_id=' + id)
    }
    else {
      urls = url.split('?');
      url = urls[0] + ('?choose_id=' + id)
    }
    window.location.href = url;
    // $.ajax({
    //   url: '/' + type + 's',
    //   type: 'GET',
    //   dataType: 'json',
    //   data: {
    //     choose_id: id
    //   },
    //   success: function(response) {
    //     location.reload();
    //   },
    //   error: function(errors) {
    //     location.reload();
    //   }
    // });
  });
}

$(document).ready(function(){
  validate_time_start_deadline_project();
  ajax_change_choose_project();

  $('.btn-user-edit').click(function(){
    load_input();
  });

  $('.upload-img').change(function(e){
    readURL(this);
  });
  $('.date').bootstrapMaterialDatePicker({
    format: 'DD/MM/YYYY',
    time: false
  });
});
