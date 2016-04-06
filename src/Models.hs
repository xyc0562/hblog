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
|]
