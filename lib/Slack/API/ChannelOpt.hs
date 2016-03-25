module Slack.API.ChannelOpt where

import Data.Aeson
import Control.Lens.TH
import Slack.API.Event
import Slack.API.Time


data ChannelOpt = ChannelOpt
                  { _channelOptLastRead    :: SlackTimeStamp
                  , _channelOptUnreadCount :: Int
                  , _channelOptLatest      :: Event
                  } deriving (Show)

makeLenses ''ChannelOpt

instance FromJSON ChannelOpt where
  parseJSON = withObject "ChannelOpt" (\o ->
    ChannelOpt
      <$> o .: "last_read"
      <*> o .: "unread_count"
      <*> o .: "latest")
