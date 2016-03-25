module Slack.API.Bot where

import Data.Aeson
import Control.Lens.TH
import Data.Text (Text)

import Slack.API.Id
import Slack.API.Base

data Bot = Bot
           { _botId    :: BotId
           , _botName  :: Text
           , _botIcons :: Maybe BotIcons
           } deriving (Show)


data BotIcons = BotIcons
                { _botIconImage48 :: Maybe URL
                } deriving (Show)

makeLenses ''Bot
makeLenses ''BotIcons


instance FromJSON BotIcons where
  parseJSON = withObject "icons" (\v ->
                BotIcons <$> v .:? "image_48")

instance FromJSON Bot where
  parseJSON = withObject "bot" (\v ->
    Bot
      <$> v .: "id"
      <*> v .: "name"
      <*> v .:? "icons")
