// 要引入jQ！！
console.log('cookie = ' + $.cookie('_uuid'));

function clickAccount() {
    if ($.cookie('_uuid') != undefined) {
        window.open('personalAccount.jsp');

    } else {
        window.open('login.jsp');
    }
}

//写cookies

function setCookie(name, value) {
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}

//读取cookies
function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

    if (arr = document.cookie.match(reg))

        return unescape(arr[2]);
    else
        return null;
}

//删除cookies
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null)
        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

function logOut() {
    delCookie('_uuid');
    location.replace(document.referrer);
    window.open('login.jsp');
}