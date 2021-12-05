// ==UserScript==
// @name         Design mails by content type
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://mail.google.com/mail/u/0/h/*
// @icon         https://www.google.com/s2/favicons?domain=google.com
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    var trs = Array.from(document.querySelectorAll("form > table > tbody > tr")).slice(1, -1);
    // first and last are menu items
    trs.forEach(function (tr) {
        var td_name = tr.children[1].innerHTML;
        var mail = td_name.replace(/<\/?[^>]*>/gi, ""); // <b>ffrfrf</b>

        if (
            mail.search(/@hse\.ru/i) !== -1 ||
            mail.search(/@i[tf]mo\.ru/i) !== -1 ||
            mail.search(/ЛКШ/i) !== -1 ||
            mail.search(/ВШЭ|Вышка|ИТМО/i) !== -1 ||
            mail.search(/М?ФТИ|Физтех/i) !== -1 ||
            mail.search(/(олимп|техно)/i) !== -1 ||
            mail.search(/универ/i) !== -1 ||
            mail.search(/вуз/i) !== -1 ||
            mail.search(/edu/i) !== -1 ||
            mail.search(/(программ|физик)/i) !== -1 ||
            false
        ) {
            tr.bgColor = "#F7B8B8";
        } else if (
            mail.search(/\(Класс\)/i) !== -1
        ) {
            tr.bgColor = "#E8E8A8";
        } else if (
            mail.search(/codeforces\.com/i) !== -1
        ) {
            tr.bgColor = "B0E0B0";
        }

    });
})();
