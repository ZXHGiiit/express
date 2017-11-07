var TrackLeadFormValidator = function() {
    var handleSubmit = function() {
        $('.form-horizontal').validate({
            errorElement : 'span',
            errorClass : 'help-block',
            focusInvalid : false,
            rules : {
                agentUserId : {
                    required : true
                },
                leadUserId : {
                    required : true
                },
                domain : {
                    required : true
                },
                type : {
                    required : true
                },
                source : {
                    required : true
                },
                leadType : {
                    required : true
                }
            },
            messages : {
                agentUserId : {
                    required : "Agent User Id is required."
                },
                leadUserId : {
                    required : "Lead User Id is required."
                },
                domain : {
                    required : "Domain is required."
                },
                type : {
                    required : "Client Tracking Type is required."
                },
                source : {
                    required : "Client Tracking Source is required."
                },
                leadType : {
                    required : "Lead Listing Type is required."
                }
            },

            highlight : function(element) {
                $(element).closest('.form-group').addClass('has-error');
            },

            success : function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement : function(error, element) {
                element.parent('div').append(error);
            },

            submitHandler : function(form) {
                //form.submit();
            }
        });

        $('.form-horizontal input').keypress(function(e) {
            if (e.which == 13) {
                if ($('.form-horizontal').validate().form()) {
                    $('.form-horizontal').submit();
                }
                return false;
            }
        });
    }







    var DOM = {
        $body: $("body"),
        $pop: $("#pop")
    }

    var util = {
        //发请求
        ajax: function(url, data, callback, method, context, arg){
            method = method || "GET";
            $.ajax({
                url: url,
                method: method,
                data: data,
                success: function(data){
                    if(data.status.code !== 0){
                        util.toast(data.status.msg);
                        return;
                    }
                    if(typeof callback === "function"){
                        callback.call(context, data, arg);
                    }
                }
            });
        },
        toast: function(_text, _delay){
            $(".toast").remove();
            $("body").append("<div class='toast'>"+_text+"</div>");
            clearTimeout(toastTime);
            var toastTime = setTimeout(function(){
                $(".toast").remove();
            },_delay||2000);
        },
        setCookie: function(cname, cvalue, exdays) {
            var expires = "";
            if(typeof exdays !== "undefined"){
                var d = new Date();
                d.setTime(d.getTime() + (exdays*24*60*60*1000));
                expires = "expires="+d.toUTCString();
            }
            document.cookie = cname + "=" + cvalue + "; " + expires;
        },
        getCookie: function(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i=0; i<ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1);
                if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
            }
            return null;
        },
        //上传文件
        uploadFile: function(url, form, callback, failCallback){
            form.action = url;
            var iframe = document.createElement("iframe");
            iframe.width = 0;
            iframe.height = 0;
            iframe.border = 0;
            iframe.name = "form-iframe";
            iframe.id = "form-iframe";
            iframe.setAttribute("style", "width:0;height:0;border:none");
            form.appendChild(iframe);
            form.target = "form-iframe";
            iframe.onload = function(){
                //获取iframe的内容，即服务返回的数据
                var responseData = this.contentDocument.body.textContent || this.contentWindow.document.body.textContent;
                try{
                    data = JSON.parse(responseData);
                }catch(e){
                    failCallback();
                    return;
                }
                if(data.status.code !== 0){
                    util.toast(data.status.msg);
                    return;
                }
                callback(data.data);
                //删掉iframe
                setTimeout(function(){
                    var _frame = document.getElementById("form-iframe");
                    _frame.parentNode.removeChild(_frame);
                }, 100);
            }
            form.submit();
        },
        newFormCheck: function(form, checkAccountExist, submitHandler){
            var checkRule = {
                "confirm-pwd": {
                    check: handler.checkPwdIdentity,
                    msg: "Passwords do not match"
                }
            };
            if(checkAccountExist){
                checkRule.account = {
                    check: handler.checkAccountExist,
                    msg: "Account has been exist!",
                    async: true
                };
            }
            return new Form(form, {
                errorMsgClass: "error",
                errorInputClass: "invalid",
                rule: checkRule,
                errorText: {
                    valueMissing: "Please fill out this field."
                }
            }, submitHandler);
        },
        loadScript: function(src){
            var script = document.createElement("script");
            script.src = src;
            document.head.appendChild(script);
        }
    };

    var handler = {
        trackLead: function(event){
            var postData = {
                agentUserId: this.form["agentUserId"].value,
                leadUserId: this.form["leadUserId"].value,
                domain: this.form["domain"].value,
                type: this.form["type"].value,
                source: this.form["source"].value,
                leadType: this.form["leadType"].value

            };
            console.log(postData);
            util.ajax("/backend/lead-assign/track", postData, function(data){
                console.log(data)
                if(data && data.status && data.status.msg){
                    alert("[" + data.status.code +  "]" + data.status.msg);
                    //util.toast("[" + data.status.code +  "]" + data.status.msg,3000);
                }else{
                    alert("succeed.");
                }
            }, "POST");
        }
    };

    function bindEvent(){
        $(".track-submit").on("click", handler.trackLead);
    };

    return {
        init : function() {
            handleSubmit();
            bindEvent();
        }
    };

}();
