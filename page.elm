module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown
import Html.App
import Http
import Task exposing (Task)


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (always Sub.none)
        }


type Msg
    = Fetch
    | FetchSuccess String
    | FetchError Http.Error


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "", fetchCmd )


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header
        , Markdown.toHtml [] model
        ]


header : Html a
header = 
  div 
    [ class "navigation" ] 
    [ text "navigation"]


url : String
url =
    "http://localhost:8000/test.md"


fetchTask : Task Http.Error String
fetchTask =
    Http.getString url


fetchCmd : Cmd Msg
fetchCmd =
    Task.perform FetchError FetchSuccess fetchTask


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Fetch ->
            ( model, fetchCmd )

        FetchSuccess name ->
            ( name, Cmd.none )

        FetchError error ->
            ( toString error, Cmd.none )

