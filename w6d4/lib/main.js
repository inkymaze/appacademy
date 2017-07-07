const DOMNodeCollection = require ("./dom_node_collection.js");

window.$l = function $l(arg) {
  if (arg instanceof HTMLElement){

    return new DOMNodeCollection([arg]);

  } else {

    let nodeList = document.querySelectorAll(arg);
    nodeList = Array.from(nodeList).slice();
    return new DOMNodeCollection(nodeList);

  }
};
