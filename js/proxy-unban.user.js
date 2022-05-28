// ==UserScript==
// @name         Youtube Proxy ban bypassing
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       GitProger
// @match        https://www.google.com/sorry/index*
// @icon         https://www.google.com/s2/favicons?domain=youtube.com
// @grant        none
// ==/UserScript==

// when you are using public proxy in your browser not logged in your account, google ban the ability to watch the video.
// watching a video is avaible via /embed yt

(function() {
    'use strict';
    var yt_html = `<iframe type="text/html" width="1280" height="720" frameborder="0" allowfullscreen="1" src="https://www.youtube.com/embed/$VIDID?autoplay=1"></iframe>`;

    var g = document.body.innerHTML.match(/youtube\.com\/watch\?v=([-\w]+)/);
    var id = "";
    if (g !== null) {
        id = g[1];
    } else {
        g = document.body.innerHTML.match(/youtu\.be\/([-\w]+)/);
        if (g !== null) id = g[1];
    }

    if (id !== "") {
        document.body.innerHTML += yt_html.replace("$VIDID", id);
    }
})();
