module Harambe.Html
  ( Html
  , EventHandler
  , div
  , text
  , handle_

  , Dir, ltr, rtl
  ) where

import Prim.Row (class Union)

foreign import data Html :: Type -> Type

foreign import createElement
  :: forall props action
   . String
  -> { | props }
  -> Array (Html action)
  -> Html action

-- | Create a text element.
foreign import text :: forall action. String -> Html action

div
  :: forall props x action. Union props x (Props_div action)
  => Record props
  -> Array (Html action)
  -> Html action
div = createElement "div"

-- | Valid properties for a `<div>` element.
type Props_div action
  = Props_global
  + ( onClick :: EventHandler action
    )

foreign import data EventHandler :: Type -> Type

foreign import handle_ :: forall action. action -> EventHandler action

-- https://github.com/slamdata/purescript-dom-indexed/blob/master/src/DOM/HTML/Indexed.purs

type Props_global r
  = ( id              :: String
    , title           :: String
    , className       :: String
    , style           :: String
    , spellcheck      :: Boolean
    , draggable       :: Boolean
    , lang            :: String
    , dir             :: Dir
    , hidden          :: Boolean
    , tabIndex        :: Int
    , accessKey       :: String
    , contentEditable :: Boolean
    | r
    )

foreign import data Dir :: Type

ltr :: Dir
ltr = unsafeCoerce "ltr"

rtl :: Dir
rtl = unsafeCoerce "ltr"

auto :: Dir
auto = unsafeCoerce "auto"

type RowApply (f :: # Type -> # Type) (a :: # Type) = f a

infixr 0 type RowApply as +

foreign import unsafeCoerce :: forall a b. a -> b
