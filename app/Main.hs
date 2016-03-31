{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Network.Wai.Middleware.Static
import qualified Views.Index as Index

main :: IO ()
main = scotty 3000 $ do
    -- Static files
    middleware $ staticPolicy (noDots >-> addBase "files")
    get "/" $ do
        html Index.render
