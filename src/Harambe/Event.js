"use-strict";

var React = require("react");

exports._handle = function(context) {
  return function(f) {
    return function(syntheticEvent) {
      //var dispatch = React.useContext(context);
      //// https://reactjs.org/docs/events.html
      //var action = f(syntheticEvent.nativeEvent);
      //return dispatch(action);
    };
  };
};
