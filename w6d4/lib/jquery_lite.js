/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__ (1);

window.$l = function $l(arg) {
  if (arg instanceof HTMLElement){

    return new DOMNodeCollection([arg]);

  } else {

    let nodeList = document.querySelectorAll(arg);
    nodeList = Array.from(nodeList).slice();
    return new DOMNodeCollection(nodeList);

  }
};


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(arr) {
    this.htmlElements = arr;
  }
}

DOMNodeCollection.prototype.html = function (str) {
  if (str instanceof String) {
    for (let i = 0; i < this.htmlElements.length; i++) {
      this.htmlElements[i].innerHTML = str;
    }
  } else {
    return this.htmlElements[0].innerHTML;
  }
};

DOMNodeCollection.prototype.empty = function () {
  for (let i = 0; i < this.htmlElements.length; i++) {
    this.htmlElements[i].innerHTML = "";
  }
};

DOMNodeCollection.prototype.append = function (arg) {
  this.htmlElements.forEach(el => {
    if (arg instanceof String){
      el.innerHTML += arg;
   }
   else if (arg instanceof HTMLElement) {
     el.innerHTML += arg.outerHTML;
   } else {
     arg.forEach (htmlEl => {
       el.innerHTML += htmlEl.outerHTML;
     });
   }
 });
};

DOMNodeCollection.prototype.attr = function (key, val) {
  if (val instanceof String){
    this.each(node => node.setAttribute(key, val) );
  } else {
    return this.htmlElements[0].getAttribute(key);
  }

};


DOMNodeCollection.prototype.addClass = function (newClass) {
  this.htmlElements.each(node => node.classList.add(newClass));
};


DOMNodeCollection.prototype.removeClass = function () {

};

DOMNodeCollection.prototype.children = function () {
  let children = [];
  this.htmlElements.each(node => {
    const nodes = node.children;
    children = children.concat(Array.from(nodes));
  });
  return new DOMNodeCollection(children);
};

DOMNodeCollection.prototype.parent = function () {
  let parents = [];
  this.htmlElements.each(node => {

  });
  return new DOMNodeCollection(parents);
};















DOMNodeCollection.prototype.find = function () {

};

DOMNodeCollection.prototype.remove = function () {

};





module.exports = DOMNodeCollection;


/***/ })
/******/ ]);