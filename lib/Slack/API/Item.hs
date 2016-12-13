{-# LANGUAGE ScopedTypeVariables #-}
module Slack.API.Item where

import Control.Lens.TH
import Data.Aeson
import Data.Text (Text)

import Slack.API.Comment
import Slack.API.File
import Slack.API.Id
import Slack.API.Time
import Slack.API.Base


data Item = MessageItem ChannelId (Maybe MessageUpdate)
          | FileItem File
          | FileCommentItem File Comment
          | ChannelItem ChannelId
          | IMItem ChannelId
          | GroupItem GroupId
          deriving Show

instance  FromJSON Item where
  parseJSON = withObject "item" (\o -> do
    (typ :: String) <- o .: "type"
    case typ of
      "file_comment" -> FileCommentItem <$> o .: "file" <*> o .: "comment"
      "message"      -> MessageItem <$> o .: "channel" <*> o .: "message"
      "file"         -> FileItem <$> o .: "file"
      "channel"      -> ChannelItem <$> o .: "channel"
      "im"           -> IMItem <$> o .: "channel"
      "group"        -> GroupItem <$> o .: "group"
      _              -> fail $ "Unrecognised item type: " ++ typ)

data MessageUpdate = MessageUpdate
                     { _messageUpdateUser   :: UserId
                     , _messageUpdateText   :: Text
                     , _messageUpdateTime   :: SlackTimeStamp
                     , _messageUpdateEdited :: Maybe Edited
                     , _messagePermalink    :: Maybe URL
                     } deriving Show


instance FromJSON MessageUpdate where
  parseJSON = withObject "MessageUpdate" (\o ->
    MessageUpdate
      <$> o .: "user"
      <*> o .: "text"
      <*> o .: "ts"
      <*> o .:? "edited"
      <*> o .:? "permalink")

data Edited = Edited
              { _editedUser   :: UserId
              , _editTimestap :: SlackTimeStamp
              } deriving Show

makeLenses ''MessageUpdate
makeLenses ''Edited

instance FromJSON Edited where
  parseJSON = withObject "Edited" (\o ->
    Edited
      <$> o .: "user"
      <*> o .: "ts")
