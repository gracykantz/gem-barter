//= require rails-ujs
//= require_tree .
//= require ./cable.js
console.log("hello")




var initSweetalert = function initSweetalert(selector) {
  var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
  var swalButton = document.querySelector(selector);

  if (swalButton) {
    // protect other pages
    swalButton.addEventListener('click', function () {
      swal(options);
    });
  }
};

function notTest(id) {
initSweetalert("#" + id, {
  title: "A nice alert",
  text: "This is a great alert, isn't it?",
  icon: "success"
});
};
