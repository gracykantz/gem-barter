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
      loop: true,
      on: {
        slideChange: function(){
          const section = document.querySelector("#swipe-section-"+this.realIndex);
          // const furniture = document.querySelector('.swiper-slide-active');
          // console.log(fid);
          // console.log(furniture.dataset);
          console.log("print this");
          console.log(section.dataset.furnitureitemid);
          const fid = section.dataset.furnitureitemid;
          // console.log(section.dataset);
          // console.log(fid);
          // console.log(this)
          // console.log(this.value)
          // console.log(this.activeIndex)
          // console.log(this.realIndex)
          // console.log(this.$el)
          const direct = this.touches.diff;
          // console.log(this.touches.diff)
          console.log(direct);
          if (direct) {
          $.ajax({
            url: "/update_swipes",
            method: "post",
            // datatype: 'script',
            data: {fid, direct}
          })
          }
        }
      }
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
        console.log(mySwiperV);
        pp2.slideNext();
        // mySwiperV.slideNext();
      }}
    });

    // const slider = document.querySelector('.swiper-container-h').swiper;
    //  console.log(slider.activeIndex);

    // const sliders = document.querySelector('.card--image');
    // console.log(sliders);

