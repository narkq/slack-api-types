module Slack.API.Comment where

import Data.Aeson
import Control.Lens.TH
import Data.Text (Text)

import Slack.API.Id
import Slack.API.Time

data Comment = Comment
               { _commentId        :: CommentId
               , _commentTimestamp :: Time
               , _commentUser      :: UserId
               , _commentComment   :: Text
               } deriving (Show)

makeLenses ''Comment

instance FromJSON Comment where
  parseJSON = withObject "comment" (\o ->
    Comment
      <$> o .: "id"
      <*> o .: "timestamp"
      <*> o .: "user"
      <*> o .: "comment")
