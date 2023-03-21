$('.rating').on('click', '.ratings_stars', function () {
  var star = $(this)
  star.addClass('selected')
  star.prevAll().addClass('selected')
  star.nextAll().removeClass('selected')
  $('#rating').val(star.data('rating'))
});
