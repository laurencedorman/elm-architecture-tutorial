module TimeSince exposing (Model, Msg(..), init, main, update, view)

import Browser
import Date exposing (Date, Interval(..), Unit(..))
import Html exposing (Attribute, Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Time exposing (Month(..))


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { content : Date }


startDate =
    Date.fromCalendarDate 2019 Jan 1


init : Model
init =
    { content = startDate }


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change dateString ->
            let
                newDate =
                    case Date.fromIsoString dateString of
                        Ok date ->
                            date

                        Err err ->
                            startDate
            in
            { model | content = newDate }


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "date", value (Date.toIsoString model.content), onInput Change ] []
        ]
