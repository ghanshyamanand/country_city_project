$(document).on('change', '#country_select_tag', function (e) {
  // var project_id    =  $('#current_project_id').val();
  var country_id    =  $(this).val()
  if(country_id ) {
    var url = "/country/" + country_id + "/fetch_cities"
    $.get( url );
  }
})
