function change_box_mail() {
  $('#select_box_mail').change(function(){
    var type = $(this).val();
    $.ajax({
      url: '/messages',
      type: 'GET',
      data: {type: type}
    });
  });
}

function message_seen() {
  $('.btn-message-seen').click(function(){
    var id = $(this).data('id');
    var save = this;
    $.ajax({
      url: '/messages/' + id,
      type: 'PUT',
      dataType: 'js',
      data: {data: id},
      success: function(response) {
        $(save).closest('tr').find('.status-message').removeClass('btn-success').addClass('btn-info').html('Đã xem')
      },
      error: function(errors) {
      }
    });
  });
}

$(document).ready(function(){
  change_box_mail();
  message_seen();
});
