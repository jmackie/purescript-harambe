module Main (main) where

import Prelude
import Data.Maybe (Maybe(..))
import Data.Time.Duration as Duration
import Data.Tuple (Tuple)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff as Aff
import Effect.Class (liftEffect)
import Effect.Console as Console
import Web.HTML.HTMLElement (HTMLElement)

import Harambe as Harambe
import Harambe.Html (Html)
import Harambe.Html as Html

main :: HTMLElement -> Effect Unit
main =
  Harambe.run
    { initialState
    , render
    , reducer
    }

type State
  = { count :: Int
    }

initialState :: State
initialState =
  { count: 2
  }

data Action
  = NoOp
  | Increment

reducer :: State -> Action -> Tuple State (Maybe (Aff Action))
reducer state = case _ of
  NoOp ->
    state /\ Nothing

  Increment ->
    state { count = state.count + 1 } /\ Just do
      liftEffect (Console.log "Hello")
      Aff.delay (Duration.Milliseconds 1000.0)
      liftEffect (Console.log "World")
      pure NoOp

render :: State -> Array (Html Action)
render state =
  [ Html.div
      { className: "test"
      , dir: Html.ltr
      }
      [ Html.div
          { id: "niceee"
          , onClick: Html.handle_ Increment
          }
          [ Html.text (show state.count) ]
      ]
  ]
