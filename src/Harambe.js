"use-strict";

var React = require("react");
var ReactDOM = require("react-dom");

function PubSub() {
  this.handlers = [];
}

PubSub.prototype.publish = function(action) {
  this.handlers.forEach(function(handler) {
    handler(action);
  });
};

PubSub.prototype.subscribe = function(handler) {
  this.handlers.push(handler);
};

function CreateRuntime(translator, program) {
  var pubsub = new PubSub();

  function reducer(state, action) {
    var result = program.reducer(state)(action);
    var newState = translator.fst(result);
    var aff = translator.fromMaybe(null)(translator.snd(result));

    if (aff !== null) {
      translator
        .promiseFromAff(aff)()
        .then(function(action) {
          pubsub.publish(action);
        });
    }

    return newState;
  }

  return function Runtime(_props) {
    var stateAndDispatch = React.useReducer(reducer, program.initialState);

    var state = stateAndDispatch[0];
    var dispatch = stateAndDispatch[1];

    pubsub.subscribe(dispatch);

    var elements = program.render(state).map(function(element) {
      return element(dispatch);
    });

    return React.createElement.apply(
      null,
      [React.Fragment, null].concat(elements)
    );
  };
}

exports.runProgram = function(translator) {
  return function(program) {
    return function(element) {
      return function() {
        ReactDOM.render(
          React.createElement(CreateRuntime(translator, program), null),
          element
        );
      };
    };
  };
};
