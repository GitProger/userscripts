// ==UserScript==
// @name         Mark all spam mails
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://mail.google.com/mail/u/0/h/*
// @icon         https://www.google.com/s2/favicons?domain=google.com
// @grant        none
// ==/UserScript==

(function() {
    var button = document.createElement("button");
    button.type = "button";
    button.style = "margin-left: 10px";
    button.innerText = "Отметить все";
    button.onclick = function () {
        document.getElementsByName("t").forEach(function (e) { e.checked = !e.checked });
    }
    var dashboard = document.querySelector("tr > td > form > table > tbody > tr > td");
    dashboard.appendChild(button);
})();
