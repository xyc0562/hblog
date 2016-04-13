{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Network.Wai.Middleware.Static
import qualified Views.Index as Index
import Control.Monad.IO.Class  (liftIO)
import Control.Monad.Logger    (runStderrLoggingT)
import qualified Database.Persist as P
import qualified Database.Persist.Postgresql as PO
import Database.Persist.TH
import Models
import Data.String.Conversions
import qualified Control.Monad.State as S

connStr = "host=localhost dbname=hblog user=webserver password=peekman2015 port=5432"

main :: IO ()
main = runStderrLoggingT $ PO.withPostgresqlPool connStr 10 $ \pool -> liftIO $ do
    flip PO.runSqlPersistMPool pool $ do
        maybeDoc <- PO.get $ toDocId 2
        liftIO $ do
            scotty 3000 $ do
                -- Static files
                middleware $ staticPolicy (noDots >-> addBase "files")
                get "/" $ do
                    case maybeDoc of
                        Nothing -> html $ "abc"
                        Just doc -> html $ convertString $ documentTitle doc
                    
