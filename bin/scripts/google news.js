// ==UserScript==
// @name        New script - google.com
// @namespace   Violentmonkey Scripts
// @match       https://news.google.com/
// @grant       none
// @version     1.0
// @author      -
// @description 11/30/2020, 3:55:30 PMj
// ==/UserScript==

var style = document.createElement('style');
style.type = 'text/css';
style.innerHTML = 'body {background-color: #2e3440 !important;}';
document.getElementsById('yDmH0d')[0].appendChild(style);
