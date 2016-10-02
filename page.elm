module Main exposing (..)

import Html.App
import Http
import Task exposing (Task)

import View exposing (..)
import Type exposing (..)

main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (always Sub.none)
        }

init : ( Model, Cmd Msg )
init =
    ( {name= "", text=""}, fetchCmd "index.md" )


url : String -> String
url mdfile =
    "http://localhost:8000/" ++ mdfile


fetchTask : String -> Task Http.Error String
fetchTask mdfile =
    Http.getString (url mdfile)


fetchCmd : String -> Cmd Msg
fetchCmd filename =
    Task.perform FetchError FetchSuccess (fetchTask filename)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Fetch ->
            ( model, fetchCmd model.name )

        FetchSuccess text ->
            ( {name = model.name, text = text}, Cmd.none )

        FetchError error ->
            ( {name="", text=toString error}, Cmd.none )

