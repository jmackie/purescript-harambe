"use-strict";

// foreign import data Handler :: Type -> Type -> Type

// forall event action. (event -> action) -> Handler event action
exports.handle = function(f) {
  var f = function(dispatch) {
    return function(syntheticEvent) {
      // https://reactjs.org/docs/events.html
      var action = f(syntheticEvent.nativeEvent);
      return dispatch(action);
    };
  };
  f.isEventHandler = true;
  return f;
};

// forall event action. action -> Handler event action
exports.handle_ = function(action) {
  var f = function(dispatch) {
    return function(_syntheticEvent) {
      return dispatch(action);
    };
  };
  f.isEventHandler = true;
  return f;
};
