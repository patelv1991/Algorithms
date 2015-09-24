// Implement the Array#map function in JavaScript.

Array.prototype.myMap = function (fn) {
  var final = [];
  this.forEach(function (num) {
    final.push(fn(num));
  });
  return final;
};
