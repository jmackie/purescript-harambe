-- https://github.com/slamdata/purescript-dom-indexed/blob/master/src/DOM/HTML/Indexed.purs
module Harambe.Html
  ( Html
  , text
  , element

  , h1, h2, h3, h4, h5, h6
  , div, p, hr, pre, blockquote
  , span, a, code, em, strong, i, b, u, sub, sup, br

  , Dir, ltr, rtl
  ) where

import Prelude
import Prim.Row (class Union)

import Web.Clipboard.ClipboardEvent (ClipboardEvent) as Web
import Web.Event.Event (Event) as Web
import Web.HTML.Event.DragEvent (DragEvent) as Web
import Web.TouchEvent.TouchEvent (TouchEvent) as Web
import Web.UIEvent.FocusEvent (FocusEvent) as Web
import Web.UIEvent.KeyboardEvent (KeyboardEvent) as Web
import Web.UIEvent.MouseEvent (MouseEvent) as Web
import Web.UIEvent.WheelEvent (WheelEvent) as Web

import Harambe.Event as Event

foreign import data Html :: Type -> Type

instance functorHtml :: Functor Html where
  map = mapHtml

foreign import mapHtml :: forall a b. (a -> b) -> Html a -> Html b

-- | Create a text element.
text :: forall action. String -> Html action
text = unsafeToHtml

foreign import element :: forall props action. String -> { | props } -> Array (Html action) -> Html action

--------------------------------------------------------------------------------
-- Headers

h1 :: forall props x action. Union props x (Props_h1 action) => Record props -> Array (Html action) -> Html action
h1 = element "h1"

type Props_h1 action = Interactive action ( onScroll :: Event.Handler Web.Event action )

h2 :: forall props x action. Union props x (Props_h2 action) => Record props -> Array (Html action) -> Html action
h2 = element "h2"

type Props_h2 action = Interactive action ( onScroll :: Event.Handler Web.Event action )

h3 :: forall props x action. Union props x (Props_h3 action) => Record props -> Array (Html action) -> Html action
h3 = element "h3"

type Props_h3 action = Interactive action ( onScroll :: Event.Handler Web.Event action )

h4 :: forall props x action. Union props x (Props_h4 action) => Record props -> Array (Html action) -> Html action
h4 = element "h4"

type Props_h4 action = Interactive action ( onScroll :: Event.Handler Web.Event action )

h5 :: forall props x action. Union props x (Props_h5 action) => Record props -> Array (Html action) -> Html action
h5 = element "h5"

type Props_h5 action = Interactive action ( onScroll :: Event.Handler Web.Event action )

h6 :: forall props x action. Union props x (Props_h6 action) => Record props -> Array (Html action) -> Html action
h6 = element "h6"

type Props_h6 action = Interactive action ( onScroll :: Event.Handler Web.Event action )

--------------------------------------------------------------------------------
-- Grouping content

div :: forall props x action. Union props x (Props_div action) => Record props -> Array (Html action) -> Html action
div = element "div"

type Props_div action = Interactive action ( onScroll :: Event.Handler Web.Event action )

p :: forall props x action. Union props x (Props_p action) => Record props -> Array (Html action) -> Html action
p = element "p"

type Props_p action = Interactive action ( onScroll :: Event.Handler Web.Event action )

hr :: forall props x action. Union props x (Props_hr action) => Record props -> Array (Html action) -> Html action
hr = element "hr"

type Props_hr action = Interactive action ()

pre :: forall props x action. Union props x (Props_pre action) => Record props -> Array (Html action) -> Html action
pre = element "pre"

type Props_pre action = Interactive action ( onScroll :: Event.Handler Web.Event action )

blockquote :: forall props x action. Union props x (Props_blockquote action) => Record props -> Array (Html action) -> Html action
blockquote = element "blockquote"

type Props_blockquote action = Interactive action ( cite :: String, onScroll :: Event.Handler Web.Event action )

--------------------------------------------------------------------------------
-- Text

span :: forall props x action. Union props x (Props_span action) => Record props -> Array (Html action) -> Html action
span = element "span"

type Props_span action = Interactive action ()

a :: forall props x action. Union props x (Props_a action) => Record props -> Array (Html action) -> Html action
a = element "a"

type Props_a action
  = Interactive action
  ( download :: String
  , href     :: String
  , hrefLang :: String
  , rel      :: String
  , target   :: String
  , type     :: String  -- MediaType
  )

code :: forall props x action. Union props x (Props_code action) => Record props -> Array (Html action) -> Html action
code = element "code"

type Props_code action = Interactive action ()

em :: forall props x action. Union props x (Props_em action) => Record props -> Array (Html action) -> Html action
em = element "em"

type Props_em action = Interactive action ()

strong :: forall props x action. Union props x (Props_strong action) => Record props -> Array (Html action) -> Html action
strong = element "strong"

type Props_strong action = Interactive action ()

i :: forall props x action. Union props x (Props_i action) => Record props -> Array (Html action) -> Html action
i = element "i"

