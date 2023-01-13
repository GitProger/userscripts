// ==UserScript==
// @name         Gthtdjlbkrf hfcrkflrb/
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Translate symbols from ru/en kb layout to the other one
// @author       alex0surname@gmail.com
// @match        *://*/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// ==/UserScript==
/*
    Как пользоваться:
    1) Выделите нужный текст
    2) Нажмите Ctrl+; (точка с запятой)
    3) В месте, где сейчас находится курсор появится окошко с переводом
    4) Чтобы окошко пропало, нажмите Esc
*/
//Shift+  23467  |             Line 1            |            Line 2          |        Line3
var EN = '@#$^&' + "qQwWeErRtTyYuUiIoOpP[{]}\\|" + "aAsSdDfFgGhHjJkKlL;:\'\"" + "zZxXcCvVbBnNmM,<.>/?";
var RU = '"№;:?' + "йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪ\\/" + "фФыЫвВаАпПрРоОлЛдДжЖэЭ"   + "яЯчЧсСмМиИтТьЬбБюЮ.,";

function translate(dFrom, dTo, s) {
    if (dFrom.length != dTo.length) {
        return console.error("Keyboard layouts do not have the same length!");
    }
    return s.split("").map(c => {
        var indices = dFrom.split("").reduce((a, e, i) => {
            if (e === c) {
                a.push(i);
            }
            return a;
        }, []);
        var mapping = indices.map(i => dTo[i]);
        if (mapping.length > 1) {
            mapping = "[" + mapping + "]";
        } else if (mapping.length === 0) {
            return c;
        }
        return mapping;
    }).join("");
}

function enru(s) {
    for (var c of s) {
        if (RU.search(c) !== -1 && EN.search(c) === -1) return translate(RU, EN, s);
        if (EN.search(c) !== -1 && RU.search(c) === -1) return translate(EN, RU, s);
    }
    return translate(EN, RU, s);
}

(function() {
    'use strict';
//    'window' here breaks github? (CtrlA + CtrlV in the editor doesnt work for example)
//    document.addEventListener('load', e => {
        document.body.innerHTML += '<div id="script-translate-element-239566" style="position: fixed; background: #ddd; color: #000; padding: 1px 8px; border: 1px solid black; display: none;"></div>';
        var tr = document.getElementById("script-translate-element-239566");

        var clientX = 0, clientY = 0;
        document.addEventListener('mousemove', e => {
            clientX = e.pageX;
            clientY = e.pageY;
        }, false);

        document.addEventListener('keyup', e => {
            if (e.ctrlKey && e.key == ';') {
                var t = window.getSelection().toString();
                tr.style.left = clientX + "px";
                tr.style.top = clientY + "px";
                console.log(e);
                tr.style.display = "inline-block";
                tr.innerHTML = enru(t);
            } else if (e.key == "Escape") {
                tr.style.display = "none";
            }
        }, false);
//    }, false);
})();
