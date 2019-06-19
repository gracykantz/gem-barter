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
      loop: true,
      on: {click: (event) => {
        const ppp = event.target.parentElement;
        const pp1 = ppp.parentElement;
        const pp2 = pp1.parentElement.swiper;

        const mySwiperV = document.querySelector('.swiper-container-v').swiper;
        pp2.slideNext();
        // mySwiperV.slideNext();
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
