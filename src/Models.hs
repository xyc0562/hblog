{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE MultiParamTypeClasses      #-}

module Models where
import Data.Text
import Database.Persist
import Database.Persist.TH
import Database.Persist.Postgresql
import Control.Monad.IO.Class (liftIO)
import Data.Time.Clock (UTCTime)
import Data.Int
import Control.Monad.State
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

newtype AppState = AppState (Map.Map Text Text)
newtype App a = App ((StateT AppState IO) a)
