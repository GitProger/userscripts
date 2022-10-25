// ==UserScript==
// @name         Done tasks highlight
// @namespace    http://tampermonkey.net/
// @version      0.1
// @author       Alex Lelchuk alexsurname@gmail.com
// @match        http://neerc.ifmo.ru/wiki/index.php?title=%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B9_%D0%BF%D0%BE_%D0%94%D0%9C_2022_%D0%BE%D1%81%D0%B5%D0%BD%D1%8C
// @icon         https://www.google.com/s2/favicons?sz=64&domain=ifmo.ru
// @grant        none
// @description  Done tasks highlight
// ==/UserScript==

function putList(done) { localStorage.setItem("done", JSON.stringify(done)); }
function getList() { return JSON.parse(localStorage.getItem("done")); }
function add(id) {
	var a = getList();
	a.push(id);
	putList(a);
}
function remove(id) {
	var a = getList();
	if (a.indexOf(id) === -1) return;
	a.splice(a.indexOf(id), 1);
	putList(a);
}

var GREEN = '#B0E0B0';

function addClick(item, index) {
    item.addEventListener("click", function () {
        var lst = getList();
        if (lst.includes(index)) {
            item.style.background = ""; // color
			remove(index);
		} else {
            item.style.background = GREEN;
            add(index);
		}
    })
};

function main() {
	if (getList() == null) putList([]);

    var li = document.querySelectorAll("li");
    li.forEach(addClick);
    getList().forEach(function(i) {
	    li[i].style.background = GREEN;
    });
}

(function() {
    'use strict';
    main();
})();
