!function(e){function t(e){var t=document.getElementsByTagName("head")[0],n=document.createElement("script");n.type="text/javascript",n.charset="utf-8",n.src=f.p+""+e+"."+w+".hot-update.js",t.appendChild(n)}function n(e){if("undefined"==typeof XMLHttpRequest)return e(new Error("No browser support"));try{var t=new XMLHttpRequest,n=f.p+""+w+".hot-update.json";t.open("GET",n,!0),t.timeout=1e4,t.send(null)}catch(a){return e(a)}t.onreadystatechange=function(){if(4===t.readyState)if(0===t.status)e(new Error("Manifest request to "+n+" timed out."));else if(404===t.status)e();else if(200!==t.status&&304!==t.status)e(new Error("Manifest request to "+n+" failed."));else{try{var a=JSON.parse(t.responseText)}catch(r){return void e(r)}e(null,a)}}}function a(e){function t(e,t){"ready"===k&&o("prepare"),O++,f.e(e,function(){function n(){O--,"prepare"===k&&(S[e]||s(e),0===O&&0===T&&u())}try{t.call(null,a)}finally{n()}})}var n=_[e];if(!n)return f;var a=function(t){return n.hot.active?_[t]?(_[t].parents.indexOf(e)<0&&_[t].parents.push(e),n.children.indexOf(t)<0&&n.children.push(t)):x=[e]:(console.warn("[HMR] unexpected require("+t+") from disposed module "+e),x=[]),f(t)};for(var r in f)Object.prototype.hasOwnProperty.call(f,r)&&(h?Object.defineProperty(a,r,function(e){return{configurable:!0,enumerable:!0,get:function(){return f[e]},set:function(t){f[e]=t}}}(r)):a[r]=f[r]);return h?Object.defineProperty(a,"e",{enumerable:!0,value:t}):a.e=t,a}function r(e){var t={_acceptedDependencies:{},_declinedDependencies:{},_selfAccepted:!1,_selfDeclined:!1,_disposeHandlers:[],active:!0,accept:function(e,n){if("undefined"==typeof e)t._selfAccepted=!0;else if("function"==typeof e)t._selfAccepted=e;else if("object"==typeof e)for(var a=0;a<e.length;a++)t._acceptedDependencies[e[a]]=n;else t._acceptedDependencies[e]=n},decline:function(e){if("undefined"==typeof e)t._selfDeclined=!0;else if("number"==typeof e)t._declinedDependencies[e]=!0;else for(var n=0;n<e.length;n++)t._declinedDependencies[e[n]]=!0},dispose:function(e){t._disposeHandlers.push(e)},addDisposeHandler:function(e){t._disposeHandlers.push(e)},removeDisposeHandler:function(e){var n=t._disposeHandlers.indexOf(e);n>=0&&t._disposeHandlers.splice(n,1)},check:l,apply:d,status:function(e){return e?void C.push(e):k},addStatusHandler:function(e){C.push(e)},removeStatusHandler:function(e){var t=C.indexOf(e);t>=0&&C.splice(t,1)},data:D[e]};return t}function o(e){k=e;for(var t=0;t<C.length;t++)C[t].call(null,e)}function i(e){var t=+e+""===e;return t?+e:e}function l(e,t){if("idle"!==k)throw new Error("check() is only allowed in idle status");"function"==typeof e?(b=!1,t=e):(b=e,t=t||function(e){if(e)throw e}),o("check"),n(function(e,n){if(e)return t(e);if(!n)return o("idle"),void t(null,null);E={},$={},S={};for(var a=0;a<n.c.length;a++)$[n.c[a]]=!0;y=n.h,o("prepare"),v=t,g={};var r=1;s(r),"prepare"===k&&0===O&&0===T&&u()})}function c(e,t){if($[e]&&E[e]){E[e]=!1;for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(g[n]=t[n]);0===--T&&0===O&&u()}}function s(e){$[e]?(E[e]=!0,T++,t(e)):S[e]=!0}function u(){o("ready");var e=v;if(v=null,e)if(b)d(b,e);else{var t=[];for(var n in g)Object.prototype.hasOwnProperty.call(g,n)&&t.push(i(n));e(null,t)}}function d(t,n){function a(e){for(var t=[e],n={},a=t.slice();a.length>0;){var o=a.pop(),e=_[o];if(e&&!e.hot._selfAccepted){if(e.hot._selfDeclined)return new Error("Aborted because of self decline: "+o);if(0===o)return;for(var i=0;i<e.parents.length;i++){var l=e.parents[i],c=_[l];if(c.hot._declinedDependencies[o])return new Error("Aborted because of declined dependency: "+o+" in "+l);t.indexOf(l)>=0||(c.hot._acceptedDependencies[o]?(n[l]||(n[l]=[]),r(n[l],[o])):(delete n[l],t.push(l),a.push(l)))}}}return[t,n]}function r(e,t){for(var n=0;n<t.length;n++){var a=t[n];e.indexOf(a)<0&&e.push(a)}}if("ready"!==k)throw new Error("apply() is only allowed in ready status");"function"==typeof t?(n=t,t={}):t&&"object"==typeof t?n=n||function(e){if(e)throw e}:(t={},n=n||function(e){if(e)throw e});var l={},c=[],s={};for(var u in g)if(Object.prototype.hasOwnProperty.call(g,u)){var d=i(u),p=a(d);if(!p){if(t.ignoreUnaccepted)continue;return o("abort"),n(new Error("Aborted because "+d+" is not accepted"))}if(p instanceof Error)return o("abort"),n(p);s[d]=g[d],r(c,p[0]);for(var d in p[1])Object.prototype.hasOwnProperty.call(p[1],d)&&(l[d]||(l[d]=[]),r(l[d],p[1][d]))}for(var h=[],m=0;m<c.length;m++){var d=c[m];_[d]&&_[d].hot._selfAccepted&&h.push({module:d,errorHandler:_[d].hot._selfAccepted})}o("dispose");for(var v=c.slice();v.length>0;){var d=v.pop(),b=_[d];if(b){for(var C={},T=b.hot._disposeHandlers,O=0;O<T.length;O++){var S=T[O];S(C)}D[d]=C,b.hot.active=!1,delete _[d];for(var O=0;O<b.children.length;O++){var E=_[b.children[O]];if(E){var $=E.parents.indexOf(d);$>=0&&E.parents.splice($,1)}}}}for(var d in l)if(Object.prototype.hasOwnProperty.call(l,d))for(var b=_[d],j=l[d],O=0;O<j.length;O++){var A=j[O],$=b.children.indexOf(A);$>=0&&b.children.splice($,1)}o("apply"),w=y;for(var d in s)Object.prototype.hasOwnProperty.call(s,d)&&(e[d]=s[d]);var U=null;for(var d in l)if(Object.prototype.hasOwnProperty.call(l,d)){for(var b=_[d],j=l[d],I=[],m=0;m<j.length;m++){var A=j[m],S=b.hot._acceptedDependencies[A];I.indexOf(S)>=0||I.push(S)}for(var m=0;m<I.length;m++){var S=I[m];try{S(l)}catch(F){U||(U=F)}}}for(var m=0;m<h.length;m++){var H=h[m],d=H.module;x=[d];try{f(d)}catch(F){if("function"==typeof H.errorHandler)try{H.errorHandler(F)}catch(F){U||(U=F)}else U||(U=F)}}return U?(o("fail"),n(U)):(o("idle"),void n(null,c))}function f(t){if(_[t])return _[t].exports;var n=_[t]={exports:{},id:t,loaded:!1,hot:r(t),parents:x,children:[]};return e[t].call(n.exports,n,n.exports,a(t)),n.loaded=!0,n.exports}var p=this.webpackHotUpdate;this.webpackHotUpdate=function(e,t){c(e,t),p&&p(e,t)};var h=!1;try{Object.defineProperty({},"x",{get:function(){}}),h=!0}catch(m){}var v,g,y,b=!0,w="a5196173fbec5c6b0729",D={},x=[],C=[],k="idle",T=0,O=0,S={},E={},$={},_={};return f.m=e,f.c=_,f.p="/backend/static/payment-admin/",f.h=function(){return w},a(0)(0)}([function(e,t,n){n(11);var a=n(9),r=document.getElementById("search-table"),o=n(13);o({tableId:"table",orderColumn:7,searchForm:r,iStartDateCol:7,iEndDateCol:7,exportColumns:[1,2,3,4,5,6,7,8]});var i=n(8),l='<form>    <div style="float:left">       <label>First Name</label><input type="text" required name="firstName"><br>       <label>Phone</label><input type="tel" required name="phone" pattern="\\d{10,10}"><br>       <label>Brokerage</label><input type="text" name="brokerage"><br>       <label>City</label><input type="text" name="city"><br>       <label>State/Province</label><input type="text" name="state"><br>    </div>    <div style="float:right">       <label>Last Name</label><input type="text" required name="lastName"><br>       <label>Email</label><input type="email" required name="email"><br>       <label>Address</label><input type="text" name="address"><br>       <label>Zipcode</label><input type="text" name="zipcode" pattern="\\d{5,5}"><br>       <label>Country</label><input type="text" name="country" value="United States"><br>    </div>    <input type="submit" value="Create Agent" class="btn btn-success"></form>';$("#show-add-agent").on("click",function(){i.showDialog({title:"Add Agent",contentTpl:l,className:"agent-info-dlg"}),a.newFormCheck($(".agent-info-dlg form")[0],function(){var e=$(this.form).serializeForm(),t=this;a.ajax("/payment/agent/create",e,function(){a.toast("Created Successfully!"),i.closeDialog(t),a.reloadWindow(3e3)},"POST",$(this.form).find("input[type=submit]"))})});var c=$("#table");c.on("click",".delete-agent",function(){var e=$(this).closest("tr").data("id");i.showConfirm({title:"Confirm",text:"Are you sure to delete this agent?",okCallback:function(){a.ajax("/payment/agent/delete",{userId:e},function(){a.toast("Deleted Successfully!"),a.reloadWindow()})}})})},,,,,,,,function(e,t){var n=$(".pop"),a=$(".pop-mask"),r={tpl:'<section class="dialog {{className}}">    <header>        <h2>{{title}}</h2>    </header>    <hr>    <main>        {{&contentTpl}}    </main>    <span class="glyphicon glyphicon-remove"></span></section>',showDialog:function(e){a.show(),n.show(),n.append(Mustache.render(r.tpl,e))},closeDialog:function(e){$(e).closest(".dialog").find(".glyphicon-remove").trigger("click")},showConfirm:function(e){r.showDialog({title:e.title,contentTpl:"<p>"+e.text+'</p><form><input type="submit" value="OK" class="btn btn-success ok"><button class="btn btn-secondary cancel" type="button">Cancel</button></form>',className:"confirm-dlg"});var t=$(".confirm-dlg");t.find(".cancel").on("click",function(){t.find(".glyphicon-remove").click()}),t.find(".ok").on("click",function(n){n.preventDefault(),e.okCallback.call(this),t.find(".glyphicon-remove").click()})},bindEvent:function(){n.on("click",".glyphicon-remove",function(){$(this).closest(".dialog").remove(),n.hide(),a.hide()})}};r.bindEvent(),e.exports=r},function(e,t){var n=$("#loadingbar");$.fx.step.textShadowBlur=function(e){$(e.elem).prop("textShadowBlur",e.now).css({textShadow:"0 0 "+Math.floor(e.now)+"px black"})};var a={},r={ajax:function(e,t,o,i,l){i=i||"GET";return l&&l.prop("disabled",!0),$.ajax({url:"/backend"+e,method:i,data:t,success:function(e){return 0!==e.status.code?(r.toast(e.status.msg),void("function"==typeof failCallback&&failCallback())):void("function"==typeof o&&o.call(window,e.data))},beforeSend:function(){"undefined"==typeof a[e]&&(n.css("width","0"),n.addClass("waiting").show(),n.width(50+30*Math.random()+"%"))}}).always(function(){l&&l.prop("disabled",!1),"undefined"==typeof a[e]&&n.width("101%").delay(200).fadeOut(400,function(){$(this).hide().removeClass("waiting")})})},toast:function(e,t){$(".toast").remove(),$("body").append("<div class='toast'>"+e+"</div>"),clearTimeout(n);var n=setTimeout(function(){$(".toast").remove()},t||3e3)},getPageName:function(){var e=window.location.pathname.split("/"),t=e.length>1?e[e.length-1]:"home";return t=t.replace(/\.html/,""),r.getPageName=function(){return t},t},loadScript:function(e,t){var n=document.createElement("script");n.type="text/javascript",n.readyState?n.onreadystatechange=function(){"loaded"!=n.readyState&&"complete"!=n.readyState||(n.onreadystatechange=null,"function"==typeof t&&t())}:n.onload=function(){"function"==typeof t&&t()},n.src=e,document.getElementsByTagName("head")[0].appendChild(n)},checkAccountExist:function(e,t){r.ajax("/register/hasUser",{account:this.value},function(n){n.isUser===!0?e():t()})},newFormCheck:function(e,t){return new Form(e,{errorMsgClass:"error",errorInputClass:"invalid",lang:"en"},t)},setCookie:function(e,t,n){var a="";if("undefined"!=typeof n){var r=new Date;r.setTime(r.getTime()+24*n*60*60*1e3),a="expires="+r.toUTCString()}document.cookie=e+"="+t+"; "+a+"; path=/"},getCookie:function(e){for(var t=e+"=",n=document.cookie.split(";"),a=0;a<n.length;a++){for(var r=n[a];" "==r.charAt(0);)r=r.substring(1);if(0==r.indexOf(t))return r.substring(t.length,r.length)}return""},getUrlFieldData:function(e,t){var n=new RegExp(t+"=([^&#]+)"),a=n.exec(e);return a?decodeURIComponent(a[1]):null},loadMustache:function(e){Mustache?e():r.loadScript("/static/js/mustache.min.js",e)},splitName:function(e){var t=e.trim().match(/(.+?)\s+(.+)/);return t?{firstName:t[1],lastName:t[2]}:{firstName:e,lastName:""}},setFormValue:function(e,t){for(var n in t){e[t[n]].value=Data.user[t[n]];e[t[n]];Data.user[t[n]].length&&e[t[n]].setAttribute("readonly","")}},reloadWindow:function(e){"undefined"==typeof e&&(e=2e3),setTimeout(function(){window.location.reload(!0)},e)},setLocalData:function(e,t){Data.hasLocalStorage?window.localStorage[e]=t:r.setCookie(e,t,1e3)},getLocalData:function(e){return Data.hasLocalStorage?window.localStorage[e]:r.getCookie(e)},removeLocalData:function(e){Data.hasLocalStorage?window.localStorage.removeItem(e):r.setCookie(e,"",0)},replaceUrlValue:function(){var e=window.location.href;if("object"==typeof arguments[0]){var t=arguments[0];for(var n in t)e=r.doReplaceUrlValue(n,t[n],e);return e}if("string"==typeof arguments[0])return r.doReplaceUrlValue(arguments[0],arguments[1],e)},doReplaceUrlValue:function(e,t,n){if(!window.location.search)return n+"?"+encodeURIComponent(e)+"="+encodeURIComponent(t);var a=new RegExp(e+"=([^&#]+)"),r=a.exec(n);return r?(a=new RegExp(r[0]),n.replace(a,e+"="+encodeURIComponent(t))):n+"&"+encodeURIComponent(e)+"="+encodeURIComponent(t)},uppercaseFirstLetter:function(e){return e[0].toUpperCase()+e.slice(1)},throttling:function(e,t,n,a){if("undefined"==typeof e.tId)return e.tId=0,void e.call(n,t);var r=e.tId;r||(e.tId=setTimeout(function(){e.call(n,t),e.tId=0},a||100))},getDateTime:function(e){if(!e)return 0;var t=e.split("-");return new Date((+t[0]),(+t[1]),(+t[2])).getTime()}};e.exports=r},,function(e,t){},,function(e,t,n){e.exports=function(e){var t=n(9),a=e.tableId,r=e.orderColumn,o=e.searchForm,i=e.iStartDateCol,l=e.iEndDateCol,c=e.exportColumns;i>=0&&$.fn.dataTableExt.afnFiltering.push(function(e,n,a){if(!o.dateFrom.value&&!o.dateTo.value)return!0;var r=t.getDateTime(o.dateFrom.value),c=t.getDateTime(o.dateTo.value),s=t.getDateTime(n[i].trim()),u=t.getDateTime(n[l]);return r||(r=t.getDateTime("1970-01-01")),c||(c=t.getDateTime("2038-01-01")),!(r>u||c<s)});var s={paging:!1,oLanguage:{sSearch:"Keyword"},dom:"Bfrtip",buttons:[{extend:"excel",exportOptions:{columns:c,format:{body:function(e,t,n,a){if(1===t){var r=e.match(/"(\d+)"/);return r?r[1].toString(10):e}return e.replace(/<script>[^<]+<\/script>/g,"").replace(/<button[^>]+>[^<]+<\/button>/g,"").replace(/<a[^>]+>/g,"").replace(/<\/a>/,"").trim()}}}}],columnDefs:[{targets:[r],orderData:[r,0]}]};r<0?s.aaSorting=[]:s.order=[r,"desc"];var u=$("#"+a).DataTable(s);$(o.dateFrom).on("input change",function(){u.draw()}),$(o.dateTo).on("input change",function(){u.draw()});var d={getDateStr:function(e){return e.getFullYear()+"-"+PAGE_UTIL.paddingZero(e.getMonth()+1,2)+"-"+PAGE_UTIL.paddingZero(e.getDate(),2)},setDate:function(e,t){var n=e.getTime()+24*t*3600*1e3,a=new Date(n),r=null,i=null;t>0?(r=e,i=a):(i=e,r=a),o.dateFrom.value=d.getDateStr(r),o.dateTo.value=d.getDateStr(i),$(o.dateFrom).change(),$(o.dateTo).change()},setAllDate:function(){o.dateFrom.value="",o.dateTo.value="",$(o.dateFrom).change(),$(o.dateTo).change()}};$(o.dateRange).on("change",function(){var e=new Date,t=parseInt(this.value);switch(t){case 0:d.setAllDate();break;case 1:case 3:case 7:case 30:d.setDate(e,-t+1);break;case-7:d.setDate(e,-e.getDay()+1);break;case-30:var t=0;d.setDate(e,-e.getDate()+1)}})}}]);