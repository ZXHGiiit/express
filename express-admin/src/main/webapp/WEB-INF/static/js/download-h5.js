window.onload = function() {
    var DWH5 = {
        url: 0,
        isDown: false,
        scrollHandle: function() {
            $(".footer-banner").show();
        },
        clickHandle: function() {
            console.log("hello");
            if($(this).hasClass("andriod")) {
                DWH5.url = "/app/Chime.apk";
            } else {
                DWH5.url = "https://www.pgyer.com/rIVH";
            }
            $(this).addClass("active");
            window.location.href = DWH5.url;
        },
        //mouseupHandle: function() {
            //console.log("leave");
            //if(DWH5.isDown) {
                //window.location.href = DWH5.url;
            //}
        //},
        init: function() {
            $(window).one("scroll", this.scrollHandle);
            //$("button").on("mouseenter", this.mouseenterHandle);
            //$("button").on("mouseleave", this.mouseupHandle);
            $("button").on("click", this.clickHandle);
        }
    };
    DWH5.init();
};
