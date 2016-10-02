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
    { name: String
    , text: String
    }


init : ( Model, Cmd Msg )
init =
    ( {name= "", text=""}, fetchCmd {name="index.md", text=""} )


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header
         , content model
        ] 


header : Html a
header = 
  div 
    [ class "navigation" ] 
    [ text "navigation"]


content : Model -> Html a
content model = Markdown.toHtml [] model.text


url : String -> String
url mdfile =
    "http://localhost:8000/" ++ mdfile


fetchTask : String -> Task Http.Error String
fetchTask mdfile =
    Http.getString (url mdfile)


fetchCmd : Model -> Cmd Msg
fetchCmd model =
    Task.perform FetchError FetchSuccess (fetchTask model.name)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Fetch ->
            ( model, fetchCmd model )

        FetchSuccess text ->
            ( {name = model.name, text = text}, Cmd.none )

        FetchError error ->
            ( {name="", text=toString error}, Cmd.none )

