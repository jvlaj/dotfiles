// ==UserScript==
// @name        New script - destiny.gg
// @namespace   Violentmonkey Scripts
// @match       https://www.destiny.gg/embed/chat
// @grant       none
// @version     1.0
// @author      -
// @description 11/30/2020, 12:36:53 PM
// ==/UserScript==



var style = document.createElement('style');
style.type = 'text/css';
style.innerHTML = 'body {background-color: #2e3440 !important;} #chat-input-control{background-color:#434c5e !important;}::placeholder{color: #FFF6!important; opacity: 1;}';
document.getElementsByTagName('head')[0].appendChild(style);