type Props_i action = Interactive action ()

b :: forall props x action. Union props x (Props_b action) => Record props -> Array (Html action) -> Html action
b = element "b"

type Props_b action = Interactive action ()

u :: forall props x action. Union props x (Props_u action) => Record props -> Array (Html action) -> Html action
u = element "u"

type Props_u action = Interactive action ()

sub :: forall props x action. Union props x (Props_sub action) => Record props -> Array (Html action) -> Html action
sub = element "sub"

type Props_sub action = Interactive action ()

sup :: forall props x action. Union props x (Props_sup action) => Record props -> Array (Html action) -> Html action
sup = element "sup"

type Props_sup action = Interactive action ()

br :: forall props x action. Union props x (Props_br action) => Record props -> Array (Html action) -> Html action
br = element "br"

type Props_br action = Noninteractive action ()


--XXX :: forall props x action. Union props x (Props_XXX action) => Record props -> Array (Html action) -> Html action
--XXX = element "XXX"
--
--type Props_XXX action = Interactive action ()

--------------------------------------------------------------------------------

type GlobalAttributes r
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

type GlobalEvents action r
  = ( onContextMenu :: Event.Handler Web.Event action
    | r
    )

type MouseEvents action r
  = ( onDoubleClick :: Event.Handler Web.MouseEvent action
    , onClick       :: Event.Handler Web.MouseEvent action
    , onMouseDown   :: Event.Handler Web.MouseEvent action
    , onMouseEnter  :: Event.Handler Web.MouseEvent action
    , onMouseLeave  :: Event.Handler Web.MouseEvent action
    , onMouseMove   :: Event.Handler Web.MouseEvent action
    , onMouseOver   :: Event.Handler Web.MouseEvent action
    , onMouseOut    :: Event.Handler Web.MouseEvent action
    , onMouseUp     :: Event.Handler Web.MouseEvent action
    | r
    )

type DragEvents action r
  = ( onDrag      :: Event.Handler Web.DragEvent action
    , onDragEnd   :: Event.Handler Web.DragEvent action
    , onDragExit  :: Event.Handler Web.DragEvent action
    , onDragEnter :: Event.Handler Web.DragEvent action
    , onDragLeave :: Event.Handler Web.DragEvent action
    , onDragOver  :: Event.Handler Web.DragEvent action
    , onDragStart :: Event.Handler Web.DragEvent action
    , onDrop      :: Event.Handler Web.DragEvent action
    | r
    )

type TouchEvents action r
  = ( onTouchCancel :: Event.Handler Web.TouchEvent action
    , onTouchEnd    :: Event.Handler Web.TouchEvent action
    , onTouchEnter  :: Event.Handler Web.TouchEvent action
    , onTouchLeave  :: Event.Handler Web.TouchEvent action
    , onTouchMove   :: Event.Handler Web.TouchEvent action
    , onTouchStart  :: Event.Handler Web.TouchEvent action
    | r
    )

type PointerEvents action r
  = ( onPointerOver      :: Event.Handler Web.Event action
    , onPointerEnter     :: Event.Handler Web.Event action
    , onPointerDown      :: Event.Handler Web.Event action
    , onPointerMove      :: Event.Handler Web.Event action
    , onPointerUp        :: Event.Handler Web.Event action
    , onPointerCancel    :: Event.Handler Web.Event action
    , onPointerOut       :: Event.Handler Web.Event action
    , onPointerLeave     :: Event.Handler Web.Event action
    , gotPointerCapture  :: Event.Handler Web.Event action
    , lostPointerCapture :: Event.Handler Web.Event action
    | r
    )

type KeyEvents action r
  = ( onKeyDown  :: Event.Handler Web.KeyboardEvent action
    , onKeyUp    :: Event.Handler Web.KeyboardEvent action
    , onKeyPress :: Event.Handler Web.KeyboardEvent action
    | r
    )

type TransitionEvents action r
  = ( onTransitionEnd :: Event.Handler Web.Event action
    | r
    )

type FocusEvents action r
  = ( onBlur     :: Event.Handler Web.FocusEvent action
    , onFocus    :: Event.Handler Web.FocusEvent action
    , onFocusIn  :: Event.Handler Web.FocusEvent action
    , onFocusOut :: Event.Handler Web.FocusEvent action
    | r
    )

type ClipboardEvents action r
  = ( onCopy  :: Event.Handler Web.ClipboardEvent action
    , onCut   :: Event.Handler Web.ClipboardEvent action
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

ltr :: Dir
ltr = unsafeCoerce "ltr"

rtl :: Dir
rtl = unsafeCoerce "ltr"

auto :: Dir
auto = unsafeCoerce "auto"

--------------------------------------------------------------------------------

type RowApply (f :: # Type -> # Type) (a :: # Type) = f a

infixr 0 type RowApply as +

foreign import unsafeToHtml :: forall a action. a -> Html action

foreign import unsafeCoerce :: forall a b. a -> b
