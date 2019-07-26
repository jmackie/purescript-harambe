module Harambe
  ( Program
  , run
  ) where

import Prelude
import Data.Maybe (Maybe, fromMaybe)
import Data.Tuple (Tuple, fst, snd)
import Data.Tuple.Nested (type (/\))
import Effect (Effect)
import Effect.Aff (Aff)
import Web.HTML.HTMLElement (HTMLElement)
import Control.Promise as Promise

import Harambe.Html (Html)

-- | Description of a web application program thingy.
type Program state action
  = { initialState :: state
    , render       :: state -> Array (Html action)
    , reducer      :: state -> action -> state /\ Maybe (Aff action)

    -- TODO:
    --   - subscriptions
    --   - ...?
    }

run
  :: forall state action
   . Program state action
  -> HTMLElement
  -> Effect Unit
run = runProgram translator

-- | Things that we need to send to javascript land to work with the `Program`
-- | object.
type Translator
  = { fst :: forall a b. Tuple a b -> a
    , snd :: forall a b. Tuple a b -> b
    , fromMaybe :: forall a. a -> Maybe a -> a
    , promiseFromAff :: forall a. Aff a -> Effect (Promise.Promise a)
    }

translator :: Translator
translator =
  { fst
  , snd
  , fromMaybe
  , promiseFromAff: Promise.fromAff
  }

foreign import runProgram
  :: forall state action
   . Translator
  -> Program state action
  -> HTMLElement
  -> Effect Unit
