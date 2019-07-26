module Harambe.Event
  ( Handler
  , handle
  , handle_
  ) where

foreign import data Handler :: Type -> Type -> Type

foreign import handle :: forall event action. (event -> action) -> Handler event action

foreign import handle_ :: forall event action. action -> Handler event action
