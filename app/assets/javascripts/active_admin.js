
//= require arctic_admin/base

$(document).ready(function() {
  // Hide flash messages after 3 seconds
  $(".flash_notice").delay(3000).slideUp(300);
  $(".flash_warning").delay(3000).slideUp(300);
  $(".flash_alert").delay(3000).slideUp(300);

 $('#category_select').on('change', function() {
    var categoryId = $(this).val();
    var subcategorySelect = $('#subcategory_select');

    if (categoryId) {
      $.ajax({
        url: '/admin/sub_categories.json',
        data: { category_id: categoryId },
        dataType: 'json',
        success: function(data) {
          subcategorySelect.empty();
          subcategorySelect.append('<option value="">Select subcategory</option>');
          data.sub_categories.forEach(function(subcategory) {
            subcategorySelect.append('<option value="' + subcategory.id + '">' + subcategory.name + '</option>');
          });
          subcategorySelect.prop('disabled', false); // Enable the subcategory select
          subcategorySelect.trigger('change'); // Trigger the change event
          subcategorySelect.slideDown(); // Show the subcategory select
        }
      });
    } else {
      subcategorySelect.empty();
      subcategorySelect.append('<option value="">Select subcategory</option>');
      subcategorySelect.prop('disabled', true); // Disable the subcategory select
      subcategorySelect.slideUp(); // Hide the subcategory select
    }
  });

  // Add this code to show the subcategory when a category is selected
  $('#category_select').on('change', function() {
    var subcategorySelect = $('#subcategory_select');
    subcategorySelect.slideDown(); // Show the subcategory select
  });
});