{-# LANGUAGE ScopedTypeVariables #-}
module Slack.API.ReactionItem where

import Data.Aeson

import Slack.API.Id (FileId, CommentId, ChannelId)
import Slack.API.Time (SlackTimeStamp)

data ReactionItem = ReactionMessageItem ChannelId SlackTimeStamp
          | ReactionFileItem FileId
          | ReactionFileCommentItem FileId CommentId
          deriving Show

instance FromJSON ReactionItem where
  parseJSON = withObject "item" (\o -> do
    (typ :: String) <- o .: "type"
    case typ of
      "file_comment" -> ReactionFileCommentItem <$> o .: "file" <*> o .: "file_comment"
      "message"      -> ReactionMessageItem <$> o .: "channel" <*> o .: "ts"
      "file"         -> ReactionFileItem <$> o .: "file"
      _              -> fail $ "Unrecognised item type: " ++ typ)
