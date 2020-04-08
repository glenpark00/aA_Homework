window.setTimeout(function () {
  alert('HAMMERTIME');
}, 5000);

const hammerTime = function (time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`);
  }, time);
};