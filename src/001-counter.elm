import Html exposing (div, button, text)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (onClick)


main =
  beginnerProgram { model = 0, view = view, update = update }


-- MODEL
-- in this example 'model == a number' 
type alias Model = Int
model : Model
model = 
   0

-- VIEW 
view : Model -> Html.Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Reset ] [ text "reset" ]
    ]


--UPDATE
type Msg = Increment | Decrement | Reset

update: Msg -> Model -> Model
update msg model =
  case msg of
    Increment -> model + 1
    Decrement -> model - 1
    Reset -> 0

