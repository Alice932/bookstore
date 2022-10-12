document.addEventListener("turbo:load", function () {
  const photos = ["#photo-0", "#photo-1", "#photo-2", "#photo-3"];
  const small_img = "115";
  const big_img = "350";
  let main_photo = "#photo-0";
  photos.forEach(function (element) {
    document.querySelector(element).addEventListener("click", function () {
      if (element != main_photo) {
        let temp_photo = document.querySelector(element).src;
        document.querySelector(element).src = document.querySelector(
          main_photo
        ).src;
        document.querySelector(element).height = small_img;
        document.querySelector(element).width = small_img;
        document.querySelector(main_photo).src = temp_photo;
        document.querySelector(main_photo).height = big_img;
        document.querySelector(main_photo).width = big_img;
      }
    });
  });
});
