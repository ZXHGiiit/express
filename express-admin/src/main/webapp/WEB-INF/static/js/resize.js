window.onresize = _r;

function _r (resizeNum) {
  var winW = window.innerWidth > 750 ? 750:window.innerWidth ;
  document.getElementsByTagName("html")[0].style.fontSize = winW * 0.13333333 + "px";

  if(winW > window.screen.width && resizeNum <= 10){
    setTimeout(function () {
      _r(++resizeNum)
    },100);
  }else{
    document.getElementsByTagName("body")[0].style.opacity = 1;
  }
}

setTimeout(function() {_r(0)},100);