module Web.Slack.Types.Session where

import Control.Lens.TH
import Data.Aeson
import Data.Text (Text)

import Web.Slack.Types.Bot
import Web.Slack.Types.Channel
import Web.Slack.Types.Group
import Web.Slack.Types.IM
import Web.Slack.Types.Self
import Web.Slack.Types.Team
import Web.Slack.Types.Time
import Web.Slack.Types.User


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
