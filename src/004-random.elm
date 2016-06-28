import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Random


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


type alias Model =
    { dieFace :Int
    }

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (toString model.dieFace)]
    , button [ onClick Roll ] [ text "Roll" ]
    ]

type Msg
   = Roll
   | NewFace Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
      Roll ->
          (model, Random.generate NewFace (Random.int 1 6))
      NewFace newFace ->
          (Model newFace, Cmd.none)

init : (Model, Cmd Msg)
init =
  (Model 1 , Cmd.none)