{-# LANGUAGE OverloadedStrings #-}
module Views.Index where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Views.Templates.Layout
import Text.Blaze.Html.Renderer.Text

render = renderHtml $ renderLayout $ do
    H.div "Hello World!"
