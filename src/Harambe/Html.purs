-- https://github.com/slamdata/purescript-dom-indexed/blob/master/src/DOM/HTML/Indexed.purs
module Harambe.Html where

import Prim.Row (class Union)
import Data.Function.Uncurried as Fn
import Web.Clipboard.ClipboardEvent (ClipboardEvent) as Web
import Web.Event.Event (Event) as Web
import Web.HTML.Event.DragEvent (DragEvent) as Web
import Web.TouchEvent.TouchEvent (TouchEvent) as Web
import Web.UIEvent.FocusEvent (FocusEvent) as Web
import Web.UIEvent.KeyboardEvent (KeyboardEvent) as Web
import Web.UIEvent.MouseEvent (MouseEvent) as Web
import Web.UIEvent.WheelEvent (WheelEvent) as Web
import Unsafe.Coerce (unsafeCoerce)
import Harambe.Event as Event

foreign import data Html :: Type -> Type

-- | Create a text element.
text :: forall action. String -> Html action
text = unsafeCoerce

foreign import _element :: forall props action. Fn.Fn3 String { | props } (Array (Html action)) (Html action)

--------------------------------------------------------------------------------
-- Headers
h1 :: forall props x action. Union props x (Props_h1 action) => Record props -> Array (Html action) -> Html action
h1 props children = Fn.runFn3 _element "h1" props children

type Props_h1 action
  = Interactive action ( onScroll :: Event.Handler Web.Event action )

h2 :: forall props x action. Union props x (Props_h2 action) => Record props -> Array (Html action) -> Html action
h2 props children = Fn.runFn3 _element "h2" props children

type Props_h2 action
  = Interactive action ( onScroll :: Event.Handler Web.Event action )

h3 :: forall props x action. Union props x (Props_h3 action) => Record props -> Array (Html action) -> Html action
h3 props children = Fn.runFn3 _element "h3" props children

type Props_h3 action
  = Interactive action ( onScroll :: Event.Handler Web.Event action )

h4 :: forall props x action. Union props x (Props_h4 action) => Record props -> Array (Html action) -> Html action
h4 props children = Fn.runFn3 _element "h4" props children

type Props_h4 action
  = Interactive action ( onScroll :: Event.Handler Web.Event action )

h5 :: forall props x action. Union props x (Props_h5 action) => Record props -> Array (Html action) -> Html action
h5 props children = Fn.runFn3 _element "h5" props children

type Props_h5 action
  = Interactive action ( onScroll :: Event.Handler Web.Event action )

h6 :: forall props x action. Union props x (Props_h6 action) => Record props -> Array (Html action) -> Html action
h6 props children = Fn.runFn3 _element "h6" props children

type Props_h6 action
  = Interactive action ( onScroll :: Event.Handler Web.Event action )

--------------------------------------------------------------------------------
-- Grouping content
div :: forall props x action. Union props x (Props_div action) => Record props -> Array (Html action) -> Html action
div props children = Fn.runFn3 _element "div" props children

type Props_div action
  = Interactive action ( onScroll :: Event.Handler Web.Event action )

p :: forall props x action. Union props x (Props_p action) => Record props -> Array (Html action) -> Html action
p props children = Fn.runFn3 _element "p" props children

type Props_p action
  = Interactive action ( onScroll :: Event.Handler Web.Event action )

hr :: forall props x action. Union props x (Props_hr action) => Record props -> Array (Html action) -> Html action
hr props children = Fn.runFn3 _element "hr" props children

type Props_hr action
  = Interactive action ()

pre :: forall props x action. Union props x (Props_pre action) => Record props -> Array (Html action) -> Html action
pre props children = Fn.runFn3 _element "pre" props children

type Props_pre action
  = Interactive action ( onScroll :: Event.Handler Web.Event action )

blockquote :: forall props x action. Union props x (Props_blockquote action) => Record props -> Array (Html action) -> Html action
blockquote props children = Fn.runFn3 _element "blockquote" props children

type Props_blockquote action
  = Interactive action ( cite :: String, onScroll :: Event.Handler Web.Event action )

--------------------------------------------------------------------------------
-- Text
span :: forall props x action. Union props x (Props_span action) => Record props -> Array (Html action) -> Html action
span props children = Fn.runFn3 _element "span" props children

type Props_span action
  = Interactive action ()

a :: forall props x action. Union props x (Props_a action) => Record props -> Array (Html action) -> Html action
a props children = Fn.runFn3 _element "a" props children

type Props_a action
  = Interactive action
      ( download :: String
      , href :: String
      , hrefLang :: String
      , rel :: String
      , target :: String
      , type :: String -- MediaType
      )

code :: forall props x action. Union props x (Props_code action) => Record props -> Array (Html action) -> Html action
code props children = Fn.runFn3 _element "code" props children

type Props_code action
  = Interactive action ()

em :: forall props x action. Union props x (Props_em action) => Record props -> Array (Html action) -> Html action
em props children = Fn.runFn3 _element "em" props children

type Props_em action
  = Interactive action ()

strong :: forall props x action. Union props x (Props_strong action) => Record props -> Array (Html action) -> Html action
strong props children = Fn.runFn3 _element "strong" props children

type Props_strong action
  = Interactive action ()

i :: forall props x action. Union props x (Props_i action) => Record props -> Array (Html action) -> Html action
i props children = Fn.runFn3 _element "i" props children

type Props_i action
  = Interactive action ()

b :: forall props x action. Union props x (Props_b action) => Record props -> Array (Html action) -> Html action
b props children = Fn.runFn3 _element "b" props children

