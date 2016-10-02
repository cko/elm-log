module Type exposing (..)

import Http

type Msg
    = Fetch
    | FetchSuccess String
    | FetchError Http.Error


type alias Model = 
    { name: String
    , text: String
    }
