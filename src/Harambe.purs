module Harambe
  ( Program
  , run
  ) where

import Prelude
import Effect (Effect)
import Web.HTML.HTMLElement (HTMLElement)

import Harambe.Html (Html)

type Program state action
  = { initialState :: state
    , render       :: state -> Array (Html action)
    , reducer      :: state -> action -> Effect state
    }

foreign import run
  :: forall state action
   . Program state action
  -> HTMLElement
  -> Effect Unit
