(function ($) {
  $(function(){

    var util = {
        getUrlParam: function(){
            if(!window.location.search){
                return {};
            }
            var data = decodeURIComponent(window.location.href).split("?")[1].split("&");
            var param = {};
            for(var i = 0; i<data .length; i++){
                param[data [i].split("=")[0]] = data [i].split("=")[1];
            }
           return param;
        }
    };

    var bodyId = $("body").attr('id');
    $.toast = function (text) {
      var ele = $('<p>'+text+'</p>').addClass('toast');
      $("body").append(ele);
      setTimeout(function () {ele.remove()},1500);
    }
    
    var control = {
      select: function () {
        var roleList = ["BROKER", "AGENT", "TC",  "BUYER", "SELLER"];
        var ele = $(".select p"),
            options = $(".select ul");
             
         $(".select ul li").each(function (index, item) {
            $(item).data('role', roleList[index]);
         });

        ele.on('click', function (e) {
          e.stopPropagation();
          options.show()
        });

        options.on('click', 'li', function (e) {
          ele.text($(e.target).text());
          ele.data('role', $(e.target).data('role'));
          options.hide();
        });

        $(document).on("click", function (e) {
          //e.stopPropagation();
          options.hide();
        });
      },
      auth: function(ele,type) {
          var reg = {
            password:/^[^\s]{6,20}$/,
            name:/^[a-zA-z\s]{1,50}/
          };
          if(!reg.password.test(ele.val()) && type == "password"){
            $.toast('Password must be between 6 and 20 charactors');
            ele.css("border",'1px solid red').addClass('error');
          }else if(!reg.name.test(ele.val()) && type == "name"){
            $.toast('Name must be between 1 ~ 50 charactors');
            ele.css("border",'1px solid red').addClass('error');
          }else{
            ele.css("border",'1px solid #a0a0a0').removeClass('error');
          }

      }
    };

    var pages = {
      register: function () {
        
        control.select();

        function register () {
          var postData = {
              sig:hex_md5(($('input[type="email"]').val() + 
                  hex_md5($('input[type="password"]').val()) +
                  $('input[type="text"]').eq(0).val() + 
                  $('input[type="text"]').eq(1).val() +
                  ($(".select p").data('role') || "AGENT") +
                  "fa4796fe493d7bbeec4b301dd69f9d41").substring(0,49)),
              clientInfo: "",
              account: $('input[type="email"]').val(),
              password: hex_md5($('input[type="password"]').val()),
              firstName: $('input[type="text"]').eq(0).val(),
              lastName: $('input[type="text"]').eq(1).val()
              //role: $(".select p").data('role') || "AGENT"
          }
          var urlArgs = util.getUrlParam();
          if(urlArgs["teamId"]){
                postData.teamId = urlArgs["teamId"]; 
          }
          if(urlArgs["memberUserId"]){
                postData.memberUserId = urlArgs["memberUserId"];
          }
          if(urlArgs["vc"]){
                postData.vc = urlArgs["vc"];
          }
          $.ajax({
            type:"POST",
            url:"/register/simple",
            dataType:'json',
            data: postData,
            beforeSend: function () {
              var hasError = false;
              $('input').each(function (index, item) {
                if ($(item).hasClass('error') || $(item).val().trim() == '') {
                  $(item).css('borderColor', 'red');
                  hasError = true;
                }
              });
              if(hasError){
                $.toast('Incorrect information');
                return false;
              }
            },
            success: function (res) {
              $.toast(res.status.msg);
              if(res.status.code == 0){
                setTimeout(function () {
                  window.location.href= "/login/page";
                },1000);
              }
            }
          });
        }

        (function evenListen () {
          $('input[type="password"]').blur(function () {
            control.auth($(this),"password");
          });
          $('input[type="text"]').blur(function () {
            control.auth($(this),"name");
          });

          $('input[type="submit"]').on('click', function (e) {
            e.preventDefault();
            register();
          });
        })();
      },

      login: function () {
        function login () {
          $.ajax({
            type:"POST",
            url:"/login",
            dataType:'json',
            data:{
              sig:hex_md5(($('input[type="email"]').val() + 
                  hex_md5($('input[type="password"]').val()) +
                  "fa4796fe493d7bbeec4b301dd69f9d41").substring(0,49)),
              clientInfo: "",
              account: $('input[type="email"]').val(),
              password: hex_md5($('input[type="password"]').val())
            },
            beforeSend: function () {
              var hasError = false;
              $('input').each(function (index, item) {
                if ($(item).hasClass('error') || $(item).val().trim() == '') {
                  $(item).css('borderColor', 'red');
                  hasError = true;
                }
              });
              if(hasError){
                $.toast('Incorrect information');
                return false;
              }
            },
            success: function (res) {
              $.toast(res.status.msg);
              if(res.status.code == 0){
                setTimeout(function () {
                  window.location.href= "/register/regSuccPage";
                },1000);
              }
            }
          });
        }
        (function evenListen () {
          $('input[type="password"]').blur(function () {
            control.auth($(this),"password");
          });
          $('input[type="text"]').blur(function () {
            control.auth($(this),"name");
          });

          $('input[type="submit"]').on('click', function (e) {
            e.preventDefault();
            login();
          });
        })();
      }
    };

    

    (function init () {
      switch(bodyId){
        case "register":
          pages.register();
          break;
        case "login":
          pages.login();
          break;
      }
    })();
  });
})(Zepto);
