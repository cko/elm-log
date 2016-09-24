import Html.App exposing (beginnerProgram)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown

main = beginnerProgram { model = "", view = view, update = update }

type Msg = NewContent String

update (NewContent content) oldContent = 
  content

view model =
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
