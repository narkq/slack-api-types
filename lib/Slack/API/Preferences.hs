module Slack.API.Preferences where

import Control.Lens.TH
import Data.Aeson.TH
import Data.Text (Text)

import Slack.API.Internal


data Preferences = Preferences
                   { _prefHighlightWords                  :: Text
                   , _prefUserColors                      :: Text
                   , _prefColorNamesInList                :: Bool
                   , _prefGrowlsEnabled                   :: Bool
                   , _prefTimezone                        :: Maybe Text
                   , _prefPushDmAlert                     :: Bool
                   , _prefPushMentionAlert                :: Bool
                   , _prefPushEverything                  :: Bool
                   , _prefPushIdleWait                    :: Int
                   , _prefPushSound                       :: Text
                   , _prefPushLoudChannels                :: Text
                   , _prefPushLoudChannelsSet             :: Text
                   , _prefEmailAlerts                     :: Text
                   , _prefEmailAlertsSleepUntil           :: Int
                   , _prefEmailMisc                       :: Bool
                   , _prefEmailWeekly                     :: Bool
                   , _prefWelcomeMessageHidden            :: Bool
                   , _prefAllChannelsLoud                 :: Bool
                   , _prefLoudChannels                    :: Text
                   , _prefNeverChannels                   :: Text
                   , _prefLoudChannelsSet                 :: Text
                   , _prefSearchSort                      :: Text
                   , _prefExpandInlineImgs                :: Bool
                   , _prefExpandSnippets                  :: Bool
                   , _prefPostsFormattingGuide            :: Bool
                   , _prefSeenWelcome2                    :: Bool
                   , _prefSeenSsbPrompt                   :: Bool
                   , _prefSearchOnlyMyChannels            :: Bool
                   , _prefEmojiMode                       :: Text
                   , _prefHasInvited                      :: Bool
                   , _prefHasUploaded                     :: Bool
                   , _prefHasCreatedChannel               :: Bool
                   , _prefSearchExcludeChannels           :: Text
                   , _prefMessagesTheme                   :: Text
                   , _prefWebappSpellcheck                :: Bool
                   , _prefNoJoinedOverlays                :: Bool
                   , _prefNoCreatedOverlays               :: Bool
                   , _prefDropboxEnabled                  :: Bool
                   , _prefSeenDomainInviteReminder        :: Bool
                   , _prefSeenMemberInviteReminder        :: Bool
                   , _prefMuteSounds                      :: Bool
                   , _prefArrowHistory                    :: Bool
                   , _prefTabUiReturnSelects              :: Bool
                   , _prefObeyInlineImgLimit              :: Bool
                   , _prefNewMsgSnd                       :: Text
                   , _prefCollapsible                     :: Bool
                   , _prefCollapsibleByClick              :: Bool
                   , _prefRequireAt                       :: Bool
                   , _prefExpandNonMediaAttachments       :: Bool
                   , _prefShowTyping                      :: Bool
                   , _prefPagekeysHandled                 :: Bool
                   , _prefLastSnippetType                 :: Text
                   , _prefDisplayRealNamesOverride        :: Int
                   , _prefTime24                          :: Bool
                   , _prefEnterIsSpecialInTbt             :: Bool
                   , _prefGraphicEmoticons                :: Bool
                   , _prefConvertEmoticons                :: Bool
                   , _prefAutoplayChatSounds              :: Bool
                   , _prefSsEmojis                        :: Bool
                   , _prefSidebarBehavior                 :: Text
                   , _prefMarkMsgsReadImmediately         :: Bool
                   , _prefStartScrollAtOldest             :: Bool
                   , _prefSnippetEditorWrapLongLines      :: Bool
                   , _prefLsDisabled                      :: Bool
                   , _prefSidebarTheme                    :: Text
                   , _prefSidebarThemeCustomValues        :: Text
                   , _prefFKeySearch                      :: Bool
                   , _prefKKeyOmnibox                     :: Bool
                   , _prefSpeakGrowls                     :: Bool
                   , _prefMacSpeakVoice                   :: Text
                   , _prefMacSpeakSpeed                   :: Int
                   , _prefPushAtChannelSuppressedChannels :: Text
                   , _prefPromptedForEmailDisabling       :: Bool
                   , _prefFullTextExtracts                :: Bool
                   , _prefNoTextInNotifications           :: Bool
                   , _prefMutedChannels                   :: Text
                   , _prefPrivacyPolicySeen               :: Bool
                   , _prefSearchExcludeBots               :: Bool
                   } deriving Show

$(let dropPref :: String -> String
      dropPref "_prefTime24" = "time24"
      dropPref s = toSnake $ drop 5 s
  in deriveJSON defaultOptions {fieldLabelModifier = dropPref} ''Preferences)

makeLenses ''Preferences
