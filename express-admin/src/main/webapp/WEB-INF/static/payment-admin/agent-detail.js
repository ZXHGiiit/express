!function(e){function t(e){var t=document.getElementsByTagName("head")[0],n=document.createElement("script");n.type="text/javascript",n.charset="utf-8",n.src=p.p+""+e+"."+w+".hot-update.js",t.appendChild(n)}function n(e){if("undefined"==typeof XMLHttpRequest)return e(new Error("No browser support"));try{var t=new XMLHttpRequest,n=p.p+""+w+".hot-update.json";t.open("GET",n,!0),t.timeout=1e4,t.send(null)}catch(r){return e(r)}t.onreadystatechange=function(){if(4===t.readyState)if(0===t.status)e(new Error("Manifest request to "+n+" timed out."));else if(404===t.status)e();else if(200!==t.status&&304!==t.status)e(new Error("Manifest request to "+n+" failed."));else{try{var r=JSON.parse(t.responseText)}catch(a){return void e(a)}e(null,r)}}}function r(e){function t(e,t){"ready"===D&&o("prepare"),A++,p.e(e,function(){function n(){A--,"prepare"===D&&(C[e]||d(e),0===A&&0===O&&s())}try{t.call(null,r)}finally{n()}})}var n=E[e];if(!n)return p;var r=function(t){return n.hot.active?E[t]?(E[t].parents.indexOf(e)<0&&E[t].parents.push(e),n.children.indexOf(t)<0&&n.children.push(t)):k=[e]:(console.warn("[HMR] unexpected require("+t+") from disposed module "+e),k=[]),p(t)};for(var a in p)Object.prototype.hasOwnProperty.call(p,a)&&(h?Object.defineProperty(r,a,function(e){return{configurable:!0,enumerable:!0,get:function(){return p[e]},set:function(t){p[e]=t}}}(a)):r[a]=p[a]);return h?Object.defineProperty(r,"e",{enumerable:!0,value:t}):r.e=t,r}function a(e){var t={_acceptedDependencies:{},_declinedDependencies:{},_selfAccepted:!1,_selfDeclined:!1,_disposeHandlers:[],active:!0,accept:function(e,n){if("undefined"==typeof e)t._selfAccepted=!0;else if("function"==typeof e)t._selfAccepted=e;else if("object"==typeof e)for(var r=0;r<e.length;r++)t._acceptedDependencies[e[r]]=n;else t._acceptedDependencies[e]=n},decline:function(e){if("undefined"==typeof e)t._selfDeclined=!0;else if("number"==typeof e)t._declinedDependencies[e]=!0;else for(var n=0;n<e.length;n++)t._declinedDependencies[e[n]]=!0},dispose:function(e){t._disposeHandlers.push(e)},addDisposeHandler:function(e){t._disposeHandlers.push(e)},removeDisposeHandler:function(e){var n=t._disposeHandlers.indexOf(e);n>=0&&t._disposeHandlers.splice(n,1)},check:c,apply:u,status:function(e){return e?void T.push(e):D},addStatusHandler:function(e){T.push(e)},removeStatusHandler:function(e){var t=T.indexOf(e);t>=0&&T.splice(t,1)},data:x[e]};return t}function o(e){D=e;for(var t=0;t<T.length;t++)T[t].call(null,e)}function i(e){var t=+e+""===e;return t?+e:e}function c(e,t){if("idle"!==D)throw new Error("check() is only allowed in idle status");"function"==typeof e?(g=!1,t=e):(g=e,t=t||function(e){if(e)throw e}),o("check"),n(function(e,n){if(e)return t(e);if(!n)return o("idle"),void t(null,null);S={},$={},C={};for(var r=0;r<n.c.length;r++)$[n.c[r]]=!0;b=n.h,o("prepare"),v=t,y={};var a=0;d(a),"prepare"===D&&0===A&&0===O&&s()})}function l(e,t){if($[e]&&S[e]){S[e]=!1;for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(y[n]=t[n]);0===--O&&0===A&&s()}}function d(e){$[e]?(S[e]=!0,O++,t(e)):C[e]=!0}function s(){o("ready");var e=v;if(v=null,e)if(g)u(g,e);else{var t=[];for(var n in y)Object.prototype.hasOwnProperty.call(y,n)&&t.push(i(n));e(null,t)}}function u(t,n){function r(e){for(var t=[e],n={},r=t.slice();r.length>0;){var o=r.pop(),e=E[o];if(e&&!e.hot._selfAccepted){if(e.hot._selfDeclined)return new Error("Aborted because of self decline: "+o);if(0===o)return;for(var i=0;i<e.parents.length;i++){var c=e.parents[i],l=E[c];if(l.hot._declinedDependencies[o])return new Error("Aborted because of declined dependency: "+o+" in "+c);t.indexOf(c)>=0||(l.hot._acceptedDependencies[o]?(n[c]||(n[c]=[]),a(n[c],[o])):(delete n[c],t.push(c),r.push(c)))}}}return[t,n]}function a(e,t){for(var n=0;n<t.length;n++){var r=t[n];e.indexOf(r)<0&&e.push(r)}}if("ready"!==D)throw new Error("apply() is only allowed in ready status");"function"==typeof t?(n=t,t={}):t&&"object"==typeof t?n=n||function(e){if(e)throw e}:(t={},n=n||function(e){if(e)throw e});var c={},l=[],d={};for(var s in y)if(Object.prototype.hasOwnProperty.call(y,s)){var u=i(s),f=r(u);if(!f){if(t.ignoreUnaccepted)continue;return o("abort"),n(new Error("Aborted because "+u+" is not accepted"))}if(f instanceof Error)return o("abort"),n(f);d[u]=y[u],a(l,f[0]);for(var u in f[1])Object.prototype.hasOwnProperty.call(f[1],u)&&(c[u]||(c[u]=[]),a(c[u],f[1][u]))}for(var h=[],m=0;m<l.length;m++){var u=l[m];E[u]&&E[u].hot._selfAccepted&&h.push({module:u,errorHandler:E[u].hot._selfAccepted})}o("dispose");for(var v=l.slice();v.length>0;){var u=v.pop(),g=E[u];if(g){for(var T={},O=g.hot._disposeHandlers,A=0;A<O.length;A++){var C=O[A];C(T)}x[u]=T,g.hot.active=!1,delete E[u];for(var A=0;A<g.children.length;A++){var S=E[g.children[A]];if(S){var $=S.parents.indexOf(u);$>=0&&S.parents.splice($,1)}}}}for(var u in c)if(Object.prototype.hasOwnProperty.call(c,u))for(var g=E[u],N=c[u],A=0;A<N.length;A++){var P=N[A],$=g.children.indexOf(P);$>=0&&g.children.splice($,1)}o("apply"),w=b;for(var u in d)Object.prototype.hasOwnProperty.call(d,u)&&(e[u]=d[u]);var _=null;for(var u in c)if(Object.prototype.hasOwnProperty.call(c,u)){for(var g=E[u],N=c[u],j=[],m=0;m<N.length;m++){var P=N[m],C=g.hot._acceptedDependencies[P];j.indexOf(C)>=0||j.push(C)}for(var m=0;m<j.length;m++){var C=j[m];try{C(c)}catch(I){_||(_=I)}}}for(var m=0;m<h.length;m++){var U=h[m],u=U.module;k=[u];try{p(u)}catch(I){if("function"==typeof U.errorHandler)try{U.errorHandler(I)}catch(I){_||(_=I)}else _||(_=I)}}return _?(o("fail"),n(_)):(o("idle"),void n(null,l))}function p(t){if(E[t])return E[t].exports;var n=E[t]={exports:{},id:t,loaded:!1,hot:a(t),parents:k,children:[]};return e[t].call(n.exports,n,n.exports,r(t)),n.loaded=!0,n.exports}var f=this.webpackHotUpdate;this.webpackHotUpdate=function(e,t){l(e,t),f&&f(e,t)};var h=!1;try{Object.defineProperty({},"x",{get:function(){}}),h=!0}catch(m){}var v,y,b,g=!0,w="a5196173fbec5c6b0729",x={},k=[],T=[],D="idle",O=0,A=0,C={},S={},$={},E={};return p.m=e,p.c=E,p.p="/backend/static/payment-admin/",p.h=function(){return w},r(0)(0)}([function(e,t,n){n(1);var r=n(8),a=n(9),o=n(10),i=$("#agent-data").serializeForm();o.init(i);var c='<form>    <div>        <label>First Name</label><input type="text" required name="firstName" value="{{agent.firstName}}" autofocus><br>        <label>Phone</label><input type="tel" required name="phone" value="{{agent.phone}}"><br>        <label>Brokerage</label><input type="text" name="brokerage" value="{{agent.brokerage}}"><br>        <label>city</label><input type="text" name="city" value="{{agent.city}}"><br>        <label>state/Province</label><input type="text" name="state" value={{agent.state}}><br>    </div>    <div>        <label>Last Name</label><input type="text" required name="lastName" value="{{agent.lastName}}"><br>        <label>Email</label><input type="email" required name="email" value={{agent.email}}><br>        <label>Address</label><input type="text" name="address" value={{agent.address}}><br>        <label>zipcode</label><input type="text" name="zipcode" pattern="\\d{5,5}" value={{agent.zipcode}}><br>        <label>country</label><input type="text" name="country" value={{agent.country}}><br>    </div>    <input type="hidden" value="{{agent.userId}}" name="userId">    <input type="submit" value="Save" class="btn btn-success"></form>';$(".basic-info .glyphicon-edit").on("click",function(){r.showDialog({title:"Edit Basic Info",contentTpl:Mustache.render(c,{agent:i}),className:"agent-info-dlg"}),a.newFormCheck($(".agent-info-dlg form")[0],function(){var e=$(this.form).serializeForm(),t=this;a.ajax("/payment/agent/update",e,function(){a.toast("Saved Successfully!"),r.closeDialog(t),a.reloadWindow(3e3)},"POST",$(this.form).find("input[type=submit]"))})});var l='<div>    <p><span>Order No. {{id}}</span> <span>Order Time: {{startTime}} ~ {{endTime}}</span></p>    <table class="table table-striped">        <thead>        <tr>            <th>Item</th>            <th>Unit</th>            <th>Price</th>            <th>Discount</th>            <th>Item(s) Subtotal</th>        </tr>        </thead>        {{#orders}}        <tr>            <td>{{name}}</td> <td>USD</td>            <td>${{getRealPrice}}</td> <td>${{discount}}</td> <td>${{getSubTotal}}</td>        </tr>        {{/orders}}        <tfooter>            <tr>                <td></td><td></td><td></td>                <td><b>Total</b></td> <td><b>${{getTotal}}</b></td>            </tr>        </tfooter>    </table>    <p>Contract Time: {{duration}} months. We\'ll charge by month</p>    <input type="submit" value="Confirmed and Send Email" class="btn btn-success" id="send-email"></div>';if(PAGE_DATA.orders){var d={orders:PAGE_DATA.orders,id:$("#order-id").text(),startTime:$("#order-start-time").html().replace(/<script>[^<]+<\/script>/,""),endTime:$("#order-end-time").html().replace(/<script>[^<]+<\/script>/,""),duration:$("#order-duration").html()};d&&(d.getTotal=function(){for(var e=0,t=PAGE_DATA.orders,n=0;n<t.length;n++)e+=t[n].price;return e},d.getSubTotal=function(){return this.price},d.getRealPrice=function(){return this.price+this.discount})}$(".open-send-email").on("click",function(){return PAGE_DATA.orders?(r.showDialog({title:"Review Order Detail",contentTpl:Mustache.render(l,d),className:"send-email-dlg"}),void $("#send-email").on("click",function(){var e=this;a.ajax("/payment/order/sendEmail",{orderId:PAGE_DATA.orderId},function(){a.toast("Mail Sent Successfully!"),r.closeDialog(e)},"POST",$(this))})):void a.toast("No order yet!")});var s='{{#.}}<form>    <div>        <label>Card Type</label><!--        --><select name="cardType">            <option value="1">Visa</option>            <option value="2">Master</option>            <option value="3">American Express</option>            <option value="4">Discover</option>            <option value="5">JCB</option>        </select>    </div>    <div><label>Name on Account</label><input name="cardHolderName" type="text" value="{{cardHolderName}}" required></div>    <div><label>Credit Card Number</label><input name="cardNumber" type="number" min="0" value="{{cardNumber}}" pattern="\\d{1,20}" required></div>    <div><label>Expiration Day</label><input name="expiryDate" type="text" value="{{expiryDate}}" pattern="\\d{2,2}\\/\\d{2,2}" pm="expiration day format mm/yy" required placeholder="mm/YY"></div>    <div><label>Security Code</label><input name="cardVerificationNumber" type="text" value="{{cardVerificationNumber}}" pattern="\\d{3,3}" required pm="Security code should be 3 digits"></div>    <input type="hidden" value="{{id}}" name="userId">    <input type="submit" value="Save" class="btn btn-success"></form><hr>{{/.}}';$(".payment-info .glyphicon-plus").on("click",function(){r.showDialog({title:"Add Card",contentTpl:Mustache.render(s,[{}]),className:"cards-dlg"}),a.newFormCheck($(".cards-dlg form")[0],function(){var e=$(this.form).serializeForm(),t=this.form;if(t.cardNumber.value.length>20)return void t.Form.addErrorMsg(t.cardNumber,"Card Number should be less than or equal to 20 digits");e.userId=i.userId,e.expiryDate=e.expiryDate.replace("/","");var n=this;a.ajax("/payment/cardinfo/add",e,function(){a.toast("Card Added Successfully!"),r.closeDialog(n),a.reloadWindow()},"POST",$(t).find("input[type=submit]"))})}),$(".pause-order").on("click",function(){r.showConfirm({title:"Confirm",text:"Are you sure to cancel this agent?",okCallback:function(){a.ajax("/payment/order/stopOrder",{orderId:PAGE_DATA.orderId},function(){a.toast("Stop Successfully!"),$(".pause-order").prop("disabled",!0),a.reloadWindow(),$(".pause-order").css("color","#ccc")})}})})},function(e,t){},,,,,,,function(e,t){var n=$(".pop"),r=$(".pop-mask"),a={tpl:'<section class="dialog {{className}}">    <header>        <h2>{{title}}</h2>    </header>    <hr>    <main>        {{&contentTpl}}    </main>    <span class="glyphicon glyphicon-remove"></span></section>',showDialog:function(e){r.show(),n.show(),n.append(Mustache.render(a.tpl,e))},closeDialog:function(e){$(e).closest(".dialog").find(".glyphicon-remove").trigger("click")},showConfirm:function(e){a.showDialog({title:e.title,contentTpl:"<p>"+e.text+'</p><form><input type="submit" value="OK" class="btn btn-success ok"><button class="btn btn-secondary cancel" type="button">Cancel</button></form>',className:"confirm-dlg"});var t=$(".confirm-dlg");t.find(".cancel").on("click",function(){t.find(".glyphicon-remove").click()}),t.find(".ok").on("click",function(n){n.preventDefault(),e.okCallback.call(this),t.find(".glyphicon-remove").click()})},bindEvent:function(){n.on("click",".glyphicon-remove",function(){$(this).closest(".dialog").remove(),n.hide(),r.hide()})}};a.bindEvent(),e.exports=a},function(e,t){var n=$("#loadingbar");$.fx.step.textShadowBlur=function(e){$(e.elem).prop("textShadowBlur",e.now).css({textShadow:"0 0 "+Math.floor(e.now)+"px black"})};var r={},a={ajax:function(e,t,o,i,c){i=i||"GET";return c&&c.prop("disabled",!0),$.ajax({url:"/backend"+e,method:i,data:t,success:function(e){return 0!==e.status.code?(a.toast(e.status.msg),void("function"==typeof failCallback&&failCallback())):void("function"==typeof o&&o.call(window,e.data))},beforeSend:function(){"undefined"==typeof r[e]&&(n.css("width","0"),n.addClass("waiting").show(),n.width(50+30*Math.random()+"%"))}}).always(function(){c&&c.prop("disabled",!1),"undefined"==typeof r[e]&&n.width("101%").delay(200).fadeOut(400,function(){$(this).hide().removeClass("waiting")})})},toast:function(e,t){$(".toast").remove(),$("body").append("<div class='toast'>"+e+"</div>"),clearTimeout(n);var n=setTimeout(function(){$(".toast").remove()},t||3e3)},getPageName:function(){var e=window.location.pathname.split("/"),t=e.length>1?e[e.length-1]:"home";return t=t.replace(/\.html/,""),a.getPageName=function(){return t},t},loadScript:function(e,t){var n=document.createElement("script");n.type="text/javascript",n.readyState?n.onreadystatechange=function(){"loaded"!=n.readyState&&"complete"!=n.readyState||(n.onreadystatechange=null,"function"==typeof t&&t())}:n.onload=function(){"function"==typeof t&&t()},n.src=e,document.getElementsByTagName("head")[0].appendChild(n)},checkAccountExist:function(e,t){a.ajax("/register/hasUser",{account:this.value},function(n){n.isUser===!0?e():t()})},newFormCheck:function(e,t){return new Form(e,{errorMsgClass:"error",errorInputClass:"invalid",lang:"en"},t)},setCookie:function(e,t,n){var r="";if("undefined"!=typeof n){var a=new Date;a.setTime(a.getTime()+24*n*60*60*1e3),r="expires="+a.toUTCString()}document.cookie=e+"="+t+"; "+r+"; path=/"},getCookie:function(e){for(var t=e+"=",n=document.cookie.split(";"),r=0;r<n.length;r++){for(var a=n[r];" "==a.charAt(0);)a=a.substring(1);if(0==a.indexOf(t))return a.substring(t.length,a.length)}return""},getUrlFieldData:function(e,t){var n=new RegExp(t+"=([^&#]+)"),r=n.exec(e);return r?decodeURIComponent(r[1]):null},loadMustache:function(e){Mustache?e():a.loadScript("/static/js/mustache.min.js",e)},splitName:function(e){var t=e.trim().match(/(.+?)\s+(.+)/);return t?{firstName:t[1],lastName:t[2]}:{firstName:e,lastName:""}},setFormValue:function(e,t){for(var n in t){e[t[n]].value=Data.user[t[n]];e[t[n]];Data.user[t[n]].length&&e[t[n]].setAttribute("readonly","")}},reloadWindow:function(e){"undefined"==typeof e&&(e=2e3),setTimeout(function(){window.location.reload(!0)},e)},setLocalData:function(e,t){Data.hasLocalStorage?window.localStorage[e]=t:a.setCookie(e,t,1e3)},getLocalData:function(e){return Data.hasLocalStorage?window.localStorage[e]:a.getCookie(e)},removeLocalData:function(e){Data.hasLocalStorage?window.localStorage.removeItem(e):a.setCookie(e,"",0)},replaceUrlValue:function(){var e=window.location.href;if("object"==typeof arguments[0]){var t=arguments[0];for(var n in t)e=a.doReplaceUrlValue(n,t[n],e);return e}if("string"==typeof arguments[0])return a.doReplaceUrlValue(arguments[0],arguments[1],e)},doReplaceUrlValue:function(e,t,n){if(!window.location.search)return n+"?"+encodeURIComponent(e)+"="+encodeURIComponent(t);var r=new RegExp(e+"=([^&#]+)"),a=r.exec(n);return a?(r=new RegExp(a[0]),n.replace(r,e+"="+encodeURIComponent(t))):n+"&"+encodeURIComponent(e)+"="+encodeURIComponent(t)},uppercaseFirstLetter:function(e){return e[0].toUpperCase()+e.slice(1)},throttling:function(e,t,n,r){if("undefined"==typeof e.tId)return e.tId=0,void e.call(n,t);var a=e.tId;a||(e.tId=setTimeout(function(){e.call(n,t),e.tId=0},r||100))},getDateTime:function(e){if(!e)return 0;var t=e.split("-");return new Date((+t[0]),(+t[1]),(+t[2])).getTime()}};e.exports=a},function(e,t,n){var r=n(8),a=n(9),o='<form>    <div class="order-setting">       {{#.}}       <div>           <h3>{{name}}</h3>           {{#packageList}}           <div><input type="Checkbox" id="package-{{productType}}-{{id}}" name="productType-{{productType}}" data-id="{{id}}"><label for="package-{{productType}}-{{id}}">{{name}}: </label><span>$</span> <input type="number" min="0" name="price-{{productType}}-{{id}}" value="{{unitPrice}}" placeholder="{{unitPrice}}"></div>           {{/packageList}}       </div>       {{/.}}       <div class="time-setting" style="margin-left:-16px">           <h3>Contract</h3>           <div><label>Contract Time(Months)</label><input type="number" min="6" max="12" value="6" name="contractDuration" step="6" required></div>           <div><label>Frequence</label><select><option value="monthly">monthly</option></select></div>       </div>    </div>    <input type="submit" value="{{submitButtonText}}" id="subMit" class="btn btn-success"></form>',i=null,c={init:function(e){PAGE_DATA.orders&&2==PAGE_DATA.orderStatus?$("#pause-order").prop("disabled",!1):($("#pause-order").prop("disabled",!0),$(".pause-order").css("color","#ccc")),$(".show-order").on("click",c.showOrder),i=e},showOrder:function(){var e=$(this).data("type");"edit"!==e||PAGE_DATA.orders||(e="create"),a.ajax("/payment/adminservicepackage/package/listall",null,function(t){c.doShowOrder(e,t)},"GET",$(this))},setOrder:function(e,t){for(var n=0;n<e.length;n++)t["package-"+e[n].productType+"-"+e[n].id].click(),t["price-"+e[n].productType+"-"+e[n].id].value=e[n].price},doShowOrder:function(e,t){var n="",i="",l="",d="",s="/payment/adminservicepackage/order/";switch(e){case"edit":n=2===PAGE_DATA.orderStatus?s+"update":s+"create",i="Order Saved Successfully!",l="Save Edit",d="Update Order";break;case"create":n=s+"create",i="Order Created Successfully!",l="Confirm and Create",d="Create Order";break;default:throw"Unknown service plan show type: "+showOrderType}t.submitButtonText=l,r.showDialog({title:d,contentTpl:Mustache.render(o,t),className:"save-order-dlg"});var u=$(".save-order-dlg form");"edit"===e?(c.setOrder(PAGE_DATA.orders,u[0]),$("#pause-order").prop("disabled",!1)):u.find(".order-setting div:nth-of-type(1) div:nth-of-type(1) label").click(),u.on("click","input[type='Checkbox']",c.checkboxChange),a.newFormCheck(u[0],function(){c.checkOrderSelected($(this.form))&&c.submitOrder.call(this,t,i,e,n)})},checkboxChange:function(){$(this).is(":checked")&&$(this).parent().siblings().find("input[type='Checkbox']").prop("checked",!1)},checkOrderSelected:function(e){var t=e.find("input[type='Checkbox']:checked");return 0!=t.length||(a.toast("You must choose one package at least"),!1)},submitOrder:function(e,t,n,o){for(var c=[],l=$(this.form),d=0;d<e.length;d++){var s=e[d].productType,u="productType-"+s,p=l.find("[name="+u+"]:checked");if(p.length){var f=p.data("id");c.push({productType:s,id:f,unitPrice:this.form["price-"+s+"-"+f].value})}}var h={packageListJson:JSON.stringify(c),contractTime:this.form.contractDuration.value,userId:i.userId},m=this;"edit"===n&&(h.oldOrderId=PAGE_DATA.orderId),a.ajax(o,h,function(){a.toast(t),a.reloadWindow(),r.closeDialog(m)},"POST",l.find("input[type=submit]"))}};e.exports=c}]);