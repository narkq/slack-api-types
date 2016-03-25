module Slack.API.Group where

-- | https://api.slack.com/types/group

import Control.Lens.TH
import Data.Aeson
import Data.Aeson.Types
import Data.Text (Text)

import Slack.API.Id
import Slack.API.Time
import Slack.API.Topic
import {-# SOURCE #-} Slack.API.ChannelOpt (ChannelOpt)


data Group = Group
             { _groupId         :: GroupId
             , _groupName       :: Text
             , _groupCreated    :: Time
             , _groupCreator    :: UserId
             , _groupIsArchived :: Bool
             , _groupIsOpen     :: Bool
             , _groupMembers    :: [UserId]
             , _groupTopic      :: Topic
             , _groupPurpose    :: Purpose
             , _groupOpt        :: Maybe ChannelOpt
             , _groupIsGroup    :: Bool
             } deriving (Show)

makeLenses ''Group

instance FromJSON Group where
  parseJSON = withObject "Group" (\o ->
    Group
      <$> o .: "id"
      <*> o .: "name"
      <*> o .: "created"
      <*> o .: "creator"
      <*> o .: "is_archived"
      <*> o .: "is_open"
      <*> o .: "members"
      <*> o .: "topic"
      <*> o .: "purpose"
      <*> (pure $ parseMaybe parseJSON (Object o) :: Parser (Maybe ChannelOpt))
      <*> o .: "is_group")
