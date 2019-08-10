module Main (main) where

import Prelude
import Data.Maybe (Maybe(..))
import Data.Time.Duration as Duration
import Data.Tuple.Nested (type (/\), (/\))
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff as Aff
import Effect.Class (liftEffect)
import Effect.Console as Console
import Web.HTML.HTMLElement (HTMLElement)

import Harambe as Harambe
import Harambe.Html (Html)
import Harambe.Html as Html
import Harambe.Event as Event

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

reducer :: State -> Action -> State /\ Maybe (Aff Action)
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
      [ map (\_ -> Increment) (counter state)
      ]
  ]

counter :: State -> Html Unit
counter state =
  Html.div
    { id: "niceee"
    , onClick: Event.handle_ unit
    , title: show state.count
    }
    [ Html.text (show state.count) ]
