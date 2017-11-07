<c:set var="staticVersion" value="12"></c:set>
<meta charset="utf-8"></meta>
<link rel="icon" href="//static.chimeroi.com/home/images/logo/new-logo.ico">
<link href="/backend/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="/backend/static/DataTables/datatables.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/backend/static/payment-admin/common.css?v=${staticVersion}"></link>
<script>
var PAGE_UTIL = {
paddingZero: function(_num, numBits){
var num = _num.toString();
if(num.length < numBits){
num = ("00000000" + num).substr(-numBits);
}
return num;
},
getDateStr: function(day){
return day.getFullYear() + "-"
+ ("0" + (day.getMonth() + 1)).substr(-2) + "-"
+ ("0" + day.getDate()).substr(-2);
},
getDateTime: function(dateStr){
var times = dateStr.split("-");
var thisDate = new Date();
thisDate.setFullYear(+times[0]);
thisDate.setMonth(+times[1] - 1);
thisDate.setDate(+times[2]);
return thisDate.getTime();
},
addDateByMonth: function(oldDate, month){
var future = null;
if(oldDate.constructor === Array){
future = new Date(oldDate[0], oldDate[1] - 1, oldDate[2]);
} else {
future = new Date(oldDate);
}
future.setMonth(future.getMonth() + month);
return future.getFullYear()  + "-" + ("0" + (future.getMonth() + 1)).substr(-2) + "-" + future.getDate();
},
longToDate: function(longTime){
var date = new Date(longTime);
return date.getFullYear()  + "-" + date.getMonth() + "-" + date.getDate();
}
};
</script>
<script>var PAGE_DATA = {};</script>
