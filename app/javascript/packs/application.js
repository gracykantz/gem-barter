import "bootstrap";
import "hammerjs";
import Swiper from 'swiper';
import $ from "jquery"


    const swiperH = new Swiper('.swiper-container-h', {
      spaceBetween: 250,
      pagination: {
        el: '.swiper-pagination-h',
        clickable: true,
      },
    });



    const swiperV = new Swiper('.swiper-container-v', {
      direction: 'vertical',
      spaceBetween: 250,
      pagination: {
        el: '.swiper-pagination-v',
        clickable: true,
      },
       navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      on: {click: (event) => {
        const mySwiperV = document.querySelector('.swiper-container-v').swiper;
        mySwiperV.slideNext();
      }}
    });


/*  swiperV.on('click', (event) => {
    alert("tapped");
  });
*/
//  swiperV.on('slideChange', function() {

  // alert("tapped");
  //});

// Now you can use all slider methods like
//Swiper.slideNext();
