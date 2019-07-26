"use-strict";

var React = require("react");

// forall action. String -> Html action
exports.text = function(string) {
  return function(_dispatch) {
    return string;
  };
};

exports.createElement = function(type) {
  return function(props) {
    return function(children) {
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
  };
};

exports.handle_ = function(action) {
  var f = function(dispatch) {
    return function(_event) {
      return dispatch(action);
    };
  };
  f.isEventHandler = true;
  return f;
};

// yolo
exports.unsafeCoerce = function(a) {
  return a;
};
