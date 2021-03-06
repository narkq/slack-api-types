{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE ViewPatterns #-}
module Slack.API.Time where

import Control.Error (readZ)
import Control.Lens.TH
import Data.Aeson
import Data.Aeson.Types
import qualified Data.Text as T
import Data.Time.Clock.POSIX (POSIXTime)


default ()

newtype Time = Time
               { _getTime :: POSIXTime
               } deriving (Fractional, Num, Real, Eq, Ord, Show)

-- Might be better to keep this abstract..
data SlackTimeStamp = SlackTimeStamp
                      { _slackTime :: Time
                      , _timestampUid :: Int
                      } deriving (Show, Ord, Eq)

makeLenses ''SlackTimeStamp
makeLenses ''Time

instance FromJSON SlackTimeStamp where
  parseJSON = withText "SlackTimeStamp" (\s ->
    let (ts, tail -> uid) = break (== '.') (T.unpack s)
    in SlackTimeStamp
         <$> fmap (Time . realToFrac) (readZ ts :: Parser Integer)
         <*> readZ uid)

instance FromJSON Time where
  parseJSON = withScientific "Time" (return . Time . realToFrac)
