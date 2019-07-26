"use-strict";

var React = require("react");
var ReactDOM = require("react-dom");

function CreateRuntime(program) {
  return function Runtime(props) {
    var stateAndDispatch = React.useReducer(function(state, action) {
      return program.reducer(state)(action)();
    }, program.initialState);

    var state = stateAndDispatch[0];
    var dispatch = stateAndDispatch[1];

    var elements = program.render(state).map(function(element) {
      return element(dispatch);
    });

    return React.createElement.apply(
      null,
      [React.Fragment, null].concat(elements)
    );
  };
}

// forall state action. Program state action -> HTMLElement -> Effect Unit
exports.run = function(program) {
  return function(element) {
    return function() {
      ReactDOM.render(
        React.createElement(CreateRuntime(program), null),
        element
      );
    };
  };
};
