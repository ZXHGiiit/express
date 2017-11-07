

setTimeout(function() {
(function ($) {
  $(function(){

    var bodyId = $("body").attr('id'),
        home = {},
        blog = {},
        map = {};

    $.toast = function (text) {
      var ele = $('<p>'+text+'</p>').addClass('toast');
      $("body").append(ele);
      setTimeout(function () {ele.remove()},1500);
    }

    function list () {
      $('.list-button').on('click', function (e) {
        e.stopPropagation();
        $('.list').show();
      });
      $('.wrapper').on('click', function (e) {
        setTimeout(function() {
          e.stopPropagation();
          $('.list').hide();
        },300);
        
      });
    }
/*
    function submit () {
      $('.touch input[type="submit"]').on('click', function () {
        var phone = parseInt($("input[name='phone']").val()),
            email = $("input[name='email']").val(),
            regPhone = /^[0-9]{10}$/g,
            regEmail =  /^(?:\w+\.?)*\w+@(?:\w+\.)*\w+$/g;
        if($('.touch input[placeholder="First name"]').val().trim() == ''
          || $('.touch input[type="email"]').val().trim() == ''){
          $.toast('First name and Email address are required!');
        }else if(!regPhone.test(phone)) {
          $.toast('invalid phone format!');
        }else if(!regEmail.test(email)) {
          $.toast('invalid email format!');
        }else{
          if(bodyId == 'chatpre') {
            window.localStorage.username = $('.touch input[placeholder="First name"]').val().trim();
            window.localStorage.email = $('.touch input[type="email"]').val().trim(); 
            $.toast("success!");

           setTimeout(function () {
            window.location.href = "/static/demo/demo_chat.html";
           }, 1000);
          }else {
            $.toast("success!");
            setTimeout(function () {
            window.location.href = "/static/demo/demo_home.html";
            }, 1000);
          }
        }
      })
    }
*/
    home.flipsnap = function () {

      var bannerHtml = '\
            <div><a href="/static/demo/demo_listdetail1.html"><img src="/static/images/demo/banner1.jpg"></a></div>\
            <div><a href="/static/demo/demo_listdetail2.html"><img src="/static/images/demo/banner2.jpg"></a></div>\
            <div><a href="/static/demo/demo_listdetail3.html"><img src="/static/images/demo/list/banner1.jpg"></a></div>\
            <div><a href="/static/demo/demo_listdetail4.html"><img src="/static/images/demo/list/banner2.jpg"></a></div>\
            ',
            commentHtml = '<div>\
            <p><img src="/static/images/demo/user1.png"> <span>Christine McLellan</span>\
            <img src="/static/images/demo/star.png"></p>\
            <p class="text">Linda was always professional and knowledgeable in all aspects of our transaction.She made a tedious process almost enjoyable.</p>\
          </div>\
          <div>\
            <p><img src="/static/images/demo/user1.png"> <span>David W. Orr</span>\
            <img src="/static/images/demo/star.png"></p>\
            <p class="text">Linda was always professional and knowledgeable in all aspects of our transaction.She made a tedious process almost enjoyable.</p>\
          </div>\
          <div>\
            <p><img src="/static/images/demo/user1.png"> <span>Jim Hunt</span>\
            <img src="/static/images/demo/star.png"></p>\
            <p class="text">Linda was always professional and knowledgeable in all aspects of our transaction.She made a tedious process almost enjoyable.</p>\
          </div>';
      var banner = Flipsnap('.carousels',{
        distance:$('.carousels img').width()
      });
      var $pointer=$('.pointer span');
      banner.element.addEventListener('fsmoveend',function(){
          $pointer.filter('.color').removeClass('color');            //filter 为jquery的筛选器，筛选出与指定表达式匹配的元素集合
          $pointer.eq(banner.currentPoint%4).addClass('color');
      },false);

      var timerBanner = setInterval(function () {
        banner.toNext();
        if(!banner.hasNext()){
          $('.carousels').width($('.carousels').width()+$('.carousels>div').width()*4);
          $('.carousels').append(bannerHtml);
          banner.refresh();
        }
      },3000);

      Flipsnap('.more-roll',{
        distance:$('.more-roll img').width()-50
      });

      var comment = Flipsnap('.comment',{
        disableTouch: true,
        distance:$('.comment>div').width()
      });
      var timer = setInterval(function () {
        comment.toNext();
        if(!comment.hasNext()){
          $('.comment').width($('.comment').width()+$('.comment>div').width()*3);
          $('.comment').append(commentHtml);
          comment.refresh();
          //comment.toNext();
          //comment.currentPoint =-1;
        }
      },4000);
    };

    home.eventLister = function () {
      
      $(".info img").each(function (index, item) {
        $(item).on('tap', function () {
          window.location.href = "/static/demo/demo_listdetail"+(index+1)+".html";
        });
      });

      $(".more-roll>div").each(function (index, item) {
        $(item).on('tap', function () {
          window.location.href = "/static/demo/demo_blogdetail"+(index+1)+".html";
        });
      });
    };

    home.init = function () {
      this.flipsnap();
      this.eventLister();
    };


    blog.eventLister = function () {
      $(".abstrct").each(function (index, item) {
        $(item).on('tap', function () {
          window.location.href = "/static/demo/demo_blogdetail"+(index+1)+".html";
        });
      });
    };


    map.init = function () {
      var mapProp = {
        center:new google.maps.LatLng(38.913611,-77.013222),
        zoom:5,
       "client_id":"1081877852752-9djuga5grj5bhu0vv7frlf9rh8uud1tm.apps.googleusercontent.com",
        "auth_uri":"https://accounts.google.com/o/oauth2/auth",
        "token_uri":"https://accounts.google.com/o/oauth2/token",
        "auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs",
        "client_secret":"0Xi_iLmh4XLTgIEzregH59VG"}
      
      var map=new google.maps.Map(document.getElementById("googleMap")
        ,mapProp);
    };

    !function () {
      list();
      //submit();
      switch(bodyId){
        case "home":
          home.init();
          break;
        case "blog":
          blog.eventLister();
          break;
        case "map":
          google.maps.event.addDomListener(window, 'load', map.init);
          break;  
      };
    }();
  });
})(Zepto);
},110);
