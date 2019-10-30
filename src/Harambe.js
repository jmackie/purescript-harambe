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

function NewRuntime(context, translator, program) {
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

    var elements = program.render(state);
    return React.createElement.apply(
      null,
      [context.Provider, { value: dispatch }].concat(elements)
    );
  };
}

exports._runProgram = function(context) {
  return function(translator) {
    return function(program) {
      return function(element) {
        return function() {
          var runtime = NewRuntime(context, translator, program);
          ReactDOM.render(React.createElement(runtime, null), element);
        };
      };
    };
  };
};
