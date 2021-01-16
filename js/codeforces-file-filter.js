// ==UserScript==
// @name         Filter files
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  filter files on submit on codeforces
// @author       alex0surname@gmail.com
// @match        https://codeforces.com/*
// @grant        none
// ==/UserScript==

var getExt = {
	"43" : ".c, .c11",
	//C++: ".C" for linux also
	"52" : ".cpp, .cxx, .c++, .cc, .cp", // Clang++17 Diagnostics
	"42" : ".cpp, .cxx, .c++, .cc, .cp", // GNU G++11 5.1.0
	"50" : ".cpp, .cxx, .c++, .cc, .cp", // GNU G++14 6.4.0
	"54" : ".cpp, .cxx, .c++, .cc, .cp", // GNU G++17 7.3.0
	"2"  : ".cpp, .cxx, .cc", // Microsoft Visual C++ 2010
	"59" : ".cpp, .cxx, .cc", // Microsoft Visual C++ 2017
	"61" : ".cpp, .cxx, .c++, .cc, .cp", // GNU G++17 9.2.0 (64 bit, msys 2)
	"65" : ".cs", // C# 8, .NET Core 3.1
	"9"  : ".cs", // C# Mono 6.8
	"28" : ".d, .dd, .di, .def", // D DMD32 v2.091.0
	"32" : ".go", // Go 1.15.6
	"12" : ".hs, .lhs", // Haskell GHC 8.10.1
	"60" : ".java", // Java 11.0.6
	"36" : ".java", // Java 1.8.0_241
	"48" : ".kt, .kts", // Kotlin 1.4.0
	"19" : ".ml, .mli", // OCaml 4.02.1 // mli - module?
	"3"  : ".pas, .dpr, .dpk, .pp", // Delphi 7 // dpk - module?
	"4"  : ".p, .pp, .pas", // Free Pascal 3.0.2
	"51" : ".p, .pp, .pas", // PascalABC.NET 3.4.2
	"13" : ".pl, .pm", // Perl 5.20.1 // pm - module?
	"6"  : ".php, .php7", // PHP 7.2.13
	"7"  : ".py, .pyc, .pyd, .pyo, .pyw, .pyz", // Python 2.7.18
	"31" : ".py, .pyc, .pyd, .pyo, .pyw, .pyz", // Python 3.9.1
	"40" : ".py, .pyc, .pyd, .pyo, .pyw, .pyz", // PyPy 2.7 (7.3.0)
	"41" : ".py, .pyc, .pyd, .pyo, .pyw, .pyz", // PyPy 3.7 (7.3.0)
	"67" : ".rb, .rbw", // Ruby 3.0.0 // rbw - ?
	"49" : ".rs", // Rust 1.49.0
	"20" : ".scala, .sc", // Scala 2.12.8
	"34" : ".js", // JavaScript V8 4.8.0
	"55" : ".js", // Node.js 12.6.3
};

function getElementByName(name) {
    return document.getElementsByName(name)[0];
}

(function() {
    'use strict';
    getElementByName("sourceFile").onclick = function () {
        var id = getElementByName("programTypeId").value;
        this.accept = getExt[id];
//        getElementByName("sourceFile").accept = getExt[id];
    }
})();
