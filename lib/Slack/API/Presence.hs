module Slack.API.Presence where

import Data.Aeson
import qualified Data.Text as T


data Presence = Away
              | Active
              deriving Show

instance FromJSON Presence where
  parseJSON = withText "Presence"
    (\case
      "active" -> pure Active
      "away"   -> pure Away
      s        -> fail $ "Unrecognised presence type: " ++ T.unpack s)