type Props_b action
  = Interactive action ()

u :: forall props x action. Union props x (Props_u action) => Record props -> Array (Html action) -> Html action
u props children = Fn.runFn3 _element "u" props children

type Props_u action
  = Interactive action ()

sub :: forall props x action. Union props x (Props_sub action) => Record props -> Array (Html action) -> Html action
sub props children = Fn.runFn3 _element "sub" props children

type Props_sub action
  = Interactive action ()

sup :: forall props x action. Union props x (Props_sup action) => Record props -> Array (Html action) -> Html action
sup props children = Fn.runFn3 _element "sup" props children

type Props_sup action
  = Interactive action ()

br :: forall props x action. Union props x (Props_br action) => Record props -> Array (Html action) -> Html action
br props children = Fn.runFn3 _element "br" props children

type Props_br action
  = Noninteractive action ()

--------------------------------------------------------------------------------
type GlobalAttributes r
  = ( id :: String
    , title :: String
    , className :: String
    , style :: String
    , spellcheck :: Boolean
    , draggable :: Boolean
    , lang :: String
    , dir :: Dir
    , hidden :: Boolean
    , tabIndex :: Int
    , accessKey :: String
    , contentEditable :: Boolean
    | r
    )

type GlobalEvents action r
  = ( onContextMenu :: Event.Handler Web.Event action
    | r
    )

type MouseEvents action r
  = ( onDoubleClick :: Event.Handler Web.MouseEvent action
    , onClick :: Event.Handler Web.MouseEvent action
    , onMouseDown :: Event.Handler Web.MouseEvent action
    , onMouseEnter :: Event.Handler Web.MouseEvent action
    , onMouseLeave :: Event.Handler Web.MouseEvent action
    , onMouseMove :: Event.Handler Web.MouseEvent action
    , onMouseOver :: Event.Handler Web.MouseEvent action
    , onMouseOut :: Event.Handler Web.MouseEvent action
    , onMouseUp :: Event.Handler Web.MouseEvent action
    | r
    )

type DragEvents action r
  = ( onDrag :: Event.Handler Web.DragEvent action
    , onDragEnd :: Event.Handler Web.DragEvent action
    , onDragExit :: Event.Handler Web.DragEvent action
    , onDragEnter :: Event.Handler Web.DragEvent action
    , onDragLeave :: Event.Handler Web.DragEvent action
    , onDragOver :: Event.Handler Web.DragEvent action
    , onDragStart :: Event.Handler Web.DragEvent action
    , onDrop :: Event.Handler Web.DragEvent action
    | r
    )

type TouchEvents action r
  = ( onTouchCancel :: Event.Handler Web.TouchEvent action
    , onTouchEnd :: Event.Handler Web.TouchEvent action
    , onTouchEnter :: Event.Handler Web.TouchEvent action
    , onTouchLeave :: Event.Handler Web.TouchEvent action
    , onTouchMove :: Event.Handler Web.TouchEvent action
    , onTouchStart :: Event.Handler Web.TouchEvent action
    | r
    )

type PointerEvents action r
  = ( onPointerOver :: Event.Handler Web.Event action
    , onPointerEnter :: Event.Handler Web.Event action
    , onPointerDown :: Event.Handler Web.Event action
    , onPointerMove :: Event.Handler Web.Event action
    , onPointerUp :: Event.Handler Web.Event action
    , onPointerCancel :: Event.Handler Web.Event action
    , onPointerOut :: Event.Handler Web.Event action
    , onPointerLeave :: Event.Handler Web.Event action
    , gotPointerCapture :: Event.Handler Web.Event action
    , lostPointerCapture :: Event.Handler Web.Event action
    | r
    )

type KeyEvents action r
  = ( onKeyDown :: Event.Handler Web.KeyboardEvent action
    , onKeyUp :: Event.Handler Web.KeyboardEvent action
    , onKeyPress :: Event.Handler Web.KeyboardEvent action
    | r
    )

type TransitionEvents action r
  = ( onTransitionEnd :: Event.Handler Web.Event action
    | r
    )

type FocusEvents action r
  = ( onBlur :: Event.Handler Web.FocusEvent action
    , onFocus :: Event.Handler Web.FocusEvent action
    , onFocusIn :: Event.Handler Web.FocusEvent action
    , onFocusOut :: Event.Handler Web.FocusEvent action
    | r
    )

type ClipboardEvents action r
  = ( onCopy :: Event.Handler Web.ClipboardEvent action
    , onCut :: Event.Handler Web.ClipboardEvent action
    , onPaste :: Event.Handler Web.ClipboardEvent action
    | r
    )

type InteractiveEvents action r
  = ClipboardEvents action
      + FocusEvents action
      + TransitionEvents action
      + KeyEvents action
      + PointerEvents action
      + TouchEvents action
      + DragEvents action
      + MouseEvents action
      + ( onWheel :: Event.Handler Web.WheelEvent action | r )

type GlobalProperties action r
  = GlobalAttributes (GlobalEvents action r)

type Interactive action r
  = InteractiveEvents action
      + GlobalProperties action r

type Noninteractive action r
  = GlobalProperties action r

--------------------------------------------------------------------------------
foreign import data Dir :: Type

foreign import ltr :: Dir

foreign import rtl :: Dir

foreign import auto :: Dir

--------------------------------------------------------------------------------
type RowApply (f :: #Type -> #Type) (a :: #Type)
  = f a

infixr 0 type RowApply as +
