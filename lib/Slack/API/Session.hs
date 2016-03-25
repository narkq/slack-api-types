module Slack.API.Session where

import Control.Lens.TH
import Data.Aeson
import Data.Text (Text)

import Slack.API.Bot
import Slack.API.Channel
import Slack.API.Group
import Slack.API.IM
import Slack.API.Self
import Slack.API.Team
import Slack.API.Time
import Slack.API.User


data SlackSession = SlackSession
                    { _slackSelf          :: Self
                    , _slackTeam          :: Team
                    , _slackUsers         :: [User]
                    , _slackLatestEventTs :: SlackTimeStamp
                    , _slackChannels      :: [Channel]
                    , _slackGroups        :: [Group]
                    , _slackIms           :: [IM]
                    , _slackBots          :: [Bot]
                    , _slackCacheVersion  :: Text
                    } deriving Show

instance FromJSON SlackSession where
  parseJSON = withObject "SlackSession" (\o ->
    SlackSession
      <$> o .: "self"
      <*> o .: "team"
      <*> o .: "users"
      <*> o .: "latest_event_ts"
      <*> o .: "channels"
      <*> o .: "groups"
      <*> o .: "ims"
      <*> o .: "bots"
      <*> o .: "cache_version")

makeLenses ''SlackSession
