{-# LANGUAGE OverloadedStrings #-}
module Views.Templates.Layout where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Models

renderLayout content = do
        H.docTypeHtml $ do
            H.head $ do
                H.link ! A.rel "stylesheet" ! A.href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
            H.body $ do
                H.div ! A.class_ "container" $ do
                    H.div ! A.class_ "row" $ do
                        H.div ! A.class_ "col-sm-3" $ do
                            H.h1 "Yecheng Xu"
                        H.div ! A.class_ "col-sm-9" $ do
                            content
                        
