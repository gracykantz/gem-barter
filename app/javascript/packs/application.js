import "bootstrap";
import "hammerjs";
import Swiper from 'swiper';
import $ from "jquery"


let nope = false;
    const swiperH = new Swiper('.swiper-container-h', {
      spaceBetween: 250,
      pagination: {
        el: '.swiper-pagination-h',
        clickable: true,
      },

      //loop: true,
      on: {slideChange: function() {
        let activeSlide = document.querySelector(`#swipe-section-mmb-${this.realIndex}`);
        console.log(this.realIndex)
          console.log(activeSlide)
      //)  console.log(this.activeIndex);
       // console.log("dataset"+ JSON.stringify(activeSlide.dataset));
      if (!nope) {
        nope = true;
      }
      else {
        if (activeSlide !== null) {
          //activeSlide.parentNode.removeChild(activeSlide);
        } else {
        }


      };

      }}
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
      }}
    });
