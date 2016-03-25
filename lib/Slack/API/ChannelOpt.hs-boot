module Slack.API.ChannelOpt (ChannelOpt) where

import Data.Aeson

data ChannelOpt

instance FromJSON ChannelOpt

instance Show ChannelOpt
