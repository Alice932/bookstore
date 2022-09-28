$(document).on('turbo:load', function(){
  $('.rating .fa-star').on('click', function() {
    $(this).closest('.rating').find('.--selected').removeClass('--selected');
    $(this).toggleClass('--selected');
  });
});

