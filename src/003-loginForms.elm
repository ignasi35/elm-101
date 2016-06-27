import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String

main =
  Html.beginnerProgram { model = model, view = view, update = update }

type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }

model : Model
model = Model "" "" ""


-- UPDATE

type Msg
  = Name String
  | Password String
  | PasswordAgain String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name x -> { model | name = x }
    Password x -> { model | password = x }
    PasswordAgain x -> { model | passwordAgain = x }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ type' "text", placeholder "Name", onInput Name ] []
    , input [ type' "password", placeholder "Password", onInput Password ] []
    , input [ type' "password", placeholder "Re-enter password", onInput PasswordAgain ] []
    , viewValidation model
    ]

viewValidation : Model -> Html Msg
viewValidation model =
  let
    (color, message) =
      if model.password /= model.passwordAgain then
        ( "red" , "Password do not match!" )
      else if String.length (String.trim model.password) <= 8 then
        ( "red" , "Password too short." )
      else
        ("green", "OK")
  in
    div [ style [("color", color)] ] [ text message ]
