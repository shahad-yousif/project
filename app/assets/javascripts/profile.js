$(document).on('turbolinks:load', function() {
  $('.profile_check').change(function() {
    $.ajax({
      url: 'profiles/' + this.id + '/change_status/',
      type: 'post'
    });
  });

  $(document).ajaxComplete(function(event, request) {
    var alert_type, msg;
    msg = request.getResponseHeader("X-Message");
    alert_type = 'alert-success';
    if (request.getResponseHeader("X-Message-Type").indexOf("error") !== -1) {
      alert_type = 'alert-danger';
    }
    if (request.getResponseHeader("X-Message-Type").indexOf("keep") !== 0) {
      if (msg) {
        $("#flash_hook").replaceWith("<div id='flash_hook'><div class='text-center'><div class='alert " + alert_type + "'> <button type='button' class='close' data-dismiss='alert'>&times;</button>" + msg + "</div> </div> </div>");
      }
      if (!msg) {
        return $("#flash_hook").replaceWith("<div id='flash_hook'></div>");
      }
    }
  $(".alert" ).fadeOut(3000);  
  });



