// ==UserScript==
// @name         Netschool cookie clear
// @namespace    http://tampermonkey.net/
// @version      0.1
// @author       1ksta
// @match        http://netschool.school.ioffe.ru/
// @icon         https://www.google.com/s2/favicons?sz=64&domain=netschool.school.ioffe.ru
// @grant        none
// ==/UserScript==

function deleteAllCookies() {
    var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
}

(function() {
    'use strict';
    if (document.URL == 'http://netschool.school.ioffe.ru/') deleteAllCookies();
})();
