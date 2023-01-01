// ==UserScript==
// @name         ITMO PCMS last contest taker
// @namespace    https://pcms.itmo.ru/
// @version      0.1
// @description  Pick last contest (default is first)
// @author       Alex Lelchuk alex0surname@gmail.com
// @match        https://pcms.itmo.ru/pcms2client/party/contests.xhtml
// @icon         https://www.google.com/s2/favicons?sz=64&domain=itmo.ru
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    if (document.cookie.match(/(?<=(\W|^))init=/) == null) {
        document.cookie = 'init=';
        var links = document.querySelectorAll("a");
        links[links.length - 1].click();
    }
})();
