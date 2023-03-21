$(document).on('turbo:load', function(){
   $(document).ready(function() {
    var showChar = 250;
    var ellipsesText = "...";
    var lessText = "Read less";
    var moreText = "Read more";
    $('.input-count-course').val(1);

    var initContent = $('.lessText').text();
    const course_priceValue = Number($('#course_price').text().slice(1));
    const currency = $('#course_price').text().split('')[0];

    $('#minus').click(function(e){
      var currentValue = $('.input-count-course').val();
      if (currentValue >= 2) {
        var newValue = Number(currentValue) - 1;
        $('.input-count-course').val(newValue);
        $('#course_price').text(currency + (Number($('#course_price').text().slice(1)) - course_priceValue));
      }
    });

    $('#plus').click(function(e){
      var currentValue = $('.input-count-course').val();
      if (currentValue < 10) {
        var newValue = Number(currentValue) + 1;
        $('.input-count-course').val(newValue);
        $('#course_price').text(currency + (course_priceValue * newValue));
      }
    });

    if (initContent.length > showChar) {
      var lessTextInit = initContent.substr(0, showChar);
      $('.lessText').text(lessTextInit);
      $('.moreContentBtn').text(moreText);
      $('.lessText').addClass('less');
    }

    $('.moreContentBtn').on('click', function(){
    var html = '';

    if ($('.lessText').hasClass('less')) {
      $('.lessText').text(initContent);
      $('.lessText').removeClass('less');
      $('.moreContentBtn').text(lessText);
    } else {
      $('.lessText').text(lessTextInit);
      $('.lessText').addClass('less');
      $('.moreContentBtn').text(moreText);
    }
    });
  });
})
