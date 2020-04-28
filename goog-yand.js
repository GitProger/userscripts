// ==UserScript==
// @name         Putin
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Putin vor!
// @author       Use this code as you want
// @match        *
// @grant        none
// ==/UserScript==

function google(code) {
    var query = document.getElementsByClassName("gLFyf gsfi")[0].value;
    if (query.toLowerCase() == "путин") {
        var panel = document.getElementById("cnt");
        panel.innerHTML = code;
    }
}

function yandex(code) {
    var query = document.getElementsByClassName("input__control mini-suggest__input")[0].value;
    if (query.toLowerCase() == "путин") {
        var panel = document.getElementsByClassName("main__center")[0];
        panel.innerHTML = code;
    }
}

(function() {
    'use strict';
    var hnya = "Путин вор"; // Сюда пишите что вам угодно
    var code = "<style>.putin{font-size:500%;text-align:center;margin-top:120px;}</style>";
    code += "<div class=putin>" + hnya + "</div>";
    if (location.hostname == "google.com") {
        google(code);
    } else if (location.hostname == "yandex.ru") {
        yandex(code);
    }
})();
