module Harambe.Internal.Context (Context, Dispatch, dispatchContext) where


foreign import data Context :: Type -> Type

data Dispatch

foreign import dispatchContext :: Context Dispatch
