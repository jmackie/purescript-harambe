module Main (main) where

import Prelude
import Effect (Effect)
import Web.HTML.HTMLElement (HTMLElement)

import Harambe as Harambe
import Harambe.Html as Html
import Harambe.Html (Html)

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

reducer :: State -> Action -> Effect State
reducer state = case _ of
  NoOp -> pure state
  Increment -> pure (state { count = state.count + 1 })

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
