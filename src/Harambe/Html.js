"use-strict";

var React = require("react");

exports.element = function(type, props, children) {
  return function(dispatch) {
    var childrenWithDispatch = children.map(function(child) {
      return child(dispatch);
    });

    var propsWithDispatch = Object.keys(props).reduce(function(obj, key) {
      if (props[key].isEventHandler) {
        obj[key] = props[key](dispatch);
        return obj;
      } else {
        obj[key] = props[key];
        return obj;
      }
    }, {});

    return React.createElement.apply(
      null,
      [type, propsWithDispatch].concat(childrenWithDispatch)
    );
  };
};

// forall a b. (a -> b) -> Html a -> Html b
exports.mapHtml = function(f) {
  return function(html) {
    return function(dispatch) {
      return html(function(a) {
        dispatch(f(a));
      });
    };
  };
};

// :: Dir
exports.ltr = "ltr";
exports.rtl = "rtl";
exports.auto = "auto";

// forall a action. a -> Html action
exports.unsafeToHtml = function(a) {
  return function(_dispatch) {
    return a;
  };
};
