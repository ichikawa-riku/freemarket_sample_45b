$(function() {
  $(".top-appbanner").slick({
    autoplay: true,
    autoplaySpeed: 5000,
    speed: 800,
    arrows: true,
    dots: true,
    pauseOnDotsHover: true,
    prevArrow: '<img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-prev.png" class="slide-arrow prev-arrow">',
    nextArrow: '<img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-next.png" class="slide-arrow next-arrow">',
    dotsClass: 'slide-dots'
  });

  $(".slide-dots li").on("mouseover", function(){
    $(this).parents(".top-appbanner").slick("slickGoTo", $(this).index());
  });
});
