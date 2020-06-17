// ==UserScript==
// @name         padded-jacket-environment
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://vk.com/*
// @grant        none
// ==/UserScript==

function main() {
    var sounds = [
        "http://flag.kremlin.ru/static/pdf/anthem-choir.mp3?5d1208b9e1",
        "https://zvuki-tut.ru/samples/Ura.mp3",
        "https://all-mp3.net/files/ru_mp3/Pesnya_-_Vladimir_putin_molodets.mp3",
    ].map(function (e) {
        return new Audio(e);
    });


    var code = '<img src="https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg"'
             + ' style="z-index: 1000; position: fixed; right: 0px; top: 0px">';

    var e = document.getElementById("page_header");
    e.innerHTML += code;

    function loop() {
        var cur = sounds[Math.floor(Math.random() * sounds.length)];
        cur.onended = loop;
        cur.play();
    };
    loop();
}

(function() {
    'use strict';
    main();
})();
