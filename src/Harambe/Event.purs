module Harambe.Event
  ( Handler
  , handle
  ) where

import Harambe.Internal.Context (Context, Dispatch, dispatchContext)

handle :: forall event action. (event -> action) -> Handler event action
handle = _handle dispatchContext

foreign import data Handler :: Type -> Type -> Type

foreign import _handle :: forall event action. Context Dispatch -> (event -> action) -> Handler event action
