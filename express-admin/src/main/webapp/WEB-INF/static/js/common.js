(function($) {

    var tasks = {};
    $.toast = function (text) {
      var ele = $('<p>'+text+'</p>').addClass('toast');
      $("body").append(ele);
      setTimeout(function () {ele.remove()},1500);
    }
    tasks.init = function() {
        var page = $("body").data("page");

        if(page === 'listDetail') {
            var imgSize = $(".inner-item").size(),
                $flagMom = $(".flag-mom"),
                $flagChild = $(".flag-child");

            $flagMom.text(imgSize);
            setTimeout(function() {
                var inner = Flipsnap('.inner',{
                    distance:$(".inner-img").width(),
                    maxPoint:3        //最多移动的次数
                });
                var $pointer=$('.pointer span');
                inner.element.addEventListener('fsmoveend',function(){
                    $pointer.filter('.color').removeClass('color'); //filter 为jquery的筛选器，筛选出与指定表达式匹配的元素集合
                    $pointer.eq(inner.currentPoint).addClass('color');
                    $flagChild.text(inner.currentPoint + 1);
                },false);
                
            },200);

        }
    }

    tasks.bindEvent = function() {
        var $descList = $(".desc-list"),
            $calculate = $(".calculate-result"),
            $menu = $("#menu"),
            $body = $(".wrapper"),
            $backTop = $("#scroll-top"),
            $search = $(".search-text "),
            $detailSend = $(".detail-send");

        $descList.on('click', '.desc-title', function() {
            $descList.find('.desc-title').next("div").hide();
            $(this).next("div").show();
        });
        $detailSend.on('click', function() {
            var phone = parseInt($("input[name='phone']").val()),
                email = $("input[name='email']").val(),
                regPhone = /^[0-9]{10}$/g,
                regEmail =  /^(?:\w+\.?)*\w+@(?:\w+\.)*\w+$/g;
            if($('.touch input[placeholder="Your name"]').val().trim() == ''
                || $('.touch input[type="email"]').val().trim() == ''){
                $.toast('Your name and Email address are required!');
            }else if(!regPhone.test(phone)) {
                $.toast('invalid phone format!');
            }else if(!regEmail.test(email)) {
                $.toast('invalid email format!');
            }else{
                $.toast("Thanks for choosing us!We will contact you soon.");
            }
        });
        //计算器计算结果
        $calculate.on('click', function() {
            calculateResult(this);
        });

        //菜单显示隐藏
        $menu.on('click', function(event) {
            event.stopPropagation();
            $('.list').show();
        });

        $body.on('click', function(event) {
            //event.stopPropagation();
            $('.list').hide();
        });

        //返回顶部
        $backTop.on('click', function(event) {
            event.preventDefault();
            window.scrollTo(0, 0);
        });

        $search.on('click', ".submit-btn", function () {
            window.location.href = "/static/demo/demo_hasresult.html";
        });

        $(".hourse .photo").each(function (index, item) {
           $(item).on('click', function () {
           window.location.href = "/static/demo/demo_listdetail"+(index+1)+".html";
          });
        });
    }

    function calculateResult(that) {
        var $this = $(that),
            $form = $this.closest('form'),
            $result = $("input[name='result']"),
            data = {},
            M, R, t, r, dp;

        $.each($form.serializeArray(),function(index, field) {
            data[field.name] = field.value.replace(/[^0-9\.]+/g, "");
        });

        M = parseInt(data.price)? parseInt(data.price):function() {alert("You must enter a number for the parice");return false;};
        t = parseInt(data.term)*12;
        r = parseFloat(data.rate)/1200;
        dp = 1-parseFloat(data.down)/100;
        M = M * dp;
        P = ( M*( r*Math.pow( 1+r,t ) ) ) / ( Math.pow( 1+r,t )-1 ); 

        if(!isNaN(P)) {
            data.result = P.toFixed(2);
            $result.val(data.result);
        }else {
            alert("This a error, please check your values.");
        }
        // console.log(data.result);
    }

    $(function(){

        for(var i in tasks) {
            tasks[i]();
        }

    });

})(Zepto);
