module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown

import Type exposing (..)

view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ navigation model
         , content model
        ] 


navigation : Model -> Html Msg
navigation model = 
  header 
    [ id "header" ] 
    [ ul [class "ant-menu ant-menu-horizontal ant-menu-light"]
      [ a [onClick (Fetch "index.md")][text "Home"]
      , a [href "https://github.com"][text "GitHub"]
      , a [href "https://twitter.com"][text "Twitter"]]]


content : Model -> Html a
content model = 
  div [ class "main-wrapper" ]
      [ div [ class "ant-row"]
        [div [ class "main-container ant-col-xs-24 ant-col-sm-24 ant-col-md-24 ant-col-lg-24" ]
          [ Markdown.toHtml [] model.text ]]]
