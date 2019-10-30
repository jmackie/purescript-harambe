"use-strict";

var React = require("react");

exports._element = function(type, props, children) {
  return React.createElement.apply(null, [type, props].concat(children));
};

exports.ltr = "ltr"; // :: Dir
exports.rtl = "rtl"; // :: Dir
exports.auto = "auto"; // :: Dir
