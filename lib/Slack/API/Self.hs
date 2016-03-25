module Slack.API.Self where

import Control.Lens.TH
import Data.Aeson
import Data.Text (Text)

import Slack.API.Id
import Slack.API.Preferences
import Slack.API.Presence
import Slack.API.Time


data Self = Self
            { _selfUserId         :: UserId
            , _selfName           :: Text
            , _selfPreferences    :: Preferences
            , _selfCreated        :: Time
            , _selfManualPresence :: Presence
            } deriving Show

makeLenses ''Self

instance FromJSON Self where
  parseJSON = withObject "self" (\o ->
    Self
      <$> o .: "id"
      <*> o .: "name"
      <*> o .: "prefs"
      <*> o .: "created"
      <*> o .: "manual_presence")
