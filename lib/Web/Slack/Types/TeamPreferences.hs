module Web.Slack.Types.TeamPreferences where

import Control.Lens.TH
import Data.Aeson.TH
import Data.Text (Text)

import Web.Slack.Types.Id
import Web.Slack.Utils


data TeamPreferences = TeamPreferences
                       { _teamDefaultChannels        :: [ChannelId]
                       , _teamMsgEditWindowMins      :: Int
                       , _teamAllowMessageDeletion   :: Bool
                       , _teamHideReferers           :: Bool
                       , _teamDisplayRealNames       :: Bool
                       , _teamWhoCanAtEveryone       :: Text
                       , _teamWhoCanAtChannel        :: Text
                       , _teamWhoCanCreateChannels   :: Text
                       , _teamWhoCanArchiveChannels  :: Text
                       , _teamWhoCanCreateGroups     :: Text
                       , _teamWhoCanPostGeneral      :: Text
                       , _teamWhoCanKickChannels     :: Text
                       , _teamWhoCanKickGroups       :: Text
                       , _teamRetentionType          :: Int
                       , _teamRetentionDuration      :: Int
                       , _teamGroupRetentionType     :: Int
                       , _teamGroupRetentionDuration :: Int
                       , _teamDmRetentionType        :: Int
                       , _teamDmRetentionDuration    :: Int
                       } deriving Show


$(deriveJSON defaultOptions {fieldLabelModifier = toSnake . drop 5} ''TeamPreferences)

makeLenses ''TeamPreferences
