{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE ExistentialQuantification   #-}

module Models where
import Data.Text
import Database.Persist
import Database.Persist.TH
import Database.Persist.Postgresql
import Control.Monad.IO.Class (liftIO)
import Data.Time.Clock (UTCTime)
import Data.Int
import Control.Monad.State
import Control.Monad.Reader
import Control.Monad.Logger
import Control.Monad.Trans.Resource
import qualified Data.Map.Strict as Map

share [mkPersist sqlSettings] [persistLowerCase|
User
    name Text
    username Text
    password Text
    deriving Show
Document
    category Text
    title Text
    content Text
    created_at UTCTime
    updated_at UTCTime
Config
    name Text
    created_at UTCTime
    updated_at UTCTime
|]

toDocId :: Int64 -> DocumentId
toDocId = toSqlKey

toConfigId :: Int64 -> ConfigId
toConfigId = toSqlKey

toUserId :: Int64 -> UserId
toUserId = toSqlKey

data SKey = Conf

data SVal = forall a. SVal a

type AppState = Map.Map SKey SVal
type App = (StateT AppState (ReaderT SqlBackend (NoLoggingT (ResourceT IO))) ())
