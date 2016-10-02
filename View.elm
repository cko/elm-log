module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown

import Type exposing (..)

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
    [ a [href "/"][text "Home"]
    , a [href "https://github.com"][text "GitHub"]
    , a [href "https://twitter.com"][text "Twitter"]]


content : Model -> Html a
content model = Markdown.toHtml [] model.text
