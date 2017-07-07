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
