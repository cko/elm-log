
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown

main : Html a
main = 
  div
    [ class "container" ]
    [
      header, 
      content
    ]


header : Html a
header = 
  div 
    [ class "navigation" ] 
    [text "navigation"]


content : Html a
content =
  Markdown.toHtml [] markdown

  
markdown : String
markdown = """

test

"""
