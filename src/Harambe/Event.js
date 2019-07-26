"use-strict";

// foreign import data Handler :: Type -> Type

// forall action. (Event -> action) -> Handler action
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

// forall action. action -> Handler action
exports.handle_ = function(action) {
  var f = function(dispatch) {
    return function(_syntheticEvent) {
      return dispatch(action);
    };
  };
  f.isEventHandler = true;
  return f;
};
