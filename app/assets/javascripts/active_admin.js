
//= require arctic_admin/base

$(document).ready(function() {
  // Hide flash messages after 3 seconds
  $(".flash_notice").delay(3000).slideUp(300);
  $(".flash_warning").delay(3000).slideUp(300);
  $(".flash_alert").delay(3000).slideUp(300);
});