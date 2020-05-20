// ==UserScript==
// @name         No COVID-19
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Remove annoying "#stayhome" elements
// @author       You
// @match        https://vk.com/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    var stayhome_popup = document.getElementsByClassName("CovidLogo")[0];
    stayhome_popup.removeAttribute("onmouseover"); // remove pop-up #stayhome menu
    stayhome_popup.className = "top_home_link fl_l"; // set default logo
    var stayhome_hashtag = document.getElementsByClassName("CovidLogo__hashtag")[0];
    stayhome_hashtag.remove();
    var stayhome_info = document.getElementById("l_covid19");
    stayhome_info.remove();
    var stayhome_bot = document.getElementById("ui_rmenu_peer_-22822305");
    stayhome_bot.remove();
    document.getElementsByClassName("ui_rmenu_sep").forEach(function (cur, i, arr) {
        cur.remove(); // remove "#stayhome bot"`s separators
    });
})();
