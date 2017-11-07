var VerifyCodeFormValidator = function() {
    var handleSubmit = function() {
        $('.form-horizontal').validate({
            errorElement : 'span',
            errorClass : 'help-block',
            focusInvalid : false,
            rules : {
                verifyCode : {
                    required : true
                }
            },
            messages : {
                verifyCode : {
                    required : "Please input the verify code."
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
        }


    };

    var handler = {
        trackLead: function(event){
            var postData = {
                verifyCode: this.form["verifyCode"].value
            };
            console.log(postData);

            this.form.submit();
            //util.ajax("/backend/verify", postData, function(data){
            //    console.log(data)
            //    if(data && data.status && data.status.msg){
            //        alert("[" + data.status.code +  "]" + data.status.msg);
            //        //util.toast("[" + data.status.code +  "]" + data.status.msg,3000);
            //    }else{
            //        alert("succeed.");
            //    }
            //}, "POST");
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
