$(document).ready(function(){
  list_projects();
  list_users();
});

function list_projects() {
  $('#timesheet-list-projects').change(function(){
    var project_id = $(this).val();
    $.ajax({
      url: '/timesheets',
      type: 'GET',
      data: {
        project_id: project_id
      }
    });
  })
}

function list_users() {
  $('#timesheet-list-users').change(function(){
    var user_id = $(this).val();
    $.ajax({
      url: '/timesheets',
      type: 'GET',
      data: {
        user_id: user_id
      }
    });
  })
}
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
