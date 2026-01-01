// AUTO-GENERATED FILE - DO NOT MODIFY
// Generated from td_api.tl on 2026-01-01

import 'td_base.dart';
import 'td_objects.dart';

/// Accepts an incoming call @call_id Call identifier @protocol The call protocols supported by the appl...
class TdAcceptCall extends TdObject {
  final int callId;
  final TdCallProtocol? protocol;

  TdAcceptCall({
    required this.callId,
    this.protocol,
  });

  @override
  String get tdType => 'acceptCall';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'acceptCall',
      'call_id': callId,
      'protocol': protocol?.toMap(),
    };
  }
}


/// Accepts Telegram terms of services @terms_of_service_id Terms of service identifier
class TdAcceptTermsOfService extends TdObject {
  final String termsOfServiceId;

  TdAcceptTermsOfService({
    required this.termsOfServiceId,
  });

  @override
  String get tdType => 'acceptTermsOfService';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'acceptTermsOfService',
      'terms_of_service_id': termsOfServiceId,
    };
  }
}


/// Activates stealth mode for stories, which hides all views of stories from the current user in the la...
class TdActivateStoryStealthMode extends TdObject {
  TdActivateStoryStealthMode();

  @override
  String get tdType => 'activateStoryStealthMode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'activateStoryStealthMode',
    };
  }
}


/// Adds a new media preview to the beginning of the list of media previews of a bot. Returns the added ...
class TdAddBotMediaPreview extends TdObject {
  final int botUserId;
  final String languageCode;
  final TdInputStoryContent? content;

  TdAddBotMediaPreview({
    required this.botUserId,
    required this.languageCode,
    this.content,
  });

  @override
  String get tdType => 'addBotMediaPreview';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addBotMediaPreview',
      'bot_user_id': botUserId,
      'language_code': languageCode,
      'content': content?.toMap(),
    };
  }
}


/// Adds a chat folder by an invite link @invite_link Invite link for the chat folder @chat_ids Identifi...
class TdAddChatFolderByInviteLink extends TdObject {
  final String inviteLink;
  final List<int> chatIds;

  TdAddChatFolderByInviteLink({
    required this.inviteLink,
    required this.chatIds,
  });

  @override
  String get tdType => 'addChatFolderByInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addChatFolderByInviteLink',
      'invite_link': inviteLink,
      'chat_ids': chatIds,
    };
  }
}


/// Adds a new member to a chat; requires can_invite_users member right. Members can\'t be added to priva...
class TdAddChatMember extends TdObject {
  final int chatId;
  final int userId;
  final int forwardLimit;

  TdAddChatMember({
    required this.chatId,
    required this.userId,
    required this.forwardLimit,
  });

  @override
  String get tdType => 'addChatMember';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addChatMember',
      'chat_id': chatId,
      'user_id': userId,
      'forward_limit': forwardLimit,
    };
  }
}


/// Adds multiple new members to a chat; requires can_invite_users member right. Currently, this method ...
class TdAddChatMembers extends TdObject {
  final int chatId;
  final List<int> userIds;

  TdAddChatMembers({
    required this.chatId,
    required this.userIds,
  });

  @override
  String get tdType => 'addChatMembers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addChatMembers',
      'chat_id': chatId,
      'user_ids': userIds,
    };
  }
}


/// Adds a chat to a chat list. A chat can\'t be simultaneously in Main and Archive chat lists, so it is ...
class TdAddChatToList extends TdObject {
  final int chatId;
  final TdChatList? chatList;

  TdAddChatToList({
    required this.chatId,
    this.chatList,
  });

  @override
  String get tdType => 'addChatToList';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addChatToList',
      'chat_id': chatId,
      'chat_list': chatList?.toMap(),
    };
  }
}


/// Adds tasks to a checklist in a message
class TdAddChecklistTasks extends TdObject {
  final int chatId;
  final int messageId;
  final List<TdInputChecklistTask> tasks;

  TdAddChecklistTasks({
    required this.chatId,
    required this.messageId,
    required this.tasks,
  });

  @override
  String get tdType => 'addChecklistTasks';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addChecklistTasks',
      'chat_id': chatId,
      'message_id': messageId,
      'tasks': tasks.map((e) => e.toMap()).toList(),
    };
  }
}


/// Adds a user to the contact list or edits an existing contact by their user identifier Use the field ...
class TdAddContact extends TdObject {
  final int userId;
  final TdImportedContact? contact;
  final bool sharePhoneNumber;

  TdAddContact({
    required this.userId,
    this.contact,
    required this.sharePhoneNumber,
  });

  @override
  String get tdType => 'addContact';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addContact',
      'user_id': userId,
      'contact': contact?.toMap(),
      'share_phone_number': sharePhoneNumber,
    };
  }
}


/// Adds a custom server language pack to the list of installed language packs in current localization t...
class TdAddCustomServerLanguagePack extends TdObject {
  final String languagePackId;

  TdAddCustomServerLanguagePack({
    required this.languagePackId,
  });

  @override
  String get tdType => 'addCustomServerLanguagePack';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addCustomServerLanguagePack',
      'language_pack_id': languagePackId,
    };
  }
}


/// Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list...
class TdAddFavoriteSticker extends TdObject {
  final TdInputFile? sticker;

  TdAddFavoriteSticker({
    this.sticker,
  });

  @override
  String get tdType => 'addFavoriteSticker';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addFavoriteSticker',
      'sticker': sticker?.toMap(),
    };
  }
}


/// Adds a file from a message to the list of file downloads. Download progress and completion of the do...
class TdAddFileToDownloads extends TdObject {
  final int fileId;
  final int chatId;
  final int messageId;
  final int priority;

  TdAddFileToDownloads({
    required this.fileId,
    required this.chatId,
    required this.messageId,
    required this.priority,
  });

  @override
  String get tdType => 'addFileToDownloads';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addFileToDownloads',
      'file_id': fileId,
      'chat_id': chatId,
      'message_id': messageId,
      'priority': priority,
    };
  }
}


/// Adds gifts to the beginning of a previously created collection. If the collection is owned by a chan...
class TdAddGiftCollectionGifts extends TdObject {
  final TdMessageSender? ownerId;
  final int collectionId;
  final List<String> receivedGiftIds;

  TdAddGiftCollectionGifts({
    this.ownerId,
    required this.collectionId,
    required this.receivedGiftIds,
  });

  @override
  String get tdType => 'addGiftCollectionGifts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addGiftCollectionGifts',
      'owner_id': ownerId?.toMap(),
      'collection_id': collectionId,
      'received_gift_ids': receivedGiftIds,
    };
  }
}


/// Adds a local message to a chat. The message is persistent across application restarts only if the me...
class TdAddLocalMessage extends TdObject {
  final int chatId;
  final TdMessageSender? senderId;
  final TdInputMessageReplyTo? replyTo;
  final bool disableNotification;
  final TdInputMessageContent? inputMessageContent;

  TdAddLocalMessage({
    required this.chatId,
    this.senderId,
    this.replyTo,
    required this.disableNotification,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'addLocalMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addLocalMessage',
      'chat_id': chatId,
      'sender_id': senderId?.toMap(),
      'reply_to': replyTo?.toMap(),
      'disable_notification': disableNotification,
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Adds a message to TDLib internal log. Can be called synchronously
class TdAddLogMessage extends TdObject {
  final int verbosityLevel;
  final String text;

  TdAddLogMessage({
    required this.verbosityLevel,
    required this.text,
  });

  @override
  String get tdType => 'addLogMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addLogMessage',
      'verbosity_level': verbosityLevel,
      'text': text,
    };
  }
}


/// Adds a passkey allowed to be used for the login by the current user and returns the added passkey. C...
class TdAddLoginPasskey extends TdObject {
  final String clientData;
  final String attestationObject;

  TdAddLoginPasskey({
    required this.clientData,
    required this.attestationObject,
  });

  @override
  String get tdType => 'addLoginPasskey';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addLoginPasskey',
      'client_data': clientData,
      'attestation_object': attestationObject,
    };
  }
}


/// Adds a reaction or a tag to a message. Use getMessageAvailableReactions to receive the list of avail...
class TdAddMessageReaction extends TdObject {
  final int chatId;
  final int messageId;
  final TdReactionType? reactionType;
  final bool isBig;
  final bool updateRecentReactions;

  TdAddMessageReaction({
    required this.chatId,
    required this.messageId,
    this.reactionType,
    required this.isBig,
    required this.updateRecentReactions,
  });

  @override
  String get tdType => 'addMessageReaction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addMessageReaction',
      'chat_id': chatId,
      'message_id': messageId,
      'reaction_type': reactionType?.toMap(),
      'is_big': isBig,
      'update_recent_reactions': updateRecentReactions,
    };
  }
}


/// Adds the specified data to data usage statistics. Can be called before authorization @entry The netw...
class TdAddNetworkStatistics extends TdObject {
  final TdNetworkStatisticsEntry? entry;

  TdAddNetworkStatistics({
    this.entry,
  });

  @override
  String get tdType => 'addNetworkStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addNetworkStatistics',
      'entry': entry?.toMap(),
    };
  }
}


/// Sends a suggested post based on a previously sent message in a channel direct messages chat. Can be ...
class TdAddOffer extends TdObject {
  final int chatId;
  final int messageId;
  final TdMessageSendOptions? options;

  TdAddOffer({
    required this.chatId,
    required this.messageId,
    this.options,
  });

  @override
  String get tdType => 'addOffer';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addOffer',
      'chat_id': chatId,
      'message_id': messageId,
      'options': options?.toMap(),
    };
  }
}


/// Adds pending paid reaction in a live story group call. Can\'t be used in live stories posted by the c...
class TdAddPendingLiveStoryReaction extends TdObject {
  final int groupCallId;
  final int starCount;

  TdAddPendingLiveStoryReaction({
    required this.groupCallId,
    required this.starCount,
  });

  @override
  String get tdType => 'addPendingLiveStoryReaction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addPendingLiveStoryReaction',
      'group_call_id': groupCallId,
      'star_count': starCount,
    };
  }
}


/// Adds the paid message reaction to a message. Use getMessageAvailableReactions to check whether the r...
class TdAddPendingPaidMessageReaction extends TdObject {
  final int chatId;
  final int messageId;
  final int starCount;
  final TdPaidReactionType? type;

  TdAddPendingPaidMessageReaction({
    required this.chatId,
    required this.messageId,
    required this.starCount,
    this.type,
  });

  @override
  String get tdType => 'addPendingPaidMessageReaction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addPendingPaidMessageReaction',
      'chat_id': chatId,
      'message_id': messageId,
      'star_count': starCount,
      'type': type?.toMap(),
    };
  }
}


/// Adds an audio file to the beginning of the profile audio files of the current user
class TdAddProfileAudio extends TdObject {
  final int fileId;

  TdAddProfileAudio({
    required this.fileId,
  });

  @override
  String get tdType => 'addProfileAudio';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addProfileAudio',
      'file_id': fileId,
    };
  }
}


/// Adds a proxy server for network requests. Can be called before authorization
class TdAddProxy extends TdObject {
  final String server;
  final int port;
  final bool enable;
  final TdProxyType? type;

  TdAddProxy({
    required this.server,
    required this.port,
    required this.enable,
    this.type,
  });

  @override
  String get tdType => 'addProxy';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addProxy',
      'server': server,
      'port': port,
      'enable': enable,
      'type': type?.toMap(),
    };
  }
}


/// Adds a message to a quick reply shortcut via inline bot. If shortcut doesn\'t exist and there are les...
class TdAddQuickReplyShortcutInlineQueryResultMessage extends TdObject {
  final String shortcutName;
  final int replyToMessageId;
  final int queryId;
  final String resultId;
  final bool hideViaBot;

  TdAddQuickReplyShortcutInlineQueryResultMessage({
    required this.shortcutName,
    required this.replyToMessageId,
    required this.queryId,
    required this.resultId,
    required this.hideViaBot,
  });

  @override
  String get tdType => 'addQuickReplyShortcutInlineQueryResultMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addQuickReplyShortcutInlineQueryResultMessage',
      'shortcut_name': shortcutName,
      'reply_to_message_id': replyToMessageId,
      'query_id': queryId,
      'result_id': resultId,
      'hide_via_bot': hideViaBot,
    };
  }
}


/// Adds a message to a quick reply shortcut. If shortcut doesn\'t exist and there are less than getOptio...
class TdAddQuickReplyShortcutMessage extends TdObject {
  final String shortcutName;
  final int replyToMessageId;
  final TdInputMessageContent? inputMessageContent;

  TdAddQuickReplyShortcutMessage({
    required this.shortcutName,
    required this.replyToMessageId,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'addQuickReplyShortcutMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addQuickReplyShortcutMessage',
      'shortcut_name': shortcutName,
      'reply_to_message_id': replyToMessageId,
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Adds 2-10 messages grouped together into an album to a quick reply shortcut. Currently, only audio, ...
class TdAddQuickReplyShortcutMessageAlbum extends TdObject {
  final String shortcutName;
  final int replyToMessageId;
  final List<TdInputMessageContent> inputMessageContents;

  TdAddQuickReplyShortcutMessageAlbum({
    required this.shortcutName,
    required this.replyToMessageId,
    required this.inputMessageContents,
  });

  @override
  String get tdType => 'addQuickReplyShortcutMessageAlbum';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addQuickReplyShortcutMessageAlbum',
      'shortcut_name': shortcutName,
      'reply_to_message_id': replyToMessageId,
      'input_message_contents': inputMessageContents.map((e) => e.toMap()).toList(),
    };
  }
}


/// Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the t...
class TdAddRecentSticker extends TdObject {
  final bool isAttached;
  final TdInputFile? sticker;

  TdAddRecentSticker({
    required this.isAttached,
    this.sticker,
  });

  @override
  String get tdType => 'addRecentSticker';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addRecentSticker',
      'is_attached': isAttached,
      'sticker': sticker?.toMap(),
    };
  }
}


/// Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If ...
class TdAddRecentlyFoundChat extends TdObject {
  final int chatId;

  TdAddRecentlyFoundChat({
    required this.chatId,
  });

  @override
  String get tdType => 'addRecentlyFoundChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addRecentlyFoundChat',
      'chat_id': chatId,
    };
  }
}


/// Manually adds a new animation to the list of saved animations. The new animation is added to the beg...
class TdAddSavedAnimation extends TdObject {
  final TdInputFile? animation;

  TdAddSavedAnimation({
    this.animation,
  });

  @override
  String get tdType => 'addSavedAnimation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addSavedAnimation',
      'animation': animation?.toMap(),
    };
  }
}


/// Adds a new notification sound to the list of saved notification sounds. The new notification sound i...
class TdAddSavedNotificationSound extends TdObject {
  final TdInputFile? sound;

  TdAddSavedNotificationSound({
    this.sound,
  });

  @override
  String get tdType => 'addSavedNotificationSound';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addSavedNotificationSound',
      'sound': sound?.toMap(),
    };
  }
}


/// Adds a new sticker to a set
class TdAddStickerToSet extends TdObject {
  final int userId;
  final String name;
  final TdInputSticker? sticker;

  TdAddStickerToSet({
    required this.userId,
    required this.name,
    this.sticker,
  });

  @override
  String get tdType => 'addStickerToSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addStickerToSet',
      'user_id': userId,
      'name': name,
      'sticker': sticker?.toMap(),
    };
  }
}


/// Adds stories to the beginning of a previously created story album. If the album is owned by a superg...
class TdAddStoryAlbumStories extends TdObject {
  final int chatId;
  final int storyAlbumId;
  final List<int> storyIds;

  TdAddStoryAlbumStories({
    required this.chatId,
    required this.storyAlbumId,
    required this.storyIds,
  });

  @override
  String get tdType => 'addStoryAlbumStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'addStoryAlbumStories',
      'chat_id': chatId,
      'story_album_id': storyAlbumId,
      'story_ids': storyIds,
    };
  }
}


/// Allows the specified bot to send messages to the user @bot_user_id Identifier of the target bot
class TdAllowBotToSendMessages extends TdObject {
  final int botUserId;

  TdAllowBotToSendMessages({
    required this.botUserId,
  });

  @override
  String get tdType => 'allowBotToSendMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'allowBotToSendMessages',
      'bot_user_id': botUserId,
    };
  }
}


/// Allows the specified user to send unpaid private messages to the current user by adding a rule to us...
class TdAllowUnpaidMessagesFromUser extends TdObject {
  final int userId;
  final bool refundPayments;

  TdAllowUnpaidMessagesFromUser({
    required this.userId,
    required this.refundPayments,
  });

  @override
  String get tdType => 'allowUnpaidMessagesFromUser';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'allowUnpaidMessagesFromUser',
      'user_id': userId,
      'refund_payments': refundPayments,
    };
  }
}


/// Sets the result of a callback query; for bots only
class TdAnswerCallbackQuery extends TdObject {
  final int callbackQueryId;
  final String text;
  final bool showAlert;
  final String url;
  final int cacheTime;

  TdAnswerCallbackQuery({
    required this.callbackQueryId,
    required this.text,
    required this.showAlert,
    required this.url,
    required this.cacheTime,
  });

  @override
  String get tdType => 'answerCallbackQuery';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'answerCallbackQuery',
      'callback_query_id': callbackQueryId,
      'text': text,
      'show_alert': showAlert,
      'url': url,
      'cache_time': cacheTime,
    };
  }
}


/// Answers a custom query; for bots only @custom_query_id Identifier of a custom query @data JSON-seria...
class TdAnswerCustomQuery extends TdObject {
  final int customQueryId;
  final String data;

  TdAnswerCustomQuery({
    required this.customQueryId,
    required this.data,
  });

  @override
  String get tdType => 'answerCustomQuery';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'answerCustomQuery',
      'custom_query_id': customQueryId,
      'data': data,
    };
  }
}


/// Sets the result of an inline query; for bots only
class TdAnswerInlineQuery extends TdObject {
  final int inlineQueryId;
  final bool isPersonal;
  final TdInlineQueryResultsButton? button;
  final List<TdInputInlineQueryResult> results;
  final int cacheTime;
  final String nextOffset;

  TdAnswerInlineQuery({
    required this.inlineQueryId,
    required this.isPersonal,
    this.button,
    required this.results,
    required this.cacheTime,
    required this.nextOffset,
  });

  @override
  String get tdType => 'answerInlineQuery';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'answerInlineQuery',
      'inline_query_id': inlineQueryId,
      'is_personal': isPersonal,
      'button': button?.toMap(),
      'results': results.map((e) => e.toMap()).toList(),
      'cache_time': cacheTime,
      'next_offset': nextOffset,
    };
  }
}


/// Sets the result of a pre-checkout query; for bots only @pre_checkout_query_id Identifier of the pre-...
class TdAnswerPreCheckoutQuery extends TdObject {
  final int preCheckoutQueryId;
  final String errorMessage;

  TdAnswerPreCheckoutQuery({
    required this.preCheckoutQueryId,
    required this.errorMessage,
  });

  @override
  String get tdType => 'answerPreCheckoutQuery';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'answerPreCheckoutQuery',
      'pre_checkout_query_id': preCheckoutQueryId,
      'error_message': errorMessage,
    };
  }
}


/// Sets the result of a shipping query; for bots only @shipping_query_id Identifier of the shipping que...
class TdAnswerShippingQuery extends TdObject {
  final int shippingQueryId;
  final List<TdShippingOption> shippingOptions;
  final String errorMessage;

  TdAnswerShippingQuery({
    required this.shippingQueryId,
    required this.shippingOptions,
    required this.errorMessage,
  });

  @override
  String get tdType => 'answerShippingQuery';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'answerShippingQuery',
      'shipping_query_id': shippingQueryId,
      'shipping_options': shippingOptions.map((e) => e.toMap()).toList(),
      'error_message': errorMessage,
    };
  }
}


/// Sets the result of interaction with a Web App and sends corresponding message on behalf of the user ...
class TdAnswerWebAppQuery extends TdObject {
  final String webAppQueryId;
  final TdInputInlineQueryResult? result;

  TdAnswerWebAppQuery({
    required this.webAppQueryId,
    this.result,
  });

  @override
  String get tdType => 'answerWebAppQuery';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'answerWebAppQuery',
      'web_app_query_id': webAppQueryId,
      'result': result?.toMap(),
    };
  }
}


/// Applies a Telegram Premium gift code @code The code to apply
class TdApplyPremiumGiftCode extends TdObject {
  final String code;

  TdApplyPremiumGiftCode({
    required this.code,
  });

  @override
  String get tdType => 'applyPremiumGiftCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'applyPremiumGiftCode',
      'code': code,
    };
  }
}


/// Approves a suggested post in a channel direct messages chat then the date must be in the future, but...
class TdApproveSuggestedPost extends TdObject {
  final int chatId;
  final int messageId;
  final int sendDate;

  TdApproveSuggestedPost({
    required this.chatId,
    required this.messageId,
    required this.sendDate,
  });

  @override
  String get tdType => 'approveSuggestedPost';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'approveSuggestedPost',
      'chat_id': chatId,
      'message_id': messageId,
      'send_date': sendDate,
    };
  }
}


/// Informs server about an in-store purchase. For official applications only @transaction Information a...
class TdAssignStoreTransaction extends TdObject {
  final TdStoreTransaction? transaction;
  final TdStorePaymentPurpose? purpose;

  TdAssignStoreTransaction({
    this.transaction,
    this.purpose,
  });

  @override
  String get tdType => 'assignStoreTransaction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'assignStoreTransaction',
      'transaction': transaction?.toMap(),
      'purpose': purpose?.toMap(),
    };
  }
}


/// Bans a member in a chat; requires can_restrict_members administrator right. Members can\'t be banned ...
class TdBanChatMember extends TdObject {
  final int chatId;
  final TdMessageSender? memberId;
  final int bannedUntilDate;
  final bool revokeMessages;

  TdBanChatMember({
    required this.chatId,
    this.memberId,
    required this.bannedUntilDate,
    required this.revokeMessages,
  });

  @override
  String get tdType => 'banChatMember';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'banChatMember',
      'chat_id': chatId,
      'member_id': memberId?.toMap(),
      'banned_until_date': bannedUntilDate,
      'revoke_messages': revokeMessages,
    };
  }
}


/// Bans users from a group call not bound to a chat; requires groupCall.is_owned. Only the owner of the...
class TdBanGroupCallParticipants extends TdObject {
  final int groupCallId;
  final List<int> userIds;

  TdBanGroupCallParticipants({
    required this.groupCallId,
    required this.userIds,
  });

  @override
  String get tdType => 'banGroupCallParticipants';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'banGroupCallParticipants',
      'group_call_id': groupCallId,
      'user_ids': userIds,
    };
  }
}


/// Blocks an original sender of a message in the Replies chat
class TdBlockMessageSenderFromReplies extends TdObject {
  final int messageId;
  final bool deleteMessage;
  final bool deleteAllMessages;
  final bool reportSpam;

  TdBlockMessageSenderFromReplies({
    required this.messageId,
    required this.deleteMessage,
    required this.deleteAllMessages,
    required this.reportSpam,
  });

  @override
  String get tdType => 'blockMessageSenderFromReplies';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'blockMessageSenderFromReplies',
      'message_id': messageId,
      'delete_message': deleteMessage,
      'delete_all_messages': deleteAllMessages,
      'report_spam': reportSpam,
    };
  }
}


/// Boosts a chat and returns the list of available chat boost slots for the current user after the boos...
class TdBoostChat extends TdObject {
  final int chatId;
  final List<int> slotIds;

  TdBoostChat({
    required this.chatId,
    required this.slotIds,
  });

  @override
  String get tdType => 'boostChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'boostChat',
      'chat_id': chatId,
      'slot_ids': slotIds,
    };
  }
}


/// Pays for upgrade of a regular gift that is owned by another user or channel chat
class TdBuyGiftUpgrade extends TdObject {
  final TdMessageSender? ownerId;
  final String prepaidUpgradeHash;
  final int starCount;

  TdBuyGiftUpgrade({
    this.ownerId,
    required this.prepaidUpgradeHash,
    required this.starCount,
  });

  @override
  String get tdType => 'buyGiftUpgrade';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'buyGiftUpgrade',
      'owner_id': ownerId?.toMap(),
      'prepaid_upgrade_hash': prepaidUpgradeHash,
      'star_count': starCount,
    };
  }
}


/// Checks whether the specified bot can send messages to the user. Returns a 404 error if can\'t and the...
class TdCanBotSendMessages extends TdObject {
  final int botUserId;

  TdCanBotSendMessages({
    required this.botUserId,
  });

  @override
  String get tdType => 'canBotSendMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'canBotSendMessages',
      'bot_user_id': botUserId,
    };
  }
}


/// Checks whether the current user can post a story on behalf of a chat; requires can_post_stories admi...
class TdCanPostStory extends TdObject {
  final int chatId;

  TdCanPostStory({
    required this.chatId,
  });

  @override
  String get tdType => 'canPostStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'canPostStory',
      'chat_id': chatId,
    };
  }
}


/// Checks whether an in-store purchase is possible. Must be called before any in-store purchase. For of...
class TdCanPurchaseFromStore extends TdObject {
  final TdStorePaymentPurpose? purpose;

  TdCanPurchaseFromStore({
    this.purpose,
  });

  @override
  String get tdType => 'canPurchaseFromStore';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'canPurchaseFromStore',
      'purpose': purpose?.toMap(),
    };
  }
}


/// Checks whether a gift with next_send_date in the future can be sent already
class TdCanSendGift extends TdObject {
  final int giftId;

  TdCanSendGift({
    required this.giftId,
  });

  @override
  String get tdType => 'canSendGift';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'canSendGift',
      'gift_id': giftId,
    };
  }
}


/// Checks whether the current user can message another user or try to create a chat with them
class TdCanSendMessageToUser extends TdObject {
  final int userId;
  final bool onlyLocal;

  TdCanSendMessageToUser({
    required this.userId,
    required this.onlyLocal,
  });

  @override
  String get tdType => 'canSendMessageToUser';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'canSendMessageToUser',
      'user_id': userId,
      'only_local': onlyLocal,
    };
  }
}


/// Checks whether the current session can be used to transfer a chat ownership to another user
class TdCanTransferOwnership extends TdObject {
  TdCanTransferOwnership();

  @override
  String get tdType => 'canTransferOwnership';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'canTransferOwnership',
    };
  }
}


/// Stops the downloading of a file. If a file has already been downloaded, does nothing @file_id Identi...
class TdCancelDownloadFile extends TdObject {
  final int fileId;
  final bool onlyIfPending;

  TdCancelDownloadFile({
    required this.fileId,
    required this.onlyIfPending,
  });

  @override
  String get tdType => 'cancelDownloadFile';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'cancelDownloadFile',
      'file_id': fileId,
      'only_if_pending': onlyIfPending,
    };
  }
}


/// Cancels reset of 2-step verification password. The method can be called if passwordState.pending_res...
class TdCancelPasswordReset extends TdObject {
  TdCancelPasswordReset();

  @override
  String get tdType => 'cancelPasswordReset';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'cancelPasswordReset',
    };
  }
}


/// Stops the preliminary uploading of a file. Supported only for files uploaded by using preliminaryUpl...
class TdCancelPreliminaryUploadFile extends TdObject {
  final int fileId;

  TdCancelPreliminaryUploadFile({
    required this.fileId,
  });

  @override
  String get tdType => 'cancelPreliminaryUploadFile';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'cancelPreliminaryUploadFile',
      'file_id': fileId,
    };
  }
}


/// Cancels verification of the 2-step verification recovery email address
class TdCancelRecoveryEmailAddressVerification extends TdObject {
  TdCancelRecoveryEmailAddressVerification();

  @override
  String get tdType => 'cancelRecoveryEmailAddressVerification';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'cancelRecoveryEmailAddressVerification',
    };
  }
}


/// Changes imported contacts using the list of contacts saved on the device. Imports newly added contac...
class TdChangeImportedContacts extends TdObject {
  final List<TdImportedContact> contacts;

  TdChangeImportedContacts({
    required this.contacts,
  });

  @override
  String get tdType => 'changeImportedContacts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'changeImportedContacts',
      'contacts': contacts.map((e) => e.toMap()).toList(),
    };
  }
}


/// Installs/uninstalls or activates/archives a sticker set @set_id Identifier of the sticker set @is_in...
class TdChangeStickerSet extends TdObject {
  final int setId;
  final bool isInstalled;
  final bool isArchived;

  TdChangeStickerSet({
    required this.setId,
    required this.isInstalled,
    required this.isArchived,
  });

  @override
  String get tdType => 'changeStickerSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'changeStickerSet',
      'set_id': setId,
      'is_installed': isInstalled,
      'is_archived': isArchived,
    };
  }
}


/// Checks the authentication token of a bot; to log in as a bot. Works only when the current authorizat...
class TdCheckAuthenticationBotToken extends TdObject {
  final String token;

  TdCheckAuthenticationBotToken({
    required this.token,
  });

  @override
  String get tdType => 'checkAuthenticationBotToken';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkAuthenticationBotToken',
      'token': token,
    };
  }
}


/// Checks the authentication code. Works only when the current authorization state is authorizationStat...
class TdCheckAuthenticationCode extends TdObject {
  final String code;

  TdCheckAuthenticationCode({
    required this.code,
  });

  @override
  String get tdType => 'checkAuthenticationCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkAuthenticationCode',
      'code': code,
    };
  }
}


/// Checks the authentication of an email address. Works only when the current authorization state is au...
class TdCheckAuthenticationEmailCode extends TdObject {
  final TdEmailAddressAuthentication? code;

  TdCheckAuthenticationEmailCode({
    this.code,
  });

  @override
  String get tdType => 'checkAuthenticationEmailCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkAuthenticationEmailCode',
      'code': code?.toMap(),
    };
  }
}


/// Checks a passkey to log in to the corresponding account. Call getAuthenticationPasskeyParameters to ...
class TdCheckAuthenticationPasskey extends TdObject {
  final String credentialId;
  final String clientData;
  final String authenticatorData;
  final String signature;
  final String userHandle;

  TdCheckAuthenticationPasskey({
    required this.credentialId,
    required this.clientData,
    required this.authenticatorData,
    required this.signature,
    required this.userHandle,
  });

  @override
  String get tdType => 'checkAuthenticationPasskey';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkAuthenticationPasskey',
      'credential_id': credentialId,
      'client_data': clientData,
      'authenticator_data': authenticatorData,
      'signature': signature,
      'user_handle': userHandle,
    };
  }
}


/// Checks the 2-step verification password for correctness. Works only when the current authorization s...
class TdCheckAuthenticationPassword extends TdObject {
  final String password;

  TdCheckAuthenticationPassword({
    required this.password,
  });

  @override
  String get tdType => 'checkAuthenticationPassword';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkAuthenticationPassword',
      'password': password,
    };
  }
}


/// Checks whether a 2-step verification password recovery code sent to an email address is valid. Works...
class TdCheckAuthenticationPasswordRecoveryCode extends TdObject {
  final String recoveryCode;

  TdCheckAuthenticationPasswordRecoveryCode({
    required this.recoveryCode,
  });

  @override
  String get tdType => 'checkAuthenticationPasswordRecoveryCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkAuthenticationPasswordRecoveryCode',
      'recovery_code': recoveryCode,
    };
  }
}


/// Checks whether an in-store purchase of Telegram Premium is possible before authorization. Works only...
class TdCheckAuthenticationPremiumPurchase extends TdObject {
  final String currency;
  final int amount;

  TdCheckAuthenticationPremiumPurchase({
    required this.currency,
    required this.amount,
  });

  @override
  String get tdType => 'checkAuthenticationPremiumPurchase';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkAuthenticationPremiumPurchase',
      'currency': currency,
      'amount': amount,
    };
  }
}


/// Checks the validity of an invite link for a chat folder and returns information about the correspond...
class TdCheckChatFolderInviteLink extends TdObject {
  final String inviteLink;

  TdCheckChatFolderInviteLink({
    required this.inviteLink,
  });

  @override
  String get tdType => 'checkChatFolderInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkChatFolderInviteLink',
      'invite_link': inviteLink,
    };
  }
}


/// Checks the validity of an invite link for a chat and returns information about the corresponding cha...
class TdCheckChatInviteLink extends TdObject {
  final String inviteLink;

  TdCheckChatInviteLink({
    required this.inviteLink,
  });

  @override
  String get tdType => 'checkChatInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkChatInviteLink',
      'invite_link': inviteLink,
    };
  }
}


/// Checks whether a username can be set for a chat @chat_id Chat identifier; must be identifier of a su...
class TdCheckChatUsername extends TdObject {
  final int chatId;
  final String username;

  TdCheckChatUsername({
    required this.chatId,
    required this.username,
  });

  @override
  String get tdType => 'checkChatUsername';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkChatUsername',
      'chat_id': chatId,
      'username': username,
    };
  }
}


/// Checks whether the maximum number of owned public chats has been reached. Returns corresponding erro...
class TdCheckCreatedPublicChatsLimit extends TdObject {
  final TdPublicChatType? type;

  TdCheckCreatedPublicChatsLimit({
    this.type,
  });

  @override
  String get tdType => 'checkCreatedPublicChatsLimit';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkCreatedPublicChatsLimit',
      'type': type?.toMap(),
    };
  }
}


/// Checks the email address verification code for Telegram Passport @code Verification code to check
class TdCheckEmailAddressVerificationCode extends TdObject {
  final String code;

  TdCheckEmailAddressVerificationCode({
    required this.code,
  });

  @override
  String get tdType => 'checkEmailAddressVerificationCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkEmailAddressVerificationCode',
      'code': code,
    };
  }
}


/// Checks the login email address authentication @code Email address authentication to check
class TdCheckLoginEmailAddressCode extends TdObject {
  final TdEmailAddressAuthentication? code;

  TdCheckLoginEmailAddressCode({
    this.code,
  });

  @override
  String get tdType => 'checkLoginEmailAddressCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkLoginEmailAddressCode',
      'code': code?.toMap(),
    };
  }
}


/// Checks whether a 2-step verification password recovery code sent to an email address is valid @recov...
class TdCheckPasswordRecoveryCode extends TdObject {
  final String recoveryCode;

  TdCheckPasswordRecoveryCode({
    required this.recoveryCode,
  });

  @override
  String get tdType => 'checkPasswordRecoveryCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkPasswordRecoveryCode',
      'recovery_code': recoveryCode,
    };
  }
}


/// Checks the authentication code and completes the request for which the code was sent if appropriate ...
class TdCheckPhoneNumberCode extends TdObject {
  final String code;

  TdCheckPhoneNumberCode({
    required this.code,
  });

  @override
  String get tdType => 'checkPhoneNumberCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkPhoneNumberCode',
      'code': code,
    };
  }
}


/// Returns information about a Telegram Premium gift code @code The code to check
class TdCheckPremiumGiftCode extends TdObject {
  final String code;

  TdCheckPremiumGiftCode({
    required this.code,
  });

  @override
  String get tdType => 'checkPremiumGiftCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkPremiumGiftCode',
      'code': code,
    };
  }
}


/// Checks validness of a name for a quick reply shortcut. Can be called synchronously @name The name of...
class TdCheckQuickReplyShortcutName extends TdObject {
  final String name;

  TdCheckQuickReplyShortcutName({
    required this.name,
  });

  @override
  String get tdType => 'checkQuickReplyShortcutName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkQuickReplyShortcutName',
      'name': name,
    };
  }
}


/// Checks the 2-step verification recovery email address verification code @code Verification code to c...
class TdCheckRecoveryEmailAddressCode extends TdObject {
  final String code;

  TdCheckRecoveryEmailAddressCode({
    required this.code,
  });

  @override
  String get tdType => 'checkRecoveryEmailAddressCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkRecoveryEmailAddressCode',
      'code': code,
    };
  }
}


/// Checks whether a name can be used for a new sticker set @name Name to be checked
class TdCheckStickerSetName extends TdObject {
  final String name;

  TdCheckStickerSetName({
    required this.name,
  });

  @override
  String get tdType => 'checkStickerSetName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkStickerSetName',
      'name': name,
    };
  }
}


/// Checks whether a file can be downloaded and saved locally by Web App request
class TdCheckWebAppFileDownload extends TdObject {
  final int botUserId;
  final String fileName;
  final String url;

  TdCheckWebAppFileDownload({
    required this.botUserId,
    required this.fileName,
    required this.url,
  });

  @override
  String get tdType => 'checkWebAppFileDownload';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'checkWebAppFileDownload',
      'bot_user_id': botUserId,
      'file_name': fileName,
      'url': url,
    };
  }
}


/// Removes potentially dangerous characters from the name of a file. Returns an empty string on failure...
class TdCleanFileName extends TdObject {
  final String fileName;

  TdCleanFileName({
    required this.fileName,
  });

  @override
  String get tdType => 'cleanFileName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'cleanFileName',
      'file_name': fileName,
    };
  }
}


/// Clears message drafts in all chats @exclude_secret_chats Pass true to keep local message drafts in s...
class TdClearAllDraftMessages extends TdObject {
  final bool excludeSecretChats;

  TdClearAllDraftMessages({
    required this.excludeSecretChats,
  });

  @override
  String get tdType => 'clearAllDraftMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clearAllDraftMessages',
      'exclude_secret_chats': excludeSecretChats,
    };
  }
}


/// Clears the list of all autosave settings exceptions. The method is guaranteed to work only after at ...
class TdClearAutosaveSettingsExceptions extends TdObject {
  TdClearAutosaveSettingsExceptions();

  @override
  String get tdType => 'clearAutosaveSettingsExceptions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clearAutosaveSettingsExceptions',
    };
  }
}


/// Clears all imported contacts, contact list remains unchanged
class TdClearImportedContacts extends TdObject {
  TdClearImportedContacts();

  @override
  String get tdType => 'clearImportedContacts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clearImportedContacts',
    };
  }
}


/// Clears the list of recently used emoji statuses for self status
class TdClearRecentEmojiStatuses extends TdObject {
  TdClearRecentEmojiStatuses();

  @override
  String get tdType => 'clearRecentEmojiStatuses';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clearRecentEmojiStatuses',
    };
  }
}


/// Clears the list of recently used reactions
class TdClearRecentReactions extends TdObject {
  TdClearRecentReactions();

  @override
  String get tdType => 'clearRecentReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clearRecentReactions',
    };
  }
}


/// Clears the list of recently used stickers @is_attached Pass true to clear the list of stickers recen...
class TdClearRecentStickers extends TdObject {
  final bool isAttached;

  TdClearRecentStickers({
    required this.isAttached,
  });

  @override
  String get tdType => 'clearRecentStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clearRecentStickers',
      'is_attached': isAttached,
    };
  }
}


/// Clears the list of recently found chats
class TdClearRecentlyFoundChats extends TdObject {
  TdClearRecentlyFoundChats();

  @override
  String get tdType => 'clearRecentlyFoundChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clearRecentlyFoundChats',
    };
  }
}


/// Clears the list of recently searched for hashtags or cashtags @clear_cashtags Pass true to clear the...
class TdClearSearchedForTags extends TdObject {
  final bool clearCashtags;

  TdClearSearchedForTags({
    required this.clearCashtags,
  });

  @override
  String get tdType => 'clearSearchedForTags';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clearSearchedForTags',
      'clear_cashtags': clearCashtags,
    };
  }
}


/// Informs TDLib that a message with an animated emoji was clicked by the user. Returns a big animated ...
class TdClickAnimatedEmojiMessage extends TdObject {
  final int chatId;
  final int messageId;

  TdClickAnimatedEmojiMessage({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'clickAnimatedEmojiMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clickAnimatedEmojiMessage',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Informs TDLib that the user opened the sponsored chat via the button, the name, the chat photo, a me...
class TdClickChatSponsoredMessage extends TdObject {
  final int chatId;
  final int messageId;
  final bool isMediaClick;
  final bool fromFullscreen;

  TdClickChatSponsoredMessage({
    required this.chatId,
    required this.messageId,
    required this.isMediaClick,
    required this.fromFullscreen,
  });

  @override
  String get tdType => 'clickChatSponsoredMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clickChatSponsoredMessage',
      'chat_id': chatId,
      'message_id': messageId,
      'is_media_click': isMediaClick,
      'from_fullscreen': fromFullscreen,
    };
  }
}


/// Informs TDLib that the user clicked Premium subscription button on the Premium features screen
class TdClickPremiumSubscriptionButton extends TdObject {
  TdClickPremiumSubscriptionButton();

  @override
  String get tdType => 'clickPremiumSubscriptionButton';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clickPremiumSubscriptionButton',
    };
  }
}


/// Informs TDLib that the user clicked a video message advertisement @advertisement_unique_id Unique id...
class TdClickVideoMessageAdvertisement extends TdObject {
  final int advertisementUniqueId;

  TdClickVideoMessageAdvertisement({
    required this.advertisementUniqueId,
  });

  @override
  String get tdType => 'clickVideoMessageAdvertisement';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'clickVideoMessageAdvertisement',
      'advertisement_unique_id': advertisementUniqueId,
    };
  }
}


/// Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the clos...
class TdClose extends TdObject {
  TdClose();

  @override
  String get tdType => 'close';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'close',
    };
  }
}


/// Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being o...
class TdCloseChat extends TdObject {
  final int chatId;

  TdCloseChat({
    required this.chatId,
  });

  @override
  String get tdType => 'closeChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'closeChat',
      'chat_id': chatId,
    };
  }
}


/// Informs TDLib that a gift auction was closed by the user @gift_id Identifier of the gift, which auct...
class TdCloseGiftAuction extends TdObject {
  final int giftId;

  TdCloseGiftAuction({
    required this.giftId,
  });

  @override
  String get tdType => 'closeGiftAuction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'closeGiftAuction',
      'gift_id': giftId,
    };
  }
}


/// Closes a secret chat, effectively transferring its state to secretChatStateClosed @secret_chat_id Se...
class TdCloseSecretChat extends TdObject {
  final int secretChatId;

  TdCloseSecretChat({
    required this.secretChatId,
  });

  @override
  String get tdType => 'closeSecretChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'closeSecretChat',
      'secret_chat_id': secretChatId,
    };
  }
}


/// Informs TDLib that a story is closed by the user
class TdCloseStory extends TdObject {
  final int storyPosterChatId;
  final int storyId;

  TdCloseStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  @override
  String get tdType => 'closeStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'closeStory',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
    };
  }
}


/// Informs TDLib that a previously opened Web App was closed @web_app_launch_id Identifier of Web App l...
class TdCloseWebApp extends TdObject {
  final int webAppLaunchId;

  TdCloseWebApp({
    required this.webAppLaunchId,
  });

  @override
  String get tdType => 'closeWebApp';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'closeWebApp',
      'web_app_launch_id': webAppLaunchId,
    };
  }
}


/// Applies all pending paid reactions in a live story group call @group_call_id Group call identifier
class TdCommitPendingLiveStoryReactions extends TdObject {
  final int groupCallId;

  TdCommitPendingLiveStoryReactions({
    required this.groupCallId,
  });

  @override
  String get tdType => 'commitPendingLiveStoryReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'commitPendingLiveStoryReactions',
      'group_call_id': groupCallId,
    };
  }
}


/// Applies all pending paid reactions on a message @chat_id Identifier of the chat to which the message...
class TdCommitPendingPaidMessageReactions extends TdObject {
  final int chatId;
  final int messageId;

  TdCommitPendingPaidMessageReactions({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'commitPendingPaidMessageReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'commitPendingPaidMessageReactions',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Confirms QR code authentication on another device. Returns created session on success @link A link f...
class TdConfirmQrCodeAuthentication extends TdObject {
  final String link;

  TdConfirmQrCodeAuthentication({
    required this.link,
  });

  @override
  String get tdType => 'confirmQrCodeAuthentication';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'confirmQrCodeAuthentication',
      'link': link,
    };
  }
}


/// Confirms an unconfirmed session of the current user from another device @session_id Session identifi...
class TdConfirmSession extends TdObject {
  final int sessionId;

  TdConfirmSession({
    required this.sessionId,
  });

  @override
  String get tdType => 'confirmSession';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'confirmSession',
      'session_id': sessionId,
    };
  }
}


/// Connects an affiliate program to the given affiliate. Returns information about the connected affili...
class TdConnectAffiliateProgram extends TdObject {
  final TdAffiliateType? affiliate;
  final int botUserId;

  TdConnectAffiliateProgram({
    this.affiliate,
    required this.botUserId,
  });

  @override
  String get tdType => 'connectAffiliateProgram';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'connectAffiliateProgram',
      'affiliate': affiliate?.toMap(),
      'bot_user_id': botUserId,
    };
  }
}


/// Returns an existing chat corresponding to a known basic group @basic_group_id Basic group identifier...
class TdCreateBasicGroupChat extends TdObject {
  final int basicGroupId;
  final bool force;

  TdCreateBasicGroupChat({
    required this.basicGroupId,
    required this.force,
  });

  @override
  String get tdType => 'createBasicGroupChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createBasicGroupChat',
      'basic_group_id': basicGroupId,
      'force': force,
    };
  }
}


/// Creates a business chat link for the current account. Requires Telegram Business subscription. There...
class TdCreateBusinessChatLink extends TdObject {
  final TdInputBusinessChatLink? linkInfo;

  TdCreateBusinessChatLink({
    this.linkInfo,
  });

  @override
  String get tdType => 'createBusinessChatLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createBusinessChatLink',
      'link_info': linkInfo?.toMap(),
    };
  }
}


/// Creates a new call
class TdCreateCall extends TdObject {
  final int userId;
  final TdCallProtocol? protocol;
  final bool isVideo;

  TdCreateCall({
    required this.userId,
    this.protocol,
    required this.isVideo,
  });

  @override
  String get tdType => 'createCall';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createCall',
      'user_id': userId,
      'protocol': protocol?.toMap(),
      'is_video': isVideo,
    };
  }
}


/// Creates new chat folder. Returns information about the created chat folder. There can be up to getOp...
class TdCreateChatFolder extends TdObject {
  final TdChatFolder? folder;

  TdCreateChatFolder({
    this.folder,
  });

  @override
  String get tdType => 'createChatFolder';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createChatFolder',
      'folder': folder?.toMap(),
    };
  }
}


/// Creates a new invite link for a chat folder. A link can be created for a chat folder if it has only ...
class TdCreateChatFolderInviteLink extends TdObject {
  final int chatFolderId;
  final String name;
  final List<int> chatIds;

  TdCreateChatFolderInviteLink({
    required this.chatFolderId,
    required this.name,
    required this.chatIds,
  });

  @override
  String get tdType => 'createChatFolderInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createChatFolderInviteLink',
      'chat_folder_id': chatFolderId,
      'name': name,
      'chat_ids': chatIds,
    };
  }
}


/// Creates a new invite link for a chat. Available for basic groups, supergroups, and channels. Require...
class TdCreateChatInviteLink extends TdObject {
  final int chatId;
  final String name;
  final int expirationDate;
  final int memberLimit;
  final bool createsJoinRequest;

  TdCreateChatInviteLink({
    required this.chatId,
    required this.name,
    required this.expirationDate,
    required this.memberLimit,
    required this.createsJoinRequest,
  });

  @override
  String get tdType => 'createChatInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createChatInviteLink',
      'chat_id': chatId,
      'name': name,
      'expiration_date': expirationDate,
      'member_limit': memberLimit,
      'creates_join_request': createsJoinRequest,
    };
  }
}


/// Creates a new subscription invite link for a channel chat. Requires can_invite_users right in the ch...
class TdCreateChatSubscriptionInviteLink extends TdObject {
  final int chatId;
  final String name;
  final TdStarSubscriptionPricing? subscriptionPricing;

  TdCreateChatSubscriptionInviteLink({
    required this.chatId,
    required this.name,
    this.subscriptionPricing,
  });

  @override
  String get tdType => 'createChatSubscriptionInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createChatSubscriptionInviteLink',
      'chat_id': chatId,
      'name': name,
      'subscription_pricing': subscriptionPricing?.toMap(),
    };
  }
}


/// Creates a topic in a forum supergroup chat or a chat with a bot with topics; requires can_manage_top...
class TdCreateForumTopic extends TdObject {
  final int chatId;
  final String name;
  final bool isNameImplicit;
  final TdForumTopicIcon? icon;

  TdCreateForumTopic({
    required this.chatId,
    required this.name,
    required this.isNameImplicit,
    this.icon,
  });

  @override
  String get tdType => 'createForumTopic';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createForumTopic',
      'chat_id': chatId,
      'name': name,
      'is_name_implicit': isNameImplicit,
      'icon': icon?.toMap(),
    };
  }
}


/// Creates a collection from gifts on the current user\'s or a channel\'s profile page; requires can_post...
class TdCreateGiftCollection extends TdObject {
  final TdMessageSender? ownerId;
  final String name;
  final List<String> receivedGiftIds;

  TdCreateGiftCollection({
    this.ownerId,
    required this.name,
    required this.receivedGiftIds,
  });

  @override
  String get tdType => 'createGiftCollection';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createGiftCollection',
      'owner_id': ownerId?.toMap(),
      'name': name,
      'received_gift_ids': receivedGiftIds,
    };
  }
}


/// Creates a new group call that isn\'t bound to a chat @join_parameters Parameters to join the call; pa...
class TdCreateGroupCall extends TdObject {
  final TdGroupCallJoinParameters? joinParameters;

  TdCreateGroupCall({
    this.joinParameters,
  });

  @override
  String get tdType => 'createGroupCall';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createGroupCall',
      'join_parameters': joinParameters?.toMap(),
    };
  }
}


/// Creates a link for the given invoice; for bots only
class TdCreateInvoiceLink extends TdObject {
  final String businessConnectionId;
  final TdInputMessageContent? invoice;

  TdCreateInvoiceLink({
    required this.businessConnectionId,
    this.invoice,
  });

  @override
  String get tdType => 'createInvoiceLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createInvoiceLink',
      'business_connection_id': businessConnectionId,
      'invoice': invoice?.toMap(),
    };
  }
}


/// Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns information...
class TdCreateNewBasicGroupChat extends TdObject {
  final List<int> userIds;
  final String title;
  final int messageAutoDeleteTime;

  TdCreateNewBasicGroupChat({
    required this.userIds,
    required this.title,
    required this.messageAutoDeleteTime,
  });

  @override
  String get tdType => 'createNewBasicGroupChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createNewBasicGroupChat',
      'user_ids': userIds,
      'title': title,
      'message_auto_delete_time': messageAutoDeleteTime,
    };
  }
}


/// Creates a new secret chat. Returns the newly created chat @user_id Identifier of the target user
class TdCreateNewSecretChat extends TdObject {
  final int userId;

  TdCreateNewSecretChat({
    required this.userId,
  });

  @override
  String get tdType => 'createNewSecretChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createNewSecretChat',
      'user_id': userId,
    };
  }
}


/// Creates a new sticker set. Returns the newly created sticker set If empty, then the name returned by...
class TdCreateNewStickerSet extends TdObject {
  final int userId;
  final String title;
  final String name;
  final TdStickerType? stickerType;
  final bool needsRepainting;
  final List<TdInputSticker> stickers;
  final String source;

  TdCreateNewStickerSet({
    required this.userId,
    required this.title,
    required this.name,
    this.stickerType,
    required this.needsRepainting,
    required this.stickers,
    required this.source,
  });

  @override
  String get tdType => 'createNewStickerSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createNewStickerSet',
      'user_id': userId,
      'title': title,
      'name': name,
      'sticker_type': stickerType?.toMap(),
      'needs_repainting': needsRepainting,
      'stickers': stickers.map((e) => e.toMap()).toList(),
      'source': source,
    };
  }
}


/// Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns t...
class TdCreateNewSupergroupChat extends TdObject {
  final String title;
  final bool isForum;
  final bool isChannel;
  final String description;
  final TdChatLocation? location;
  final int messageAutoDeleteTime;
  final bool forImport;

  TdCreateNewSupergroupChat({
    required this.title,
    required this.isForum,
    required this.isChannel,
    required this.description,
    this.location,
    required this.messageAutoDeleteTime,
    required this.forImport,
  });

  @override
  String get tdType => 'createNewSupergroupChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createNewSupergroupChat',
      'title': title,
      'is_forum': isForum,
      'is_channel': isChannel,
      'description': description,
      'location': location?.toMap(),
      'message_auto_delete_time': messageAutoDeleteTime,
      'for_import': forImport,
    };
  }
}


/// Returns an existing chat corresponding to a given user @user_id User identifier @force Pass true to ...
class TdCreatePrivateChat extends TdObject {
  final int userId;
  final bool force;

  TdCreatePrivateChat({
    required this.userId,
    required this.force,
  });

  @override
  String get tdType => 'createPrivateChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createPrivateChat',
      'user_id': userId,
      'force': force,
    };
  }
}


/// Returns an existing chat corresponding to a known secret chat @secret_chat_id Secret chat identifier
class TdCreateSecretChat extends TdObject {
  final int secretChatId;

  TdCreateSecretChat({
    required this.secretChatId,
  });

  @override
  String get tdType => 'createSecretChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createSecretChat',
      'secret_chat_id': secretChatId,
    };
  }
}


/// Creates an album of stories; requires can_edit_stories administrator right for supergroup and channe...
class TdCreateStoryAlbum extends TdObject {
  final int storyPosterChatId;
  final String name;
  final List<int> storyIds;

  TdCreateStoryAlbum({
    required this.storyPosterChatId,
    required this.name,
    required this.storyIds,
  });

  @override
  String get tdType => 'createStoryAlbum';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createStoryAlbum',
      'story_poster_chat_id': storyPosterChatId,
      'name': name,
      'story_ids': storyIds,
    };
  }
}


/// Returns an existing chat corresponding to a known supergroup or channel @supergroup_id Supergroup or...
class TdCreateSupergroupChat extends TdObject {
  final int supergroupId;
  final bool force;

  TdCreateSupergroupChat({
    required this.supergroupId,
    required this.force,
  });

  @override
  String get tdType => 'createSupergroupChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createSupergroupChat',
      'supergroup_id': supergroupId,
      'force': force,
    };
  }
}


/// Creates a new temporary password for processing payments @password The 2-step verification password ...
class TdCreateTemporaryPassword extends TdObject {
  final String password;
  final int validFor;

  TdCreateTemporaryPassword({
    required this.password,
    required this.validFor,
  });

  @override
  String get tdType => 'createTemporaryPassword';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createTemporaryPassword',
      'password': password,
      'valid_for': validFor,
    };
  }
}


/// Creates a video chat (a group call bound to a chat). Available only for basic groups, supergroups an...
class TdCreateVideoChat extends TdObject {
  final int chatId;
  final String title;
  final int startDate;
  final bool isRtmpStream;

  TdCreateVideoChat({
    required this.chatId,
    required this.title,
    required this.startDate,
    required this.isRtmpStream,
  });

  @override
  String get tdType => 'createVideoChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'createVideoChat',
      'chat_id': chatId,
      'title': title,
      'start_date': startDate,
      'is_rtmp_stream': isRtmpStream,
    };
  }
}


/// Declines an invitation to an active group call via messageGroupCall. Can be called both by the sende...
class TdDeclineGroupCallInvitation extends TdObject {
  final int chatId;
  final int messageId;

  TdDeclineGroupCallInvitation({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'declineGroupCallInvitation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'declineGroupCallInvitation',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Declines a suggested post in a channel direct messages chat
class TdDeclineSuggestedPost extends TdObject {
  final int chatId;
  final int messageId;
  final String comment;

  TdDeclineSuggestedPost({
    required this.chatId,
    required this.messageId,
    required this.comment,
  });

  @override
  String get tdType => 'declineSuggestedPost';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'declineSuggestedPost',
      'chat_id': chatId,
      'message_id': messageId,
      'comment': comment,
    };
  }
}


/// Decrypts group call data received by tgcalls
class TdDecryptGroupCallData extends TdObject {
  final int groupCallId;
  final TdMessageSender? participantId;
  final TdGroupCallDataChannel? dataChannel;
  final String data;

  TdDecryptGroupCallData({
    required this.groupCallId,
    this.participantId,
    this.dataChannel,
    required this.data,
  });

  @override
  String get tdType => 'decryptGroupCallData';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'decryptGroupCallData',
      'group_call_id': groupCallId,
      'participant_id': participantId?.toMap(),
      'data_channel': dataChannel?.toMap(),
      'data': data,
    };
  }
}


/// Deletes the account of the current user, deleting all information associated with the user from the ...
class TdDeleteAccount extends TdObject {
  final String reason;
  final String password;

  TdDeleteAccount({
    required this.reason,
    required this.password,
  });

  @override
  String get tdType => 'deleteAccount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteAccount',
      'reason': reason,
      'password': password,
    };
  }
}


/// Deletes all call messages @revoke Pass true to delete the messages for all users
class TdDeleteAllCallMessages extends TdObject {
  final bool revoke;

  TdDeleteAllCallMessages({
    required this.revoke,
  });

  @override
  String get tdType => 'deleteAllCallMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteAllCallMessages',
      'revoke': revoke,
    };
  }
}


/// Deletes all revoked chat invite links created by a given chat administrator. Requires administrator ...
class TdDeleteAllRevokedChatInviteLinks extends TdObject {
  final int chatId;
  final int creatorUserId;

  TdDeleteAllRevokedChatInviteLinks({
    required this.chatId,
    required this.creatorUserId,
  });

  @override
  String get tdType => 'deleteAllRevokedChatInviteLinks';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteAllRevokedChatInviteLinks',
      'chat_id': chatId,
      'creator_user_id': creatorUserId,
    };
  }
}


/// Deletes media previews from the list of media previews of a bot
class TdDeleteBotMediaPreviews extends TdObject {
  final int botUserId;
  final String languageCode;
  final List<int> fileIds;

  TdDeleteBotMediaPreviews({
    required this.botUserId,
    required this.languageCode,
    required this.fileIds,
  });

  @override
  String get tdType => 'deleteBotMediaPreviews';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteBotMediaPreviews',
      'bot_user_id': botUserId,
      'language_code': languageCode,
      'file_ids': fileIds,
    };
  }
}


/// Deletes a business chat link of the current account @link The link to delete
class TdDeleteBusinessChatLink extends TdObject {
  final String link;

  TdDeleteBusinessChatLink({
    required this.link,
  });

  @override
  String get tdType => 'deleteBusinessChatLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteBusinessChatLink',
      'link': link,
    };
  }
}


/// Deletes the business bot that is connected to the current user account @bot_user_id Unique user iden...
class TdDeleteBusinessConnectedBot extends TdObject {
  final int botUserId;

  TdDeleteBusinessConnectedBot({
    required this.botUserId,
  });

  @override
  String get tdType => 'deleteBusinessConnectedBot';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteBusinessConnectedBot',
      'bot_user_id': botUserId,
    };
  }
}


/// Deletes messages on behalf of a business account; for bots only
class TdDeleteBusinessMessages extends TdObject {
  final String businessConnectionId;
  final List<int> messageIds;

  TdDeleteBusinessMessages({
    required this.businessConnectionId,
    required this.messageIds,
  });

  @override
  String get tdType => 'deleteBusinessMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteBusinessMessages',
      'business_connection_id': businessConnectionId,
      'message_ids': messageIds,
    };
  }
}


/// Deletes a story posted by the bot on behalf of a business account; for bots only
class TdDeleteBusinessStory extends TdObject {
  final String businessConnectionId;
  final int storyId;

  TdDeleteBusinessStory({
    required this.businessConnectionId,
    required this.storyId,
  });

  @override
  String get tdType => 'deleteBusinessStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteBusinessStory',
      'business_connection_id': businessConnectionId,
      'story_id': storyId,
    };
  }
}


/// Deletes a chat along with all messages in the corresponding chat for all chat members. For group cha...
class TdDeleteChat extends TdObject {
  final int chatId;

  TdDeleteChat({
    required this.chatId,
  });

  @override
  String get tdType => 'deleteChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteChat',
      'chat_id': chatId,
    };
  }
}


/// Deletes background in a specific chat Supposed to be used from messageChatSetBackground messages wit...
class TdDeleteChatBackground extends TdObject {
  final int chatId;
  final bool restorePrevious;

  TdDeleteChatBackground({
    required this.chatId,
    required this.restorePrevious,
  });

  @override
  String get tdType => 'deleteChatBackground';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteChatBackground',
      'chat_id': chatId,
      'restore_previous': restorePrevious,
    };
  }
}


/// Deletes existing chat folder @chat_folder_id Chat folder identifier @leave_chat_ids Identifiers of t...
class TdDeleteChatFolder extends TdObject {
  final int chatFolderId;
  final List<int> leaveChatIds;

  TdDeleteChatFolder({
    required this.chatFolderId,
    required this.leaveChatIds,
  });

  @override
  String get tdType => 'deleteChatFolder';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteChatFolder',
      'chat_folder_id': chatFolderId,
      'leave_chat_ids': leaveChatIds,
    };
  }
}


/// Deletes an invite link for a chat folder
class TdDeleteChatFolderInviteLink extends TdObject {
  final int chatFolderId;
  final String inviteLink;

  TdDeleteChatFolderInviteLink({
    required this.chatFolderId,
    required this.inviteLink,
  });

  @override
  String get tdType => 'deleteChatFolderInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteChatFolderInviteLink',
      'chat_folder_id': chatFolderId,
      'invite_link': inviteLink,
    };
  }
}


/// Deletes all messages in the chat. Use chat.can_be_deleted_only_for_self and chat.can_be_deleted_for_...
class TdDeleteChatHistory extends TdObject {
  final int chatId;
  final bool removeFromChatList;
  final bool revoke;

  TdDeleteChatHistory({
    required this.chatId,
    required this.removeFromChatList,
    required this.revoke,
  });

  @override
  String get tdType => 'deleteChatHistory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteChatHistory',
      'chat_id': chatId,
      'remove_from_chat_list': removeFromChatList,
      'revoke': revoke,
    };
  }
}


/// Deletes all messages between the specified dates in a chat. Supported only for private chats and bas...
class TdDeleteChatMessagesByDate extends TdObject {
  final int chatId;
  final int minDate;
  final int maxDate;
  final bool revoke;

  TdDeleteChatMessagesByDate({
    required this.chatId,
    required this.minDate,
    required this.maxDate,
    required this.revoke,
  });

  @override
  String get tdType => 'deleteChatMessagesByDate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteChatMessagesByDate',
      'chat_id': chatId,
      'min_date': minDate,
      'max_date': maxDate,
      'revoke': revoke,
    };
  }
}


/// Deletes all messages sent by the specified message sender in a chat. Supported only for supergroups;...
class TdDeleteChatMessagesBySender extends TdObject {
  final int chatId;
  final TdMessageSender? senderId;

  TdDeleteChatMessagesBySender({
    required this.chatId,
    this.senderId,
  });

  @override
  String get tdType => 'deleteChatMessagesBySender';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteChatMessagesBySender',
      'chat_id': chatId,
      'sender_id': senderId?.toMap(),
    };
  }
}


/// Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a replyMar...
class TdDeleteChatReplyMarkup extends TdObject {
  final int chatId;
  final int messageId;

  TdDeleteChatReplyMarkup({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'deleteChatReplyMarkup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteChatReplyMarkup',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Deletes commands supported by the bot for the given user scope and language; for bots only
class TdDeleteCommands extends TdObject {
  final TdBotCommandScope? scope;
  final String languageCode;

  TdDeleteCommands({
    this.scope,
    required this.languageCode,
  });

  @override
  String get tdType => 'deleteCommands';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteCommands',
      'scope': scope?.toMap(),
      'language_code': languageCode,
    };
  }
}


/// Deletes default background for chats @for_dark_theme Pass true if the background is deleted for a da...
class TdDeleteDefaultBackground extends TdObject {
  final bool forDarkTheme;

  TdDeleteDefaultBackground({
    required this.forDarkTheme,
  });

  @override
  String get tdType => 'deleteDefaultBackground';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteDefaultBackground',
      'for_dark_theme': forDarkTheme,
    };
  }
}


/// Deletes all messages in the topic in a channel direct messages chat administered by the current user
class TdDeleteDirectMessagesChatTopicHistory extends TdObject {
  final int chatId;
  final int topicId;

  TdDeleteDirectMessagesChatTopicHistory({
    required this.chatId,
    required this.topicId,
  });

  @override
  String get tdType => 'deleteDirectMessagesChatTopicHistory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteDirectMessagesChatTopicHistory',
      'chat_id': chatId,
      'topic_id': topicId,
    };
  }
}


/// Deletes all messages between the specified dates in the topic in a channel direct messages chat admi...
class TdDeleteDirectMessagesChatTopicMessagesByDate extends TdObject {
  final int chatId;
  final int topicId;
  final int minDate;
  final int maxDate;

  TdDeleteDirectMessagesChatTopicMessagesByDate({
    required this.chatId,
    required this.topicId,
    required this.minDate,
    required this.maxDate,
  });

  @override
  String get tdType => 'deleteDirectMessagesChatTopicMessagesByDate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteDirectMessagesChatTopicMessagesByDate',
      'chat_id': chatId,
      'topic_id': topicId,
      'min_date': minDate,
      'max_date': maxDate,
    };
  }
}


/// Deletes a file from the TDLib file cache @file_id Identifier of the file to delete
class TdDeleteFile extends TdObject {
  final int fileId;

  TdDeleteFile({
    required this.fileId,
  });

  @override
  String get tdType => 'deleteFile';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteFile',
      'file_id': fileId,
    };
  }
}


/// Deletes all messages from a topic in a forum supergroup chat or a chat with a bot with topics; requi...
class TdDeleteForumTopic extends TdObject {
  final int chatId;
  final int forumTopicId;

  TdDeleteForumTopic({
    required this.chatId,
    required this.forumTopicId,
  });

  @override
  String get tdType => 'deleteForumTopic';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteForumTopic',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
    };
  }
}


/// Deletes a gift collection. If the collection is owned by a channel chat, then requires can_post_mess...
class TdDeleteGiftCollection extends TdObject {
  final TdMessageSender? ownerId;
  final int collectionId;

  TdDeleteGiftCollection({
    this.ownerId,
    required this.collectionId,
  });

  @override
  String get tdType => 'deleteGiftCollection';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteGiftCollection',
      'owner_id': ownerId?.toMap(),
      'collection_id': collectionId,
    };
  }
}


/// Deletes messages in a group call; for live story calls only. Requires groupCallMessage.can_be_delete...
class TdDeleteGroupCallMessages extends TdObject {
  final int groupCallId;
  final List<int> messageIds;
  final bool reportSpam;

  TdDeleteGroupCallMessages({
    required this.groupCallId,
    required this.messageIds,
    required this.reportSpam,
  });

  @override
  String get tdType => 'deleteGroupCallMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteGroupCallMessages',
      'group_call_id': groupCallId,
      'message_ids': messageIds,
      'report_spam': reportSpam,
    };
  }
}


/// Deletes all messages sent by the specified message sender in a group call; for live story calls only...
class TdDeleteGroupCallMessagesBySender extends TdObject {
  final int groupCallId;
  final TdMessageSender? senderId;
  final bool reportSpam;

  TdDeleteGroupCallMessagesBySender({
    required this.groupCallId,
    this.senderId,
    required this.reportSpam,
  });

  @override
  String get tdType => 'deleteGroupCallMessagesBySender';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteGroupCallMessagesBySender',
      'group_call_id': groupCallId,
      'sender_id': senderId?.toMap(),
      'report_spam': reportSpam,
    };
  }
}


/// Deletes all information about a language pack in the current localization target. The language pack ...
class TdDeleteLanguagePack extends TdObject {
  final String languagePackId;

  TdDeleteLanguagePack({
    required this.languagePackId,
  });

  @override
  String get tdType => 'deleteLanguagePack';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteLanguagePack',
      'language_pack_id': languagePackId,
    };
  }
}


/// Deletes messages
class TdDeleteMessages extends TdObject {
  final int chatId;
  final List<int> messageIds;
  final bool revoke;

  TdDeleteMessages({
    required this.chatId,
    required this.messageIds,
    required this.revoke,
  });

  @override
  String get tdType => 'deleteMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteMessages',
      'chat_id': chatId,
      'message_ids': messageIds,
      'revoke': revoke,
    };
  }
}


/// Deletes a Telegram Passport element @type Element type
class TdDeletePassportElement extends TdObject {
  final TdPassportElementType? type;

  TdDeletePassportElement({
    this.type,
  });

  @override
  String get tdType => 'deletePassportElement';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deletePassportElement',
      'type': type?.toMap(),
    };
  }
}


/// Deletes a profile photo @profile_photo_id Identifier of the profile photo to delete
class TdDeleteProfilePhoto extends TdObject {
  final int profilePhotoId;

  TdDeleteProfilePhoto({
    required this.profilePhotoId,
  });

  @override
  String get tdType => 'deleteProfilePhoto';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteProfilePhoto',
      'profile_photo_id': profilePhotoId,
    };
  }
}


/// Deletes a quick reply shortcut @shortcut_id Unique identifier of the quick reply shortcut
class TdDeleteQuickReplyShortcut extends TdObject {
  final int shortcutId;

  TdDeleteQuickReplyShortcut({
    required this.shortcutId,
  });

  @override
  String get tdType => 'deleteQuickReplyShortcut';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteQuickReplyShortcut',
      'shortcut_id': shortcutId,
    };
  }
}


/// Deletes specified quick reply messages
class TdDeleteQuickReplyShortcutMessages extends TdObject {
  final int shortcutId;
  final List<int> messageIds;

  TdDeleteQuickReplyShortcutMessages({
    required this.shortcutId,
    required this.messageIds,
  });

  @override
  String get tdType => 'deleteQuickReplyShortcutMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteQuickReplyShortcutMessages',
      'shortcut_id': shortcutId,
      'message_ids': messageIds,
    };
  }
}


/// Deletes revoked chat invite links. Requires administrator privileges and can_invite_users right in t...
class TdDeleteRevokedChatInviteLink extends TdObject {
  final int chatId;
  final String inviteLink;

  TdDeleteRevokedChatInviteLink({
    required this.chatId,
    required this.inviteLink,
  });

  @override
  String get tdType => 'deleteRevokedChatInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteRevokedChatInviteLink',
      'chat_id': chatId,
      'invite_link': inviteLink,
    };
  }
}


/// Deletes saved credentials for all payment provider bots
class TdDeleteSavedCredentials extends TdObject {
  TdDeleteSavedCredentials();

  @override
  String get tdType => 'deleteSavedCredentials';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteSavedCredentials',
    };
  }
}


/// Deletes all messages in a Saved Messages topic @saved_messages_topic_id Identifier of Saved Messages...
class TdDeleteSavedMessagesTopicHistory extends TdObject {
  final int savedMessagesTopicId;

  TdDeleteSavedMessagesTopicHistory({
    required this.savedMessagesTopicId,
  });

  @override
  String get tdType => 'deleteSavedMessagesTopicHistory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteSavedMessagesTopicHistory',
      'saved_messages_topic_id': savedMessagesTopicId,
    };
  }
}


/// Deletes all messages between the specified dates in a Saved Messages topic. Messages sent in the las...
class TdDeleteSavedMessagesTopicMessagesByDate extends TdObject {
  final int savedMessagesTopicId;
  final int minDate;
  final int maxDate;

  TdDeleteSavedMessagesTopicMessagesByDate({
    required this.savedMessagesTopicId,
    required this.minDate,
    required this.maxDate,
  });

  @override
  String get tdType => 'deleteSavedMessagesTopicMessagesByDate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteSavedMessagesTopicMessagesByDate',
      'saved_messages_topic_id': savedMessagesTopicId,
      'min_date': minDate,
      'max_date': maxDate,
    };
  }
}


/// Deletes saved order information
class TdDeleteSavedOrderInfo extends TdObject {
  TdDeleteSavedOrderInfo();

  @override
  String get tdType => 'deleteSavedOrderInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteSavedOrderInfo',
    };
  }
}


/// Completely deletes a sticker set @name Sticker set name. The sticker set must be owned by the curren...
class TdDeleteStickerSet extends TdObject {
  final String name;

  TdDeleteStickerSet({
    required this.name,
  });

  @override
  String get tdType => 'deleteStickerSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteStickerSet',
      'name': name,
    };
  }
}


/// Deletes a previously posted story. Can be called only if story.can_be_deleted == true
class TdDeleteStory extends TdObject {
  final int storyPosterChatId;
  final int storyId;

  TdDeleteStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  @override
  String get tdType => 'deleteStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteStory',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
    };
  }
}


/// Deletes a story album. If the album is owned by a supergroup or a channel chat, then requires can_ed...
class TdDeleteStoryAlbum extends TdObject {
  final int chatId;
  final int storyAlbumId;

  TdDeleteStoryAlbum({
    required this.chatId,
    required this.storyAlbumId,
  });

  @override
  String get tdType => 'deleteStoryAlbum';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'deleteStoryAlbum',
      'chat_id': chatId,
      'story_album_id': storyAlbumId,
    };
  }
}


/// Closes the TDLib instance, destroying all local data without a proper logout. The current user sessi...
class TdDestroy extends TdObject {
  TdDestroy();

  @override
  String get tdType => 'destroy';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'destroy',
    };
  }
}


/// Disables all active non-editable usernames of a supergroup or channel, requires owner privileges in ...
class TdDisableAllSupergroupUsernames extends TdObject {
  final int supergroupId;

  TdDisableAllSupergroupUsernames({
    required this.supergroupId,
  });

  @override
  String get tdType => 'disableAllSupergroupUsernames';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'disableAllSupergroupUsernames',
      'supergroup_id': supergroupId,
    };
  }
}


/// Disables the currently enabled proxy. Can be called before authorization
class TdDisableProxy extends TdObject {
  TdDisableProxy();

  @override
  String get tdType => 'disableProxy';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'disableProxy',
    };
  }
}


/// Discards a call
class TdDiscardCall extends TdObject {
  final int callId;
  final bool isDisconnected;
  final String inviteLink;
  final int duration;
  final bool isVideo;
  final int connectionId;

  TdDiscardCall({
    required this.callId,
    required this.isDisconnected,
    required this.inviteLink,
    required this.duration,
    required this.isVideo,
    required this.connectionId,
  });

  @override
  String get tdType => 'discardCall';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'discardCall',
      'call_id': callId,
      'is_disconnected': isDisconnected,
      'invite_link': inviteLink,
      'duration': duration,
      'is_video': isVideo,
      'connection_id': connectionId,
    };
  }
}


/// Disconnects an affiliate program from the given affiliate and immediately deactivates its referral l...
class TdDisconnectAffiliateProgram extends TdObject {
  final TdAffiliateType? affiliate;
  final String url;

  TdDisconnectAffiliateProgram({
    this.affiliate,
    required this.url,
  });

  @override
  String get tdType => 'disconnectAffiliateProgram';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'disconnectAffiliateProgram',
      'affiliate': affiliate?.toMap(),
      'url': url,
    };
  }
}


/// Disconnects all websites from the current user\'s Telegram account
class TdDisconnectAllWebsites extends TdObject {
  TdDisconnectAllWebsites();

  @override
  String get tdType => 'disconnectAllWebsites';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'disconnectAllWebsites',
    };
  }
}


/// Disconnects website from the current user\'s Telegram account @website_id Website identifier
class TdDisconnectWebsite extends TdObject {
  final int websiteId;

  TdDisconnectWebsite({
    required this.websiteId,
  });

  @override
  String get tdType => 'disconnectWebsite';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'disconnectWebsite',
      'website_id': websiteId,
    };
  }
}


/// Downloads a file from the cloud. Download progress and completion of the download will be notified t...
class TdDownloadFile extends TdObject {
  final int fileId;
  final int priority;
  final int offset;
  final int limit;
  final bool synchronous;

  TdDownloadFile({
    required this.fileId,
    required this.priority,
    required this.offset,
    required this.limit,
    required this.synchronous,
  });

  @override
  String get tdType => 'downloadFile';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'downloadFile',
      'file_id': fileId,
      'priority': priority,
      'offset': offset,
      'limit': limit,
      'synchronous': synchronous,
    };
  }
}


/// Drops original details for an upgraded gift
class TdDropGiftOriginalDetails extends TdObject {
  final String receivedGiftId;
  final int starCount;

  TdDropGiftOriginalDetails({
    required this.receivedGiftId,
    required this.starCount,
  });

  @override
  String get tdType => 'dropGiftOriginalDetails';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'dropGiftOriginalDetails',
      'received_gift_id': receivedGiftId,
      'star_count': starCount,
    };
  }
}


/// Replaces media preview in the list of media previews of a bot. Returns the new preview after edit is...
class TdEditBotMediaPreview extends TdObject {
  final int botUserId;
  final String languageCode;
  final int fileId;
  final TdInputStoryContent? content;

  TdEditBotMediaPreview({
    required this.botUserId,
    required this.languageCode,
    required this.fileId,
    this.content,
  });

  @override
  String get tdType => 'editBotMediaPreview';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editBotMediaPreview',
      'bot_user_id': botUserId,
      'language_code': languageCode,
      'file_id': fileId,
      'content': content?.toMap(),
    };
  }
}


/// Edits a business chat link of the current account. Requires Telegram Business subscription. Returns ...
class TdEditBusinessChatLink extends TdObject {
  final String link;
  final TdInputBusinessChatLink? linkInfo;

  TdEditBusinessChatLink({
    required this.link,
    this.linkInfo,
  });

  @override
  String get tdType => 'editBusinessChatLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editBusinessChatLink',
      'link': link,
      'link_info': linkInfo?.toMap(),
    };
  }
}


/// Edits the caption of a message sent on behalf of a business account; for bots only
class TdEditBusinessMessageCaption extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdFormattedText? caption;
  final bool showCaptionAboveMedia;

  TdEditBusinessMessageCaption({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.caption,
    required this.showCaptionAboveMedia,
  });

  @override
  String get tdType => 'editBusinessMessageCaption';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editBusinessMessageCaption',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'caption': caption?.toMap(),
      'show_caption_above_media': showCaptionAboveMedia,
    };
  }
}


/// Edits the content of a checklist in a message sent on behalf of a business account; for bots only
class TdEditBusinessMessageChecklist extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdInputChecklist? checklist;

  TdEditBusinessMessageChecklist({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.checklist,
  });

  @override
  String get tdType => 'editBusinessMessageChecklist';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editBusinessMessageChecklist',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'checklist': checklist?.toMap(),
    };
  }
}


/// Edits the content of a live location in a message sent on behalf of a business account; for bots onl...
class TdEditBusinessMessageLiveLocation extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdLocation? location;
  final int livePeriod;
  final int heading;
  final int proximityAlertRadius;

  TdEditBusinessMessageLiveLocation({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.location,
    required this.livePeriod,
    required this.heading,
    required this.proximityAlertRadius,
  });

  @override
  String get tdType => 'editBusinessMessageLiveLocation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editBusinessMessageLiveLocation',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'location': location?.toMap(),
      'live_period': livePeriod,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
    };
  }
}


/// Edits the media content of a message with a text, an animation, an audio, a document, a photo or a v...
class TdEditBusinessMessageMedia extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdInputMessageContent? inputMessageContent;

  TdEditBusinessMessageMedia({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'editBusinessMessageMedia';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editBusinessMessageMedia',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Edits the reply markup of a message sent on behalf of a business account; for bots only
class TdEditBusinessMessageReplyMarkup extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;

  TdEditBusinessMessageReplyMarkup({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
  });

  @override
  String get tdType => 'editBusinessMessageReplyMarkup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editBusinessMessageReplyMarkup',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
    };
  }
}


/// Edits the text of a text or game message sent on behalf of a business account; for bots only
class TdEditBusinessMessageText extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdInputMessageContent? inputMessageContent;

  TdEditBusinessMessageText({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'editBusinessMessageText';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editBusinessMessageText',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Changes a story posted by the bot on behalf of a business account; for bots only
class TdEditBusinessStory extends TdObject {
  final int storyPosterChatId;
  final int storyId;
  final TdInputStoryContent? content;
  final TdInputStoryAreas? areas;
  final TdFormattedText? caption;
  final TdStoryPrivacySettings? privacySettings;

  TdEditBusinessStory({
    required this.storyPosterChatId,
    required this.storyId,
    this.content,
    this.areas,
    this.caption,
    this.privacySettings,
  });

  @override
  String get tdType => 'editBusinessStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editBusinessStory',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
      'content': content?.toMap(),
      'areas': areas?.toMap(),
      'caption': caption?.toMap(),
      'privacy_settings': privacySettings?.toMap(),
    };
  }
}


/// Edits existing chat folder. Returns information about the edited chat folder @chat_folder_id Chat fo...
class TdEditChatFolder extends TdObject {
  final int chatFolderId;
  final TdChatFolder? folder;

  TdEditChatFolder({
    required this.chatFolderId,
    this.folder,
  });

  @override
  String get tdType => 'editChatFolder';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editChatFolder',
      'chat_folder_id': chatFolderId,
      'folder': folder?.toMap(),
    };
  }
}


/// Edits an invite link for a chat folder
class TdEditChatFolderInviteLink extends TdObject {
  final int chatFolderId;
  final String inviteLink;
  final String name;
  final List<int> chatIds;

  TdEditChatFolderInviteLink({
    required this.chatFolderId,
    required this.inviteLink,
    required this.name,
    required this.chatIds,
  });

  @override
  String get tdType => 'editChatFolderInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editChatFolderInviteLink',
      'chat_folder_id': chatFolderId,
      'invite_link': inviteLink,
      'name': name,
      'chat_ids': chatIds,
    };
  }
}


/// Edits a non-primary invite link for a chat. Available for basic groups, supergroups, and channels. I...
class TdEditChatInviteLink extends TdObject {
  final int chatId;
  final String inviteLink;
  final String name;
  final int expirationDate;
  final int memberLimit;
  final bool createsJoinRequest;

  TdEditChatInviteLink({
    required this.chatId,
    required this.inviteLink,
    required this.name,
    required this.expirationDate,
    required this.memberLimit,
    required this.createsJoinRequest,
  });

  @override
  String get tdType => 'editChatInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editChatInviteLink',
      'chat_id': chatId,
      'invite_link': inviteLink,
      'name': name,
      'expiration_date': expirationDate,
      'member_limit': memberLimit,
      'creates_join_request': createsJoinRequest,
    };
  }
}


/// Edits a subscription invite link for a channel chat. Requires can_invite_users right in the chat for...
class TdEditChatSubscriptionInviteLink extends TdObject {
  final int chatId;
  final String inviteLink;
  final String name;

  TdEditChatSubscriptionInviteLink({
    required this.chatId,
    required this.inviteLink,
    required this.name,
  });

  @override
  String get tdType => 'editChatSubscriptionInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editChatSubscriptionInviteLink',
      'chat_id': chatId,
      'invite_link': inviteLink,
      'name': name,
    };
  }
}


/// Edits information about a custom local language pack in the current localization target. Can be call...
class TdEditCustomLanguagePackInfo extends TdObject {
  final TdLanguagePackInfo? info;

  TdEditCustomLanguagePackInfo({
    this.info,
  });

  @override
  String get tdType => 'editCustomLanguagePackInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editCustomLanguagePackInfo',
      'info': info?.toMap(),
    };
  }
}


/// Edits title and icon of a topic in a forum supergroup chat or a chat with a bot with topics; for sup...
class TdEditForumTopic extends TdObject {
  final int chatId;
  final int forumTopicId;
  final String name;
  final bool editIconCustomEmoji;
  final int iconCustomEmojiId;

  TdEditForumTopic({
    required this.chatId,
    required this.forumTopicId,
    required this.name,
    required this.editIconCustomEmoji,
    required this.iconCustomEmojiId,
  });

  @override
  String get tdType => 'editForumTopic';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editForumTopic',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
      'name': name,
      'edit_icon_custom_emoji': editIconCustomEmoji,
      'icon_custom_emoji_id': iconCustomEmojiId,
    };
  }
}


/// Edits the caption of an inline message sent via a bot; for bots only
class TdEditInlineMessageCaption extends TdObject {
  final String inlineMessageId;
  final TdReplyMarkup? replyMarkup;
  final TdFormattedText? caption;
  final bool showCaptionAboveMedia;

  TdEditInlineMessageCaption({
    required this.inlineMessageId,
    this.replyMarkup,
    this.caption,
    required this.showCaptionAboveMedia,
  });

  @override
  String get tdType => 'editInlineMessageCaption';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editInlineMessageCaption',
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup?.toMap(),
      'caption': caption?.toMap(),
      'show_caption_above_media': showCaptionAboveMedia,
    };
  }
}


/// Edits the content of a live location in an inline message sent via a bot; for bots only Otherwise, m...
class TdEditInlineMessageLiveLocation extends TdObject {
  final String inlineMessageId;
  final TdReplyMarkup? replyMarkup;
  final TdLocation? location;
  final int livePeriod;
  final int heading;
  final int proximityAlertRadius;

  TdEditInlineMessageLiveLocation({
    required this.inlineMessageId,
    this.replyMarkup,
    this.location,
    required this.livePeriod,
    required this.heading,
    required this.proximityAlertRadius,
  });

  @override
  String get tdType => 'editInlineMessageLiveLocation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editInlineMessageLiveLocation',
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup?.toMap(),
      'location': location?.toMap(),
      'live_period': livePeriod,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
    };
  }
}


/// Edits the media content of a message with a text, an animation, an audio, a document, a photo or a v...
class TdEditInlineMessageMedia extends TdObject {
  final String inlineMessageId;
  final TdReplyMarkup? replyMarkup;
  final TdInputMessageContent? inputMessageContent;

  TdEditInlineMessageMedia({
    required this.inlineMessageId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'editInlineMessageMedia';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editInlineMessageMedia',
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup?.toMap(),
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Edits the reply markup of an inline message sent via a bot; for bots only
class TdEditInlineMessageReplyMarkup extends TdObject {
  final String inlineMessageId;
  final TdReplyMarkup? replyMarkup;

  TdEditInlineMessageReplyMarkup({
    required this.inlineMessageId,
    this.replyMarkup,
  });

  @override
  String get tdType => 'editInlineMessageReplyMarkup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editInlineMessageReplyMarkup',
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup?.toMap(),
    };
  }
}


/// Edits the text of an inline text or game message sent via a bot; for bots only
class TdEditInlineMessageText extends TdObject {
  final String inlineMessageId;
  final TdReplyMarkup? replyMarkup;
  final TdInputMessageContent? inputMessageContent;

  TdEditInlineMessageText({
    required this.inlineMessageId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'editInlineMessageText';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editInlineMessageText',
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup?.toMap(),
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Edits the message content caption. Returns the edited message after the edit is completed on the ser...
class TdEditMessageCaption extends TdObject {
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdFormattedText? caption;
  final bool showCaptionAboveMedia;

  TdEditMessageCaption({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.caption,
    required this.showCaptionAboveMedia,
  });

  @override
  String get tdType => 'editMessageCaption';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editMessageCaption',
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'caption': caption?.toMap(),
      'show_caption_above_media': showCaptionAboveMedia,
    };
  }
}


/// Edits the message content of a checklist. Returns the edited message after the edit is completed on ...
class TdEditMessageChecklist extends TdObject {
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdInputChecklist? checklist;

  TdEditMessageChecklist({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.checklist,
  });

  @override
  String get tdType => 'editMessageChecklist';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editMessageChecklist',
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'checklist': checklist?.toMap(),
    };
  }
}


/// Edits the message content of a live location. Messages can be edited for a limited period of time sp...
class TdEditMessageLiveLocation extends TdObject {
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdLocation? location;
  final int livePeriod;
  final int heading;
  final int proximityAlertRadius;

  TdEditMessageLiveLocation({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.location,
    required this.livePeriod,
    required this.heading,
    required this.proximityAlertRadius,
  });

  @override
  String get tdType => 'editMessageLiveLocation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editMessageLiveLocation',
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'location': location?.toMap(),
      'live_period': livePeriod,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
    };
  }
}


/// Edits the media content of a message, including message caption. If only the caption needs to be edi...
class TdEditMessageMedia extends TdObject {
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdInputMessageContent? inputMessageContent;

  TdEditMessageMedia({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'editMessageMedia';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editMessageMedia',
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Edits the message reply markup; for bots only. Returns the edited message after the edit is complete...
class TdEditMessageReplyMarkup extends TdObject {
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;

  TdEditMessageReplyMarkup({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
  });

  @override
  String get tdType => 'editMessageReplyMarkup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editMessageReplyMarkup',
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
    };
  }
}


/// Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same a...
class TdEditMessageSchedulingState extends TdObject {
  final int chatId;
  final int messageId;
  final TdMessageSchedulingState? schedulingState;

  TdEditMessageSchedulingState({
    required this.chatId,
    required this.messageId,
    this.schedulingState,
  });

  @override
  String get tdType => 'editMessageSchedulingState';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editMessageSchedulingState',
      'chat_id': chatId,
      'message_id': messageId,
      'scheduling_state': schedulingState?.toMap(),
    };
  }
}


/// Edits the text of a message (or a text of a game message). Returns the edited message after the edit...
class TdEditMessageText extends TdObject {
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;
  final TdInputMessageContent? inputMessageContent;

  TdEditMessageText({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'editMessageText';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editMessageText',
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Edits an existing proxy server for network requests. Can be called before authorization
class TdEditProxy extends TdObject {
  final int proxyId;
  final String server;
  final int port;
  final bool enable;
  final TdProxyType? type;

  TdEditProxy({
    required this.proxyId,
    required this.server,
    required this.port,
    required this.enable,
    this.type,
  });

  @override
  String get tdType => 'editProxy';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editProxy',
      'proxy_id': proxyId,
      'server': server,
      'port': port,
      'enable': enable,
      'type': type?.toMap(),
    };
  }
}


/// Asynchronously edits the text, media or caption of a quick reply message. Use quickReplyMessage.can_...
class TdEditQuickReplyMessage extends TdObject {
  final int shortcutId;
  final int messageId;
  final TdInputMessageContent? inputMessageContent;

  TdEditQuickReplyMessage({
    required this.shortcutId,
    required this.messageId,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'editQuickReplyMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editQuickReplyMessage',
      'shortcut_id': shortcutId,
      'message_id': messageId,
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Cancels or re-enables Telegram Star subscription
class TdEditStarSubscription extends TdObject {
  final String subscriptionId;
  final bool isCanceled;

  TdEditStarSubscription({
    required this.subscriptionId,
    required this.isCanceled,
  });

  @override
  String get tdType => 'editStarSubscription';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editStarSubscription',
      'subscription_id': subscriptionId,
      'is_canceled': isCanceled,
    };
  }
}


/// Changes content and caption of a story. Can be called only if story.can_be_edited == true
class TdEditStory extends TdObject {
  final int storyPosterChatId;
  final int storyId;
  final TdInputStoryContent? content;
  final TdInputStoryAreas? areas;
  final TdFormattedText? caption;

  TdEditStory({
    required this.storyPosterChatId,
    required this.storyId,
    this.content,
    this.areas,
    this.caption,
  });

  @override
  String get tdType => 'editStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editStory',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
      'content': content?.toMap(),
      'areas': areas?.toMap(),
      'caption': caption?.toMap(),
    };
  }
}


/// Changes cover of a video story. Can be called only if story.can_be_edited == true and the story isn\'...
class TdEditStoryCover extends TdObject {
  final int storyPosterChatId;
  final int storyId;
  final double coverFrameTimestamp;

  TdEditStoryCover({
    required this.storyPosterChatId,
    required this.storyId,
    required this.coverFrameTimestamp,
  });

  @override
  String get tdType => 'editStoryCover';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editStoryCover',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
      'cover_frame_timestamp': coverFrameTimestamp,
    };
  }
}


/// Cancels or re-enables Telegram Star subscription for a user; for bots only
class TdEditUserStarSubscription extends TdObject {
  final int userId;
  final String telegramPaymentChargeId;
  final bool isCanceled;

  TdEditUserStarSubscription({
    required this.userId,
    required this.telegramPaymentChargeId,
    required this.isCanceled,
  });

  @override
  String get tdType => 'editUserStarSubscription';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'editUserStarSubscription',
      'user_id': userId,
      'telegram_payment_charge_id': telegramPaymentChargeId,
      'is_canceled': isCanceled,
    };
  }
}


/// Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization @proxy_...
class TdEnableProxy extends TdObject {
  final int proxyId;

  TdEnableProxy({
    required this.proxyId,
  });

  @override
  String get tdType => 'enableProxy';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'enableProxy',
      'proxy_id': proxyId,
    };
  }
}


/// Encrypts group call data before sending them over network using tgcalls
class TdEncryptGroupCallData extends TdObject {
  final int groupCallId;
  final TdGroupCallDataChannel? dataChannel;
  final String data;
  final int unencryptedPrefixSize;

  TdEncryptGroupCallData({
    required this.groupCallId,
    this.dataChannel,
    required this.data,
    required this.unencryptedPrefixSize,
  });

  @override
  String get tdType => 'encryptGroupCallData';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'encryptGroupCallData',
      'group_call_id': groupCallId,
      'data_channel': dataChannel?.toMap(),
      'data': data,
      'unencrypted_prefix_size': unencryptedPrefixSize,
    };
  }
}


/// Ends a group call. Requires groupCall.can_be_managed right for video chats and live stories or group...
class TdEndGroupCall extends TdObject {
  final int groupCallId;

  TdEndGroupCall({
    required this.groupCallId,
  });

  @override
  String get tdType => 'endGroupCall';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'endGroupCall',
      'group_call_id': groupCallId,
    };
  }
}


/// Ends recording of an active group call; for video chats only. Requires groupCall.can_be_managed righ...
class TdEndGroupCallRecording extends TdObject {
  final int groupCallId;

  TdEndGroupCallRecording({
    required this.groupCallId,
  });

  @override
  String get tdType => 'endGroupCallRecording';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'endGroupCallRecording',
      'group_call_id': groupCallId,
    };
  }
}


/// Ends screen sharing in a joined group call; not supported in live stories @group_call_id Group call ...
class TdEndGroupCallScreenSharing extends TdObject {
  final int groupCallId;

  TdEndGroupCallScreenSharing({
    required this.groupCallId,
  });

  @override
  String get tdType => 'endGroupCallScreenSharing';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'endGroupCallScreenSharing',
      'group_call_id': groupCallId,
    };
  }
}


/// Finishes the file generation
class TdFinishFileGeneration extends TdObject {
  final int generationId;
  final TdError? error;

  TdFinishFileGeneration({
    required this.generationId,
    this.error,
  });

  @override
  String get tdType => 'finishFileGeneration';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'finishFileGeneration',
      'generation_id': generationId,
      'error': error?.toMap(),
    };
  }
}


/// Forwards previously sent messages. Returns the forwarded messages in the same order as the message i...
class TdForwardMessages extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final int fromChatId;
  final List<int> messageIds;
  final TdMessageSendOptions? options;
  final bool sendCopy;
  final bool removeCaption;

  TdForwardMessages({
    required this.chatId,
    this.topicId,
    required this.fromChatId,
    required this.messageIds,
    this.options,
    required this.sendCopy,
    required this.removeCaption,
  });

  @override
  String get tdType => 'forwardMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'forwardMessages',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'from_chat_id': fromChatId,
      'message_ids': messageIds,
      'options': options?.toMap(),
      'send_copy': sendCopy,
      'remove_caption': removeCaption,
    };
  }
}


/// Returns the period of inactivity after which the account of the current user will automatically be d...
class TdGetAccountTtl extends TdObject {
  TdGetAccountTtl();

  @override
  String get tdType => 'getAccountTtl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAccountTtl',
    };
  }
}


/// Returns all active sessions of the current user
class TdGetActiveSessions extends TdObject {
  TdGetActiveSessions();

  @override
  String get tdType => 'getActiveSessions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getActiveSessions',
    };
  }
}


/// Returns all available Telegram Passport elements @password The 2-step verification password of the c...
class TdGetAllPassportElements extends TdObject {
  final String password;

  TdGetAllPassportElements({
    required this.password,
  });

  @override
  String get tdType => 'getAllPassportElements';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAllPassportElements',
      'password': password,
    };
  }
}


/// Returns unique emoji that correspond to stickers to be found by the getStickers(sticker_type, query,...
class TdGetAllStickerEmojis extends TdObject {
  final TdStickerType? stickerType;
  final String query;
  final int chatId;
  final bool returnOnlyMainEmoji;

  TdGetAllStickerEmojis({
    this.stickerType,
    required this.query,
    required this.chatId,
    required this.returnOnlyMainEmoji,
  });

  @override
  String get tdType => 'getAllStickerEmojis';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAllStickerEmojis',
      'sticker_type': stickerType?.toMap(),
      'query': query,
      'chat_id': chatId,
      'return_only_main_emoji': returnOnlyMainEmoji,
    };
  }
}


/// Returns an animated emoji corresponding to a given emoji. Returns a 404 error if the emoji has no an...
class TdGetAnimatedEmoji extends TdObject {
  final String emoji;

  TdGetAnimatedEmoji({
    required this.emoji,
  });

  @override
  String get tdType => 'getAnimatedEmoji';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAnimatedEmoji',
      'emoji': emoji,
    };
  }
}


/// Returns application config, provided by the server. Can be called before authorization
class TdGetApplicationConfig extends TdObject {
  TdGetApplicationConfig();

  @override
  String get tdType => 'getApplicationConfig';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getApplicationConfig',
    };
  }
}


/// Returns the link for downloading official Telegram application to be used when the current user invi...
class TdGetApplicationDownloadLink extends TdObject {
  TdGetApplicationDownloadLink();

  @override
  String get tdType => 'getApplicationDownloadLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getApplicationDownloadLink',
    };
  }
}


/// Returns settings for automatic moving of chats to and from the Archive chat lists
class TdGetArchiveChatListSettings extends TdObject {
  TdGetArchiveChatListSettings();

  @override
  String get tdType => 'getArchiveChatListSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getArchiveChatListSettings',
    };
  }
}


/// Returns a list of archived sticker sets
class TdGetArchivedStickerSets extends TdObject {
  final TdStickerType? stickerType;
  final int offsetStickerSetId;
  final int limit;

  TdGetArchivedStickerSets({
    this.stickerType,
    required this.offsetStickerSetId,
    required this.limit,
  });

  @override
  String get tdType => 'getArchivedStickerSets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getArchivedStickerSets',
      'sticker_type': stickerType?.toMap(),
      'offset_sticker_set_id': offsetStickerSetId,
      'limit': limit,
    };
  }
}


/// Returns a list of sticker sets attached to a file, including regular, mask, and emoji sticker sets. ...
class TdGetAttachedStickerSets extends TdObject {
  final int fileId;

  TdGetAttachedStickerSets({
    required this.fileId,
  });

  @override
  String get tdType => 'getAttachedStickerSets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAttachedStickerSets',
      'file_id': fileId,
    };
  }
}


/// Returns information about a bot that can be added to attachment or side menu @bot_user_id Bot\'s user...
class TdGetAttachmentMenuBot extends TdObject {
  final int botUserId;

  TdGetAttachmentMenuBot({
    required this.botUserId,
  });

  @override
  String get tdType => 'getAttachmentMenuBot';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAttachmentMenuBot',
      'bot_user_id': botUserId,
    };
  }
}


/// Returns parameters for authentication using a passkey as JSON-serialized string
class TdGetAuthenticationPasskeyParameters extends TdObject {
  TdGetAuthenticationPasskeyParameters();

  @override
  String get tdType => 'getAuthenticationPasskeyParameters';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAuthenticationPasskeyParameters',
    };
  }
}


/// Returns the current authorization state. This is an offline method. For informational purposes only....
class TdGetAuthorizationState extends TdObject {
  TdGetAuthorizationState();

  @override
  String get tdType => 'getAuthorizationState';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAuthorizationState',
    };
  }
}


/// Returns auto-download settings presets for the current user
class TdGetAutoDownloadSettingsPresets extends TdObject {
  TdGetAutoDownloadSettingsPresets();

  @override
  String get tdType => 'getAutoDownloadSettingsPresets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAutoDownloadSettingsPresets',
    };
  }
}


/// Returns autosave settings for the current user
class TdGetAutosaveSettings extends TdObject {
  TdGetAutosaveSettings();

  @override
  String get tdType => 'getAutosaveSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAutosaveSettings',
    };
  }
}


/// Returns the list of available chat boost slots for the current user
class TdGetAvailableChatBoostSlots extends TdObject {
  TdGetAvailableChatBoostSlots();

  @override
  String get tdType => 'getAvailableChatBoostSlots';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAvailableChatBoostSlots',
    };
  }
}


/// Returns gifts that can be sent to other users and channel chats
class TdGetAvailableGifts extends TdObject {
  TdGetAvailableGifts();

  @override
  String get tdType => 'getAvailableGifts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getAvailableGifts',
    };
  }
}


/// Constructs a persistent HTTP URL for a background @name Background name @type Background type; backg...
class TdGetBackgroundUrl extends TdObject {
  final String name;
  final TdBackgroundType? type;

  TdGetBackgroundUrl({
    required this.name,
    this.type,
  });

  @override
  String get tdType => 'getBackgroundUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBackgroundUrl',
      'name': name,
      'type': type?.toMap(),
    };
  }
}


/// Returns information about a bank card @bank_card_number The bank card number
class TdGetBankCardInfo extends TdObject {
  final String bankCardNumber;

  TdGetBankCardInfo({
    required this.bankCardNumber,
  });

  @override
  String get tdType => 'getBankCardInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBankCardInfo',
      'bank_card_number': bankCardNumber,
    };
  }
}


/// Returns information about a basic group by its identifier. This is an offline method if the current ...
class TdGetBasicGroup extends TdObject {
  final int basicGroupId;

  TdGetBasicGroup({
    required this.basicGroupId,
  });

  @override
  String get tdType => 'getBasicGroup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBasicGroup',
      'basic_group_id': basicGroupId,
    };
  }
}


/// Returns full information about a basic group by its identifier @basic_group_id Basic group identifie...
class TdGetBasicGroupFullInfo extends TdObject {
  final int basicGroupId;

  TdGetBasicGroupFullInfo({
    required this.basicGroupId,
  });

  @override
  String get tdType => 'getBasicGroupFullInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBasicGroupFullInfo',
      'basic_group_id': basicGroupId,
    };
  }
}


/// Returns users and chats that were blocked by the current user
class TdGetBlockedMessageSenders extends TdObject {
  final TdBlockList? blockList;
  final int offset;
  final int limit;

  TdGetBlockedMessageSenders({
    this.blockList,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getBlockedMessageSenders';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBlockedMessageSenders',
      'block_list': blockList?.toMap(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns the text shown in the chat with a bot if the chat is empty in the given language. Can be cal...
class TdGetBotInfoDescription extends TdObject {
  final int botUserId;
  final String languageCode;

  TdGetBotInfoDescription({
    required this.botUserId,
    required this.languageCode,
  });

  @override
  String get tdType => 'getBotInfoDescription';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBotInfoDescription',
      'bot_user_id': botUserId,
      'language_code': languageCode,
    };
  }
}


/// Returns the text shown on a bot\'s profile page and sent together with the link when users share the ...
class TdGetBotInfoShortDescription extends TdObject {
  final int botUserId;
  final String languageCode;

  TdGetBotInfoShortDescription({
    required this.botUserId,
    required this.languageCode,
  });

  @override
  String get tdType => 'getBotInfoShortDescription';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBotInfoShortDescription',
      'bot_user_id': botUserId,
      'language_code': languageCode,
    };
  }
}


/// Returns the list of media previews for the given language and the list of languages for which the bo...
class TdGetBotMediaPreviewInfo extends TdObject {
  final int botUserId;
  final String languageCode;

  TdGetBotMediaPreviewInfo({
    required this.botUserId,
    required this.languageCode,
  });

  @override
  String get tdType => 'getBotMediaPreviewInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBotMediaPreviewInfo',
      'bot_user_id': botUserId,
      'language_code': languageCode,
    };
  }
}


/// Returns the list of media previews of a bot @bot_user_id Identifier of the target bot. The bot must ...
class TdGetBotMediaPreviews extends TdObject {
  final int botUserId;

  TdGetBotMediaPreviews({
    required this.botUserId,
  });

  @override
  String get tdType => 'getBotMediaPreviews';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBotMediaPreviews',
      'bot_user_id': botUserId,
    };
  }
}


/// Returns the name of a bot in the given language. Can be called only if userTypeBot.can_be_edited == ...
class TdGetBotName extends TdObject {
  final int botUserId;
  final String languageCode;

  TdGetBotName({
    required this.botUserId,
    required this.languageCode,
  });

  @override
  String get tdType => 'getBotName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBotName',
      'bot_user_id': botUserId,
      'language_code': languageCode,
    };
  }
}


/// Returns approximate number of bots similar to the given bot
class TdGetBotSimilarBotCount extends TdObject {
  final int botUserId;
  final bool returnLocal;

  TdGetBotSimilarBotCount({
    required this.botUserId,
    required this.returnLocal,
  });

  @override
  String get tdType => 'getBotSimilarBotCount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBotSimilarBotCount',
      'bot_user_id': botUserId,
      'return_local': returnLocal,
    };
  }
}


/// Returns a list of bots similar to the given bot @bot_user_id User identifier of the target bot
class TdGetBotSimilarBots extends TdObject {
  final int botUserId;

  TdGetBotSimilarBots({
    required this.botUserId,
  });

  @override
  String get tdType => 'getBotSimilarBots';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBotSimilarBots',
      'bot_user_id': botUserId,
    };
  }
}


/// Returns the amount of Telegram Stars owned by a business account; for bots only @business_connection...
class TdGetBusinessAccountStarAmount extends TdObject {
  final String businessConnectionId;

  TdGetBusinessAccountStarAmount({
    required this.businessConnectionId,
  });

  @override
  String get tdType => 'getBusinessAccountStarAmount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBusinessAccountStarAmount',
      'business_connection_id': businessConnectionId,
    };
  }
}


/// Returns information about a business chat link @link_name Name of the link
class TdGetBusinessChatLinkInfo extends TdObject {
  final String linkName;

  TdGetBusinessChatLinkInfo({
    required this.linkName,
  });

  @override
  String get tdType => 'getBusinessChatLinkInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBusinessChatLinkInfo',
      'link_name': linkName,
    };
  }
}


/// Returns business chat links created for the current account
class TdGetBusinessChatLinks extends TdObject {
  TdGetBusinessChatLinks();

  @override
  String get tdType => 'getBusinessChatLinks';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBusinessChatLinks',
    };
  }
}


/// Returns the business bot that is connected to the current user account. Returns a 404 error if there...
class TdGetBusinessConnectedBot extends TdObject {
  TdGetBusinessConnectedBot();

  @override
  String get tdType => 'getBusinessConnectedBot';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBusinessConnectedBot',
    };
  }
}


/// Returns information about a business connection by its identifier; for bots only @connection_id Iden...
class TdGetBusinessConnection extends TdObject {
  final String connectionId;

  TdGetBusinessConnection({
    required this.connectionId,
  });

  @override
  String get tdType => 'getBusinessConnection';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBusinessConnection',
      'connection_id': connectionId,
    };
  }
}


/// Returns information about features, available to Business users @source Source of the request; pass ...
class TdGetBusinessFeatures extends TdObject {
  final TdBusinessFeature? source;

  TdGetBusinessFeatures({
    this.source,
  });

  @override
  String get tdType => 'getBusinessFeatures';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getBusinessFeatures',
      'source': source?.toMap(),
    };
  }
}


/// Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fai...
class TdGetCallbackQueryAnswer extends TdObject {
  final int chatId;
  final int messageId;
  final TdCallbackQueryPayload? payload;

  TdGetCallbackQueryAnswer({
    required this.chatId,
    required this.messageId,
    this.payload,
  });

  @override
  String get tdType => 'getCallbackQueryAnswer';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCallbackQueryAnswer',
      'chat_id': chatId,
      'message_id': messageId,
      'payload': payload?.toMap(),
    };
  }
}


/// Returns information about a message with the callback button that originated a callback query; for b...
class TdGetCallbackQueryMessage extends TdObject {
  final int chatId;
  final int messageId;
  final int callbackQueryId;

  TdGetCallbackQueryMessage({
    required this.chatId,
    required this.messageId,
    required this.callbackQueryId,
  });

  @override
  String get tdType => 'getCallbackQueryMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCallbackQueryMessage',
      'chat_id': chatId,
      'message_id': messageId,
      'callback_query_id': callbackQueryId,
    };
  }
}


/// Returns information about a chat by its identifier. This is an offline method if the current user is...
class TdGetChat extends TdObject {
  final int chatId;

  TdGetChat({
    required this.chatId,
  });

  @override
  String get tdType => 'getChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChat',
      'chat_id': chatId,
    };
  }
}


/// Returns the list of active stories posted by the given chat @chat_id Chat identifier
class TdGetChatActiveStories extends TdObject {
  final int chatId;

  TdGetChatActiveStories({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatActiveStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatActiveStories',
      'chat_id': chatId,
    };
  }
}


/// Returns a list of administrators of the chat with their custom titles @chat_id Chat identifier
class TdGetChatAdministrators extends TdObject {
  final int chatId;

  TdGetChatAdministrators({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatAdministrators';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatAdministrators',
      'chat_id': chatId,
    };
  }
}


/// Returns the list of all stories posted by the given chat; requires can_edit_stories administrator ri...
class TdGetChatArchivedStories extends TdObject {
  final int chatId;
  final int fromStoryId;
  final int limit;

  TdGetChatArchivedStories({
    required this.chatId,
    required this.fromStoryId,
    required this.limit,
  });

  @override
  String get tdType => 'getChatArchivedStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatArchivedStories',
      'chat_id': chatId,
      'from_story_id': fromStoryId,
      'limit': limit,
    };
  }
}


/// Returns the list of message sender identifiers, which can be used to send messages in a chat @chat_i...
class TdGetChatAvailableMessageSenders extends TdObject {
  final int chatId;

  TdGetChatAvailableMessageSenders({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatAvailableMessageSenders';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatAvailableMessageSenders',
      'chat_id': chatId,
    };
  }
}


/// Returns the list of message sender identifiers, which can be used to send a paid reaction in a chat ...
class TdGetChatAvailablePaidMessageReactionSenders extends TdObject {
  final int chatId;

  TdGetChatAvailablePaidMessageReactionSenders({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatAvailablePaidMessageReactionSenders';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatAvailablePaidMessageReactionSenders',
      'chat_id': chatId,
    };
  }
}


/// Returns the list of features available for different chat boost levels. This is an offline method
class TdGetChatBoostFeatures extends TdObject {
  final bool isChannel;

  TdGetChatBoostFeatures({
    required this.isChannel,
  });

  @override
  String get tdType => 'getChatBoostFeatures';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatBoostFeatures',
      'is_channel': isChannel,
    };
  }
}


/// Returns the list of features available on the specific chat boost level. This is an offline method
class TdGetChatBoostLevelFeatures extends TdObject {
  final bool isChannel;
  final int level;

  TdGetChatBoostLevelFeatures({
    required this.isChannel,
    required this.level,
  });

  @override
  String get tdType => 'getChatBoostLevelFeatures';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatBoostLevelFeatures',
      'is_channel': isChannel,
      'level': level,
    };
  }
}


/// Returns an HTTPS link to boost the specified supergroup or channel chat @chat_id Identifier of the c...
class TdGetChatBoostLink extends TdObject {
  final int chatId;

  TdGetChatBoostLink({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatBoostLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatBoostLink',
      'chat_id': chatId,
    };
  }
}


/// Returns information about a link to boost a chat. Can be called for any internal link of the type in...
class TdGetChatBoostLinkInfo extends TdObject {
  final String url;

  TdGetChatBoostLinkInfo({
    required this.url,
  });

  @override
  String get tdType => 'getChatBoostLinkInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatBoostLinkInfo',
      'url': url,
    };
  }
}


/// Returns the current boost status for a supergroup or a channel chat @chat_id Identifier of the chat
class TdGetChatBoostStatus extends TdObject {
  final int chatId;

  TdGetChatBoostStatus({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatBoostStatus';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatBoostStatus',
      'chat_id': chatId,
    };
  }
}


/// Returns the list of boosts applied to a chat; requires administrator rights in the chat
class TdGetChatBoosts extends TdObject {
  final int chatId;
  final bool onlyGiftCodes;
  final String offset;
  final int limit;

  TdGetChatBoosts({
    required this.chatId,
    required this.onlyGiftCodes,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getChatBoosts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatBoosts',
      'chat_id': chatId,
      'only_gift_codes': onlyGiftCodes,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns a list of service actions taken by chat members and administrators in the last 48 hours. Ava...
class TdGetChatEventLog extends TdObject {
  final int chatId;
  final String query;
  final int fromEventId;
  final int limit;
  final TdChatEventLogFilters? filters;
  final List<int> userIds;

  TdGetChatEventLog({
    required this.chatId,
    required this.query,
    required this.fromEventId,
    required this.limit,
    this.filters,
    required this.userIds,
  });

  @override
  String get tdType => 'getChatEventLog';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatEventLog',
      'chat_id': chatId,
      'query': query,
      'from_event_id': fromEventId,
      'limit': limit,
      'filters': filters?.toMap(),
      'user_ids': userIds,
    };
  }
}


/// Returns information about a chat folder by its identifier @chat_folder_id Chat folder identifier
class TdGetChatFolder extends TdObject {
  final int chatFolderId;

  TdGetChatFolder({
    required this.chatFolderId,
  });

  @override
  String get tdType => 'getChatFolder';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatFolder',
      'chat_folder_id': chatFolderId,
    };
  }
}


/// Returns approximate number of chats in a being created chat folder. Main and archive chat lists must...
class TdGetChatFolderChatCount extends TdObject {
  final TdChatFolder? folder;

  TdGetChatFolderChatCount({
    this.folder,
  });

  @override
  String get tdType => 'getChatFolderChatCount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatFolderChatCount',
      'folder': folder?.toMap(),
    };
  }
}


/// Returns identifiers of pinned or always included chats from a chat folder, which are suggested to be...
class TdGetChatFolderChatsToLeave extends TdObject {
  final int chatFolderId;

  TdGetChatFolderChatsToLeave({
    required this.chatFolderId,
  });

  @override
  String get tdType => 'getChatFolderChatsToLeave';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatFolderChatsToLeave',
      'chat_folder_id': chatFolderId,
    };
  }
}


/// Returns default icon name for a folder. Can be called synchronously @folder Chat folder
class TdGetChatFolderDefaultIconName extends TdObject {
  final TdChatFolder? folder;

  TdGetChatFolderDefaultIconName({
    this.folder,
  });

  @override
  String get tdType => 'getChatFolderDefaultIconName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatFolderDefaultIconName',
      'folder': folder?.toMap(),
    };
  }
}


/// Returns invite links created by the current user for a shareable chat folder @chat_folder_id Chat fo...
class TdGetChatFolderInviteLinks extends TdObject {
  final int chatFolderId;

  TdGetChatFolderInviteLinks({
    required this.chatFolderId,
  });

  @override
  String get tdType => 'getChatFolderInviteLinks';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatFolderInviteLinks',
      'chat_folder_id': chatFolderId,
    };
  }
}


/// Returns new chats added to a shareable chat folder by its owner. The method must be called at most o...
class TdGetChatFolderNewChats extends TdObject {
  final int chatFolderId;

  TdGetChatFolderNewChats({
    required this.chatFolderId,
  });

  @override
  String get tdType => 'getChatFolderNewChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatFolderNewChats',
      'chat_folder_id': chatFolderId,
    };
  }
}


/// Returns messages in a chat. The messages are returned in reverse chronological order (i.e., in order...
class TdGetChatHistory extends TdObject {
  final int chatId;
  final int fromMessageId;
  final int offset;
  final int limit;
  final bool onlyLocal;

  TdGetChatHistory({
    required this.chatId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
    required this.onlyLocal,
  });

  @override
  String get tdType => 'getChatHistory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatHistory',
      'chat_id': chatId,
      'from_message_id': fromMessageId,
      'offset': offset,
      'limit': limit,
      'only_local': onlyLocal,
    };
  }
}


/// Returns information about an invite link. Requires administrator privileges and can_invite_users rig...
class TdGetChatInviteLink extends TdObject {
  final int chatId;
  final String inviteLink;

  TdGetChatInviteLink({
    required this.chatId,
    required this.inviteLink,
  });

  @override
  String get tdType => 'getChatInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatInviteLink',
      'chat_id': chatId,
      'invite_link': inviteLink,
    };
  }
}


/// Returns the list of chat administrators with number of their invite links. Requires owner privileges...
class TdGetChatInviteLinkCounts extends TdObject {
  final int chatId;

  TdGetChatInviteLinkCounts({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatInviteLinkCounts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatInviteLinkCounts',
      'chat_id': chatId,
    };
  }
}


/// Returns chat members joined a chat via an invite link. Requires administrator privileges and can_inv...
class TdGetChatInviteLinkMembers extends TdObject {
  final int chatId;
  final String inviteLink;
  final bool onlyWithExpiredSubscription;
  final TdChatInviteLinkMember? offsetMember;
  final int limit;

  TdGetChatInviteLinkMembers({
    required this.chatId,
    required this.inviteLink,
    required this.onlyWithExpiredSubscription,
    this.offsetMember,
    required this.limit,
  });

  @override
  String get tdType => 'getChatInviteLinkMembers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatInviteLinkMembers',
      'chat_id': chatId,
      'invite_link': inviteLink,
      'only_with_expired_subscription': onlyWithExpiredSubscription,
      'offset_member': offsetMember?.toMap(),
      'limit': limit,
    };
  }
}


/// Returns invite links for a chat created by specified administrator. Requires administrator privilege...
class TdGetChatInviteLinks extends TdObject {
  final int chatId;
  final int creatorUserId;
  final bool isRevoked;
  final int offsetDate;
  final String offsetInviteLink;
  final int limit;

  TdGetChatInviteLinks({
    required this.chatId,
    required this.creatorUserId,
    required this.isRevoked,
    required this.offsetDate,
    required this.offsetInviteLink,
    required this.limit,
  });

  @override
  String get tdType => 'getChatInviteLinks';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatInviteLinks',
      'chat_id': chatId,
      'creator_user_id': creatorUserId,
      'is_revoked': isRevoked,
      'offset_date': offsetDate,
      'offset_invite_link': offsetInviteLink,
      'limit': limit,
    };
  }
}


/// Returns pending join requests in a chat
class TdGetChatJoinRequests extends TdObject {
  final int chatId;
  final String inviteLink;
  final String query;
  final TdChatJoinRequest? offsetRequest;
  final int limit;

  TdGetChatJoinRequests({
    required this.chatId,
    required this.inviteLink,
    required this.query,
    this.offsetRequest,
    required this.limit,
  });

  @override
  String get tdType => 'getChatJoinRequests';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatJoinRequests',
      'chat_id': chatId,
      'invite_link': inviteLink,
      'query': query,
      'offset_request': offsetRequest?.toMap(),
      'limit': limit,
    };
  }
}


/// Returns chat lists to which the chat can be added. This is an offline method @chat_id Chat identifie...
class TdGetChatListsToAddChat extends TdObject {
  final int chatId;

  TdGetChatListsToAddChat({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatListsToAddChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatListsToAddChat',
      'chat_id': chatId,
    };
  }
}


/// Returns information about a single member of a chat @chat_id Chat identifier @member_id Member ident...
class TdGetChatMember extends TdObject {
  final int chatId;
  final TdMessageSender? memberId;

  TdGetChatMember({
    required this.chatId,
    this.memberId,
  });

  @override
  String get tdType => 'getChatMember';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatMember',
      'chat_id': chatId,
      'member_id': memberId?.toMap(),
    };
  }
}


/// Returns the last message sent in a chat no later than the specified date. Returns a 404 error if suc...
class TdGetChatMessageByDate extends TdObject {
  final int chatId;
  final int date;

  TdGetChatMessageByDate({
    required this.chatId,
    required this.date,
  });

  @override
  String get tdType => 'getChatMessageByDate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatMessageByDate',
      'chat_id': chatId,
      'date': date,
    };
  }
}


/// Returns information about the next messages of the specified type in the chat split by days. Returns...
class TdGetChatMessageCalendar extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final TdSearchMessagesFilter? filter;
  final int fromMessageId;

  TdGetChatMessageCalendar({
    required this.chatId,
    this.topicId,
    this.filter,
    required this.fromMessageId,
  });

  @override
  String get tdType => 'getChatMessageCalendar';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatMessageCalendar',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'filter': filter?.toMap(),
      'from_message_id': fromMessageId,
    };
  }
}


/// Returns approximate number of messages of the specified type in the chat or its topic
class TdGetChatMessageCount extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final TdSearchMessagesFilter? filter;
  final bool returnLocal;

  TdGetChatMessageCount({
    required this.chatId,
    this.topicId,
    this.filter,
    required this.returnLocal,
  });

  @override
  String get tdType => 'getChatMessageCount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatMessageCount',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'filter': filter?.toMap(),
      'return_local': returnLocal,
    };
  }
}


/// Returns approximate 1-based position of a message among messages, which can be found by the specifie...
class TdGetChatMessagePosition extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final TdSearchMessagesFilter? filter;
  final int messageId;

  TdGetChatMessagePosition({
    required this.chatId,
    this.topicId,
    this.filter,
    required this.messageId,
  });

  @override
  String get tdType => 'getChatMessagePosition';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatMessagePosition',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'filter': filter?.toMap(),
      'message_id': messageId,
    };
  }
}


/// Returns the list of chats with non-default notification settings for new messages
class TdGetChatNotificationSettingsExceptions extends TdObject {
  final TdNotificationSettingsScope? scope;
  final bool compareSound;

  TdGetChatNotificationSettingsExceptions({
    this.scope,
    required this.compareSound,
  });

  @override
  String get tdType => 'getChatNotificationSettingsExceptions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatNotificationSettingsExceptions',
      'scope': scope?.toMap(),
      'compare_sound': compareSound,
    };
  }
}


/// Returns information about a newest pinned message in the chat. Returns a 404 error if the message do...
class TdGetChatPinnedMessage extends TdObject {
  final int chatId;

  TdGetChatPinnedMessage({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatPinnedMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatPinnedMessage',
      'chat_id': chatId,
    };
  }
}


/// Returns the list of stories that posted by the given chat to its chat page. If from_story_id == 0, t...
class TdGetChatPostedToChatPageStories extends TdObject {
  final int chatId;
  final int fromStoryId;
  final int limit;

  TdGetChatPostedToChatPageStories({
    required this.chatId,
    required this.fromStoryId,
    required this.limit,
  });

  @override
  String get tdType => 'getChatPostedToChatPageStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatPostedToChatPageStories',
      'chat_id': chatId,
      'from_story_id': fromStoryId,
      'limit': limit,
    };
  }
}


/// Returns detailed revenue statistics about a chat. Currently, this method can be used only for channe...
class TdGetChatRevenueStatistics extends TdObject {
  final int chatId;
  final bool isDark;

  TdGetChatRevenueStatistics({
    required this.chatId,
    required this.isDark,
  });

  @override
  String get tdType => 'getChatRevenueStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatRevenueStatistics',
      'chat_id': chatId,
      'is_dark': isDark,
    };
  }
}


/// Returns the list of revenue transactions for a chat. Currently, this method can be used only for cha...
class TdGetChatRevenueTransactions extends TdObject {
  final int chatId;
  final String offset;
  final int limit;

  TdGetChatRevenueTransactions({
    required this.chatId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getChatRevenueTransactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatRevenueTransactions',
      'chat_id': chatId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns a URL for chat revenue withdrawal; requires owner privileges in the channel chat or the bot....
class TdGetChatRevenueWithdrawalUrl extends TdObject {
  final int chatId;
  final String password;

  TdGetChatRevenueWithdrawalUrl({
    required this.chatId,
    required this.password,
  });

  @override
  String get tdType => 'getChatRevenueWithdrawalUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatRevenueWithdrawalUrl',
      'chat_id': chatId,
      'password': password,
    };
  }
}


/// Returns all scheduled messages in a chat. The messages are returned in reverse chronological order (...
class TdGetChatScheduledMessages extends TdObject {
  final int chatId;

  TdGetChatScheduledMessages({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatScheduledMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatScheduledMessages',
      'chat_id': chatId,
    };
  }
}


/// Returns approximate number of chats similar to the given chat
class TdGetChatSimilarChatCount extends TdObject {
  final int chatId;
  final bool returnLocal;

  TdGetChatSimilarChatCount({
    required this.chatId,
    required this.returnLocal,
  });

  @override
  String get tdType => 'getChatSimilarChatCount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatSimilarChatCount',
      'chat_id': chatId,
      'return_local': returnLocal,
    };
  }
}


/// Returns a list of chats similar to the given chat @chat_id Identifier of the target chat; must be an...
class TdGetChatSimilarChats extends TdObject {
  final int chatId;

  TdGetChatSimilarChats({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatSimilarChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatSimilarChats',
      'chat_id': chatId,
    };
  }
}


/// Returns sparse positions of messages of the specified type in the chat to be used for shared media s...
class TdGetChatSparseMessagePositions extends TdObject {
  final int chatId;
  final TdSearchMessagesFilter? filter;
  final int fromMessageId;
  final int limit;
  final int savedMessagesTopicId;

  TdGetChatSparseMessagePositions({
    required this.chatId,
    this.filter,
    required this.fromMessageId,
    required this.limit,
    required this.savedMessagesTopicId,
  });

  @override
  String get tdType => 'getChatSparseMessagePositions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatSparseMessagePositions',
      'chat_id': chatId,
      'filter': filter?.toMap(),
      'from_message_id': fromMessageId,
      'limit': limit,
      'saved_messages_topic_id': savedMessagesTopicId,
    };
  }
}


/// Returns sponsored messages to be shown in a chat; for channel chats and chats with bots only @chat_i...
class TdGetChatSponsoredMessages extends TdObject {
  final int chatId;

  TdGetChatSponsoredMessages({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatSponsoredMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatSponsoredMessages',
      'chat_id': chatId,
    };
  }
}


/// Returns detailed statistics about a chat. Currently, this method can be used only for supergroups an...
class TdGetChatStatistics extends TdObject {
  final int chatId;
  final bool isDark;

  TdGetChatStatistics({
    required this.chatId,
    required this.isDark,
  });

  @override
  String get tdType => 'getChatStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatStatistics',
      'chat_id': chatId,
      'is_dark': isDark,
    };
  }
}


/// Returns the list of story albums owned by the given chat @chat_id Chat identifier
class TdGetChatStoryAlbums extends TdObject {
  final int chatId;

  TdGetChatStoryAlbums({
    required this.chatId,
  });

  @override
  String get tdType => 'getChatStoryAlbums';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatStoryAlbums',
      'chat_id': chatId,
    };
  }
}


/// Returns interactions with a story posted in a chat. Can be used only if story is posted on behalf of...
class TdGetChatStoryInteractions extends TdObject {
  final int storyPosterChatId;
  final int storyId;
  final TdReactionType? reactionType;
  final bool preferForwards;
  final String offset;
  final int limit;

  TdGetChatStoryInteractions({
    required this.storyPosterChatId,
    required this.storyId,
    this.reactionType,
    required this.preferForwards,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getChatStoryInteractions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatStoryInteractions',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
      'reaction_type': reactionType?.toMap(),
      'prefer_forwards': preferForwards,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns an ordered list of chats from the beginning of a chat list. For informational purposes only....
class TdGetChats extends TdObject {
  final TdChatList? chatList;
  final int limit;

  TdGetChats({
    this.chatList,
    required this.limit,
  });

  @override
  String get tdType => 'getChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChats',
      'chat_list': chatList?.toMap(),
      'limit': limit,
    };
  }
}


/// Returns identifiers of chats from a chat folder, suitable for adding to a chat folder invite link @c...
class TdGetChatsForChatFolderInviteLink extends TdObject {
  final int chatFolderId;

  TdGetChatsForChatFolderInviteLink({
    required this.chatFolderId,
  });

  @override
  String get tdType => 'getChatsForChatFolderInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatsForChatFolderInviteLink',
      'chat_folder_id': chatFolderId,
    };
  }
}


/// Returns supergroup and channel chats in which the current user has the right to post stories. The ch...
class TdGetChatsToPostStories extends TdObject {
  TdGetChatsToPostStories();

  @override
  String get tdType => 'getChatsToPostStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getChatsToPostStories',
    };
  }
}


/// Returns all close friends of the current user
class TdGetCloseFriends extends TdObject {
  TdGetCloseFriends();

  @override
  String get tdType => 'getCloseFriends';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCloseFriends',
    };
  }
}


/// Returns information about a given collectible item that was purchased at https://fragment.com
class TdGetCollectibleItemInfo extends TdObject {
  final TdCollectibleItemType? type;

  TdGetCollectibleItemInfo({
    this.type,
  });

  @override
  String get tdType => 'getCollectibleItemInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCollectibleItemInfo',
      'type': type?.toMap(),
    };
  }
}


/// Returns the list of commands supported by the bot for the given user scope and language; for bots on...
class TdGetCommands extends TdObject {
  final TdBotCommandScope? scope;
  final String languageCode;

  TdGetCommands({
    this.scope,
    required this.languageCode,
  });

  @override
  String get tdType => 'getCommands';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCommands',
      'scope': scope?.toMap(),
      'language_code': languageCode,
    };
  }
}


/// Returns an affiliate program that were connected to the given affiliate by identifier of the bot tha...
class TdGetConnectedAffiliateProgram extends TdObject {
  final TdAffiliateType? affiliate;
  final int botUserId;

  TdGetConnectedAffiliateProgram({
    this.affiliate,
    required this.botUserId,
  });

  @override
  String get tdType => 'getConnectedAffiliateProgram';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getConnectedAffiliateProgram',
      'affiliate': affiliate?.toMap(),
      'bot_user_id': botUserId,
    };
  }
}


/// Returns affiliate programs that were connected to the given affiliate
class TdGetConnectedAffiliatePrograms extends TdObject {
  final TdAffiliateType? affiliate;
  final String offset;
  final int limit;

  TdGetConnectedAffiliatePrograms({
    this.affiliate,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getConnectedAffiliatePrograms';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getConnectedAffiliatePrograms',
      'affiliate': affiliate?.toMap(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns all website where the current user used Telegram to log in
class TdGetConnectedWebsites extends TdObject {
  TdGetConnectedWebsites();

  @override
  String get tdType => 'getConnectedWebsites';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getConnectedWebsites',
    };
  }
}


/// Returns all contacts of the user
class TdGetContacts extends TdObject {
  TdGetContacts();

  @override
  String get tdType => 'getContacts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getContacts',
    };
  }
}


/// Returns information about existing countries. Can be called before authorization
class TdGetCountries extends TdObject {
  TdGetCountries();

  @override
  String get tdType => 'getCountries';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCountries',
    };
  }
}


/// Uses the current IP address to find the current country. Returns two-letter ISO 3166-1 alpha-2 count...
class TdGetCountryCode extends TdObject {
  TdGetCountryCode();

  @override
  String get tdType => 'getCountryCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCountryCode',
    };
  }
}


/// Returns an emoji for the given country. Returns an empty string on failure. Can be called synchronou...
class TdGetCountryFlagEmoji extends TdObject {
  final String countryCode;

  TdGetCountryFlagEmoji({
    required this.countryCode,
  });

  @override
  String get tdType => 'getCountryFlagEmoji';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCountryFlagEmoji',
      'country_code': countryCode,
    };
  }
}


/// Returns a list of public chats of the specified type, owned by the user @type Type of the public cha...
class TdGetCreatedPublicChats extends TdObject {
  final TdPublicChatType? type;

  TdGetCreatedPublicChats({
    this.type,
  });

  @override
  String get tdType => 'getCreatedPublicChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCreatedPublicChats',
      'type': type?.toMap(),
    };
  }
}


/// Returns all updates needed to restore current TDLib state, i.e. all actual updateAuthorizationState/...
class TdGetCurrentState extends TdObject {
  TdGetCurrentState();

  @override
  String get tdType => 'getCurrentState';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCurrentState',
    };
  }
}


/// Returns the current weather in the given location @location The location
class TdGetCurrentWeather extends TdObject {
  final TdLocation? location;

  TdGetCurrentWeather({
    this.location,
  });

  @override
  String get tdType => 'getCurrentWeather';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCurrentWeather',
      'location': location?.toMap(),
    };
  }
}


/// Returns TGS stickers with generic animations for custom emoji reactions
class TdGetCustomEmojiReactionAnimations extends TdObject {
  TdGetCustomEmojiReactionAnimations();

  @override
  String get tdType => 'getCustomEmojiReactionAnimations';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCustomEmojiReactionAnimations',
    };
  }
}


/// Returns the list of custom emoji stickers by their identifiers. Stickers are returned in arbitrary o...
class TdGetCustomEmojiStickers extends TdObject {
  final List<int> customEmojiIds;

  TdGetCustomEmojiStickers({
    required this.customEmojiIds,
  });

  @override
  String get tdType => 'getCustomEmojiStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getCustomEmojiStickers',
      'custom_emoji_ids': customEmojiIds,
    };
  }
}


/// Returns database statistics
class TdGetDatabaseStatistics extends TdObject {
  TdGetDatabaseStatistics();

  @override
  String get tdType => 'getDatabaseStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDatabaseStatistics',
    };
  }
}


/// Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_uns...
class TdGetDeepLinkInfo extends TdObject {
  final String link;

  TdGetDeepLinkInfo({
    required this.link,
  });

  @override
  String get tdType => 'getDeepLinkInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDeepLinkInfo',
      'link': link,
    };
  }
}


/// Returns default list of custom emoji stickers for reply background
class TdGetDefaultBackgroundCustomEmojiStickers extends TdObject {
  TdGetDefaultBackgroundCustomEmojiStickers();

  @override
  String get tdType => 'getDefaultBackgroundCustomEmojiStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDefaultBackgroundCustomEmojiStickers',
    };
  }
}


/// Returns default emoji statuses for chats
class TdGetDefaultChatEmojiStatuses extends TdObject {
  TdGetDefaultChatEmojiStatuses();

  @override
  String get tdType => 'getDefaultChatEmojiStatuses';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDefaultChatEmojiStatuses',
    };
  }
}


/// Returns default list of custom emoji stickers for placing on a chat photo
class TdGetDefaultChatPhotoCustomEmojiStickers extends TdObject {
  TdGetDefaultChatPhotoCustomEmojiStickers();

  @override
  String get tdType => 'getDefaultChatPhotoCustomEmojiStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDefaultChatPhotoCustomEmojiStickers',
    };
  }
}


/// Returns default emoji statuses for self status
class TdGetDefaultEmojiStatuses extends TdObject {
  TdGetDefaultEmojiStatuses();

  @override
  String get tdType => 'getDefaultEmojiStatuses';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDefaultEmojiStatuses',
    };
  }
}


/// Returns default message auto-delete time setting for new chats
class TdGetDefaultMessageAutoDeleteTime extends TdObject {
  TdGetDefaultMessageAutoDeleteTime();

  @override
  String get tdType => 'getDefaultMessageAutoDeleteTime';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDefaultMessageAutoDeleteTime',
    };
  }
}


/// Returns default list of custom emoji stickers for placing on a profile photo
class TdGetDefaultProfilePhotoCustomEmojiStickers extends TdObject {
  TdGetDefaultProfilePhotoCustomEmojiStickers();

  @override
  String get tdType => 'getDefaultProfilePhotoCustomEmojiStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDefaultProfilePhotoCustomEmojiStickers',
    };
  }
}


/// Returns information about the topic in a channel direct messages chat administered by the current us...
class TdGetDirectMessagesChatTopic extends TdObject {
  final int chatId;
  final int topicId;

  TdGetDirectMessagesChatTopic({
    required this.chatId,
    required this.topicId,
  });

  @override
  String get tdType => 'getDirectMessagesChatTopic';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDirectMessagesChatTopic',
      'chat_id': chatId,
      'topic_id': topicId,
    };
  }
}


/// Returns messages in the topic in a channel direct messages chat administered by the current user. Th...
class TdGetDirectMessagesChatTopicHistory extends TdObject {
  final int chatId;
  final int topicId;
  final int fromMessageId;
  final int offset;
  final int limit;

  TdGetDirectMessagesChatTopicHistory({
    required this.chatId,
    required this.topicId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getDirectMessagesChatTopicHistory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDirectMessagesChatTopicHistory',
      'chat_id': chatId,
      'topic_id': topicId,
      'from_message_id': fromMessageId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns the last message sent in the topic in a channel direct messages chat administered by the cur...
class TdGetDirectMessagesChatTopicMessageByDate extends TdObject {
  final int chatId;
  final int topicId;
  final int date;

  TdGetDirectMessagesChatTopicMessageByDate({
    required this.chatId,
    required this.topicId,
    required this.date,
  });

  @override
  String get tdType => 'getDirectMessagesChatTopicMessageByDate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDirectMessagesChatTopicMessageByDate',
      'chat_id': chatId,
      'topic_id': topicId,
      'date': date,
    };
  }
}


/// Returns the total number of Telegram Stars received by the channel chat for direct messages from the...
class TdGetDirectMessagesChatTopicRevenue extends TdObject {
  final int chatId;
  final int topicId;

  TdGetDirectMessagesChatTopicRevenue({
    required this.chatId,
    required this.topicId,
  });

  @override
  String get tdType => 'getDirectMessagesChatTopicRevenue';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDirectMessagesChatTopicRevenue',
      'chat_id': chatId,
      'topic_id': topicId,
    };
  }
}


/// Returns the list of emoji statuses, which can\'t be used as chat emoji status, even if they are from ...
class TdGetDisallowedChatEmojiStatuses extends TdObject {
  TdGetDisallowedChatEmojiStatuses();

  @override
  String get tdType => 'getDisallowedChatEmojiStatuses';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getDisallowedChatEmojiStatuses',
    };
  }
}


/// Returns available emoji categories @type Type of emoji categories to return; pass null to get defaul...
class TdGetEmojiCategories extends TdObject {
  final TdEmojiCategoryType? type;

  TdGetEmojiCategories({
    this.type,
  });

  @override
  String get tdType => 'getEmojiCategories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getEmojiCategories',
      'type': type?.toMap(),
    };
  }
}


/// Returns information about an emoji reaction. Returns a 404 error if the reaction is not found @emoji...
class TdGetEmojiReaction extends TdObject {
  final String emoji;

  TdGetEmojiReaction({
    required this.emoji,
  });

  @override
  String get tdType => 'getEmojiReaction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getEmojiReaction',
      'emoji': emoji,
    };
  }
}


/// Returns an HTTP URL which can be used to automatically log in to the translation platform and sugges...
class TdGetEmojiSuggestionsUrl extends TdObject {
  final String languageCode;

  TdGetEmojiSuggestionsUrl({
    required this.languageCode,
  });

  @override
  String get tdType => 'getEmojiSuggestionsUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getEmojiSuggestionsUrl',
      'language_code': languageCode,
    };
  }
}


/// Returns an HTTP URL which can be used to automatically authorize the current user on a website after...
class TdGetExternalLink extends TdObject {
  final String link;
  final bool allowWriteAccess;

  TdGetExternalLink({
    required this.link,
    required this.allowWriteAccess,
  });

  @override
  String get tdType => 'getExternalLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getExternalLink',
      'link': link,
      'allow_write_access': allowWriteAccess,
    };
  }
}


/// Returns information about an action to be done when the current user clicks an external link. Don\'t ...
class TdGetExternalLinkInfo extends TdObject {
  final String link;

  TdGetExternalLinkInfo({
    required this.link,
  });

  @override
  String get tdType => 'getExternalLinkInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getExternalLinkInfo',
      'link': link,
    };
  }
}


/// Returns favorite stickers
class TdGetFavoriteStickers extends TdObject {
  TdGetFavoriteStickers();

  @override
  String get tdType => 'getFavoriteStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getFavoriteStickers',
    };
  }
}


/// Returns information about a file. This is an offline method @file_id Identifier of the file to get
class TdGetFile extends TdObject {
  final int fileId;

  TdGetFile({
    required this.fileId,
  });

  @override
  String get tdType => 'getFile';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getFile',
      'file_id': fileId,
    };
  }
}


/// Returns file downloaded prefix size from a given offset, in bytes @file_id Identifier of the file @o...
class TdGetFileDownloadedPrefixSize extends TdObject {
  final int fileId;
  final int offset;

  TdGetFileDownloadedPrefixSize({
    required this.fileId,
    required this.offset,
  });

  @override
  String get tdType => 'getFileDownloadedPrefixSize';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getFileDownloadedPrefixSize',
      'file_id': fileId,
      'offset': offset,
    };
  }
}


/// Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can b...
class TdGetFileExtension extends TdObject {
  final String mimeType;

  TdGetFileExtension({
    required this.mimeType,
  });

  @override
  String get tdType => 'getFileExtension';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getFileExtension',
      'mime_type': mimeType,
    };
  }
}


/// Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. Can b...
class TdGetFileMimeType extends TdObject {
  final String fileName;

  TdGetFileMimeType({
    required this.fileName,
  });

  @override
  String get tdType => 'getFileMimeType';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getFileMimeType',
      'file_name': fileName,
    };
  }
}


/// Returns information about a topic in a forum supergroup chat or a chat with a bot with topics
class TdGetForumTopic extends TdObject {
  final int chatId;
  final int forumTopicId;

  TdGetForumTopic({
    required this.chatId,
    required this.forumTopicId,
  });

  @override
  String get tdType => 'getForumTopic';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getForumTopic',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
    };
  }
}


/// Returns the list of custom emoji, which can be used as forum topic icon by all users
class TdGetForumTopicDefaultIcons extends TdObject {
  TdGetForumTopicDefaultIcons();

  @override
  String get tdType => 'getForumTopicDefaultIcons';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getForumTopicDefaultIcons',
    };
  }
}


/// Returns messages in a topic in a forum supergroup chat or a chat with a bot with topics. The message...
class TdGetForumTopicHistory extends TdObject {
  final int chatId;
  final int forumTopicId;
  final int fromMessageId;
  final int offset;
  final int limit;

  TdGetForumTopicHistory({
    required this.chatId,
    required this.forumTopicId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getForumTopicHistory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getForumTopicHistory',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
      'from_message_id': fromMessageId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns an HTTPS link to a topic in a forum supergroup chat. This is an offline method @chat_id Iden...
class TdGetForumTopicLink extends TdObject {
  final int chatId;
  final int forumTopicId;

  TdGetForumTopicLink({
    required this.chatId,
    required this.forumTopicId,
  });

  @override
  String get tdType => 'getForumTopicLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getForumTopicLink',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
    };
  }
}


/// Returns found forum topics in a forum supergroup chat or a chat with a bot with topics. This is a te...
class TdGetForumTopics extends TdObject {
  final int chatId;
  final String query;
  final int offsetDate;
  final int offsetMessageId;
  final int offsetForumTopicId;
  final int limit;

  TdGetForumTopics({
    required this.chatId,
    required this.query,
    required this.offsetDate,
    required this.offsetMessageId,
    required this.offsetForumTopicId,
    required this.limit,
  });

  @override
  String get tdType => 'getForumTopics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getForumTopics',
      'chat_id': chatId,
      'query': query,
      'offset_date': offsetDate,
      'offset_message_id': offsetMessageId,
      'offset_forum_topic_id': offsetForumTopicId,
      'limit': limit,
    };
  }
}


/// Returns the high scores for a game and some part of the high score table in the range of the specifi...
class TdGetGameHighScores extends TdObject {
  final int chatId;
  final int messageId;
  final int userId;

  TdGetGameHighScores({
    required this.chatId,
    required this.messageId,
    required this.userId,
  });

  @override
  String get tdType => 'getGameHighScores';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGameHighScores',
      'chat_id': chatId,
      'message_id': messageId,
      'user_id': userId,
    };
  }
}


/// Returns the gifts that were acquired by the current user on a gift auction @gift_id Identifier of th...
class TdGetGiftAuctionAcquiredGifts extends TdObject {
  final int giftId;

  TdGetGiftAuctionAcquiredGifts({
    required this.giftId,
  });

  @override
  String get tdType => 'getGiftAuctionAcquiredGifts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGiftAuctionAcquiredGifts',
      'gift_id': giftId,
    };
  }
}


/// Returns auction state for a gift @auction_id Unique identifier of the auction
class TdGetGiftAuctionState extends TdObject {
  final String auctionId;

  TdGetGiftAuctionState({
    required this.auctionId,
  });

  @override
  String get tdType => 'getGiftAuctionState';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGiftAuctionState',
      'auction_id': auctionId,
    };
  }
}


/// Returns available to the current user gift chat themes
class TdGetGiftChatThemes extends TdObject {
  final String offset;
  final int limit;

  TdGetGiftChatThemes({
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getGiftChatThemes';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGiftChatThemes',
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns collections of gifts owned by the given user or chat
class TdGetGiftCollections extends TdObject {
  final TdMessageSender? ownerId;

  TdGetGiftCollections({
    this.ownerId,
  });

  @override
  String get tdType => 'getGiftCollections';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGiftCollections',
      'owner_id': ownerId?.toMap(),
    };
  }
}


/// Returns examples of possible upgraded gifts for a regular gift @gift_id Identifier of the gift
class TdGetGiftUpgradePreview extends TdObject {
  final int giftId;

  TdGetGiftUpgradePreview({
    required this.giftId,
  });

  @override
  String get tdType => 'getGiftUpgradePreview';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGiftUpgradePreview',
      'gift_id': giftId,
    };
  }
}


/// Returns all possible variants of upgraded gifts for a regular gift @gift_id Identifier of the gift
class TdGetGiftUpgradeVariants extends TdObject {
  final int giftId;

  TdGetGiftUpgradeVariants({
    required this.giftId,
  });

  @override
  String get tdType => 'getGiftUpgradeVariants';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGiftUpgradeVariants',
      'gift_id': giftId,
    };
  }
}


/// Returns information about a giveaway
class TdGetGiveawayInfo extends TdObject {
  final int chatId;
  final int messageId;

  TdGetGiveawayInfo({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getGiveawayInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGiveawayInfo',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns greeting stickers from regular sticker sets that can be used for the start page of other use...
class TdGetGreetingStickers extends TdObject {
  TdGetGreetingStickers();

  @override
  String get tdType => 'getGreetingStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGreetingStickers',
    };
  }
}


/// Returns the most grossing Web App bots
class TdGetGrossingWebAppBots extends TdObject {
  final String offset;
  final int limit;

  TdGetGrossingWebAppBots({
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getGrossingWebAppBots';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGrossingWebAppBots',
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns information about a group call @group_call_id Group call identifier
class TdGetGroupCall extends TdObject {
  final int groupCallId;

  TdGetGroupCall({
    required this.groupCallId,
  });

  @override
  String get tdType => 'getGroupCall';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGroupCall',
      'group_call_id': groupCallId,
    };
  }
}


/// Returns information about participants of a non-joined group call that is not bound to a chat
class TdGetGroupCallParticipants extends TdObject {
  final TdInputGroupCall? inputGroupCall;
  final int limit;

  TdGetGroupCallParticipants({
    this.inputGroupCall,
    required this.limit,
  });

  @override
  String get tdType => 'getGroupCallParticipants';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGroupCallParticipants',
      'input_group_call': inputGroupCall?.toMap(),
      'limit': limit,
    };
  }
}


/// Returns a file with a segment of a video chat or live story in a modified OGG format for audio or MP...
class TdGetGroupCallStreamSegment extends TdObject {
  final int groupCallId;
  final int timeOffset;
  final int scale;
  final int channelId;
  final TdGroupCallVideoQuality? videoQuality;

  TdGetGroupCallStreamSegment({
    required this.groupCallId,
    required this.timeOffset,
    required this.scale,
    required this.channelId,
    this.videoQuality,
  });

  @override
  String get tdType => 'getGroupCallStreamSegment';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGroupCallStreamSegment',
      'group_call_id': groupCallId,
      'time_offset': timeOffset,
      'scale': scale,
      'channel_id': channelId,
      'video_quality': videoQuality?.toMap(),
    };
  }
}


/// Returns information about available streams in a video chat or a live story @group_call_id Group cal...
class TdGetGroupCallStreams extends TdObject {
  final int groupCallId;

  TdGetGroupCallStreams({
    required this.groupCallId,
  });

  @override
  String get tdType => 'getGroupCallStreams';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGroupCallStreams',
      'group_call_id': groupCallId,
    };
  }
}


/// Returns a list of common group chats with a given user. Chats are sorted by their type and creation ...
class TdGetGroupsInCommon extends TdObject {
  final int userId;
  final int offsetChatId;
  final int limit;

  TdGetGroupsInCommon({
    required this.userId,
    required this.offsetChatId,
    required this.limit,
  });

  @override
  String get tdType => 'getGroupsInCommon';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getGroupsInCommon',
      'user_id': userId,
      'offset_chat_id': offsetChatId,
      'limit': limit,
    };
  }
}


/// Returns the total number of imported contacts
class TdGetImportedContactCount extends TdObject {
  TdGetImportedContactCount();

  @override
  String get tdType => 'getImportedContactCount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getImportedContactCount',
    };
  }
}


/// Returns a list of recently inactive supergroups and channels. Can be used when user reaches limit on...
class TdGetInactiveSupergroupChats extends TdObject {
  TdGetInactiveSupergroupChats();

  @override
  String get tdType => 'getInactiveSupergroupChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getInactiveSupergroupChats',
    };
  }
}


/// Returns game high scores and some part of the high score table in the range of the specified user; f...
class TdGetInlineGameHighScores extends TdObject {
  final String inlineMessageId;
  final int userId;

  TdGetInlineGameHighScores({
    required this.inlineMessageId,
    required this.userId,
  });

  @override
  String get tdType => 'getInlineGameHighScores';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getInlineGameHighScores',
      'inline_message_id': inlineMessageId,
      'user_id': userId,
    };
  }
}


/// Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fa...
class TdGetInlineQueryResults extends TdObject {
  final int botUserId;
  final int chatId;
  final TdLocation? userLocation;
  final String query;
  final String offset;

  TdGetInlineQueryResults({
    required this.botUserId,
    required this.chatId,
    this.userLocation,
    required this.query,
    required this.offset,
  });

  @override
  String get tdType => 'getInlineQueryResults';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getInlineQueryResults',
      'bot_user_id': botUserId,
      'chat_id': chatId,
      'user_location': userLocation?.toMap(),
      'query': query,
      'offset': offset,
    };
  }
}


/// Returns backgrounds installed by the user @for_dark_theme Pass true to order returned backgrounds fo...
class TdGetInstalledBackgrounds extends TdObject {
  final bool forDarkTheme;

  TdGetInstalledBackgrounds({
    required this.forDarkTheme,
  });

  @override
  String get tdType => 'getInstalledBackgrounds';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getInstalledBackgrounds',
      'for_dark_theme': forDarkTheme,
    };
  }
}


/// Returns a list of installed sticker sets @sticker_type Type of the sticker sets to return
class TdGetInstalledStickerSets extends TdObject {
  final TdStickerType? stickerType;

  TdGetInstalledStickerSets({
    this.stickerType,
  });

  @override
  String get tdType => 'getInstalledStickerSets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getInstalledStickerSets',
      'sticker_type': stickerType?.toMap(),
    };
  }
}


/// Returns an HTTPS or a tg: link with the given type. Can be called before authorization @type Expecte...
class TdGetInternalLink extends TdObject {
  final TdInternalLinkType? type;
  final bool isHttp;

  TdGetInternalLink({
    this.type,
    required this.isHttp,
  });

  @override
  String get tdType => 'getInternalLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getInternalLink',
      'type': type?.toMap(),
      'is_http': isHttp,
    };
  }
}


/// Returns information about the type of internal link. Returns a 404 error if the link is not internal...
class TdGetInternalLinkType extends TdObject {
  final String link;

  TdGetInternalLinkType({
    required this.link,
  });

  @override
  String get tdType => 'getInternalLinkType';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getInternalLinkType',
      'link': link,
    };
  }
}


/// Converts a JsonValue object to corresponding JSON-serialized string. Can be called synchronously @js...
class TdGetJsonString extends TdObject {
  final TdJsonValue? jsonValue;

  TdGetJsonString({
    this.jsonValue,
  });

  @override
  String get tdType => 'getJsonString';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getJsonString',
      'json_value': jsonValue?.toMap(),
    };
  }
}


/// Converts a JSON-serialized string to corresponding JsonValue object. Can be called synchronously @js...
class TdGetJsonValue extends TdObject {
  final String json;

  TdGetJsonValue({
    required this.json,
  });

  @override
  String get tdType => 'getJsonValue';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getJsonValue',
      'json': json,
    };
  }
}


/// Returns emojis matching the keyword. Supported only if the file database is enabled. Order of result...
class TdGetKeywordEmojis extends TdObject {
  final String text;
  final List<String> inputLanguageCodes;

  TdGetKeywordEmojis({
    required this.text,
    required this.inputLanguageCodes,
  });

  @override
  String get tdType => 'getKeywordEmojis';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getKeywordEmojis',
      'text': text,
      'input_language_codes': inputLanguageCodes,
    };
  }
}


/// Returns information about a language pack. Returned language pack identifier may be different from a...
class TdGetLanguagePackInfo extends TdObject {
  final String languagePackId;

  TdGetLanguagePackInfo({
    required this.languagePackId,
  });

  @override
  String get tdType => 'getLanguagePackInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLanguagePackInfo',
      'language_pack_id': languagePackId,
    };
  }
}


/// Returns a string stored in the local database from the specified localization target and language pa...
class TdGetLanguagePackString extends TdObject {
  final String languagePackDatabasePath;
  final String localizationTarget;
  final String languagePackId;
  final String key;

  TdGetLanguagePackString({
    required this.languagePackDatabasePath,
    required this.localizationTarget,
    required this.languagePackId,
    required this.key,
  });

  @override
  String get tdType => 'getLanguagePackString';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLanguagePackString',
      'language_pack_database_path': languagePackDatabasePath,
      'localization_target': localizationTarget,
      'language_pack_id': languagePackId,
      'key': key,
    };
  }
}


/// Returns strings from a language pack in the current localization target by their keys. Can be called...
class TdGetLanguagePackStrings extends TdObject {
  final String languagePackId;
  final List<String> keys;

  TdGetLanguagePackStrings({
    required this.languagePackId,
    required this.keys,
  });

  @override
  String get tdType => 'getLanguagePackStrings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLanguagePackStrings',
      'language_pack_id': languagePackId,
      'keys': keys,
    };
  }
}


/// Returns a link preview by the text of a message. Do not call this function too often. Returns a 404 ...
class TdGetLinkPreview extends TdObject {
  final TdFormattedText? text;
  final TdLinkPreviewOptions? linkPreviewOptions;

  TdGetLinkPreview({
    this.text,
    this.linkPreviewOptions,
  });

  @override
  String get tdType => 'getLinkPreview';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLinkPreview',
      'text': text?.toMap(),
      'link_preview_options': linkPreviewOptions?.toMap(),
    };
  }
}


/// Returns the list of message sender identifiers, on whose behalf messages can be sent to a live story...
class TdGetLiveStoryAvailableMessageSenders extends TdObject {
  final int groupCallId;

  TdGetLiveStoryAvailableMessageSenders({
    required this.groupCallId,
  });

  @override
  String get tdType => 'getLiveStoryAvailableMessageSenders';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLiveStoryAvailableMessageSenders',
      'group_call_id': groupCallId,
    };
  }
}


/// Returns RTMP URL for streaming to a live story; requires can_post_stories administrator right for ch...
class TdGetLiveStoryRtmpUrl extends TdObject {
  final int chatId;

  TdGetLiveStoryRtmpUrl({
    required this.chatId,
  });

  @override
  String get tdType => 'getLiveStoryRtmpUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLiveStoryRtmpUrl',
      'chat_id': chatId,
    };
  }
}


/// Returns information about the user or the chat that streams to a live story; for live stories that a...
class TdGetLiveStoryStreamer extends TdObject {
  final int groupCallId;

  TdGetLiveStoryStreamer({
    required this.groupCallId,
  });

  @override
  String get tdType => 'getLiveStoryStreamer';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLiveStoryStreamer',
      'group_call_id': groupCallId,
    };
  }
}


/// Returns the list of top live story donors @group_call_id Group call identifier of the live story
class TdGetLiveStoryTopDonors extends TdObject {
  final int groupCallId;

  TdGetLiveStoryTopDonors({
    required this.groupCallId,
  });

  @override
  String get tdType => 'getLiveStoryTopDonors';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLiveStoryTopDonors',
      'group_call_id': groupCallId,
    };
  }
}


/// Returns information about the current localization target. This is an offline method if only_local i...
class TdGetLocalizationTargetInfo extends TdObject {
  final bool onlyLocal;

  TdGetLocalizationTargetInfo({
    required this.onlyLocal,
  });

  @override
  String get tdType => 'getLocalizationTargetInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLocalizationTargetInfo',
      'only_local': onlyLocal,
    };
  }
}


/// Returns information about currently used log stream for internal logging of TDLib. Can be called syn...
class TdGetLogStream extends TdObject {
  TdGetLogStream();

  @override
  String get tdType => 'getLogStream';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLogStream',
    };
  }
}


/// Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously ...
class TdGetLogTagVerbosityLevel extends TdObject {
  final String tag;

  TdGetLogTagVerbosityLevel({
    required this.tag,
  });

  @override
  String get tdType => 'getLogTagVerbosityLevel';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLogTagVerbosityLevel',
      'tag': tag,
    };
  }
}


/// Returns the list of available TDLib internal log tags, for example, ["actor", "binlog", "connections...
class TdGetLogTags extends TdObject {
  TdGetLogTags();

  @override
  String get tdType => 'getLogTags';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLogTags',
    };
  }
}


/// Returns current verbosity level of the internal logging of TDLib. Can be called synchronously
class TdGetLogVerbosityLevel extends TdObject {
  TdGetLogVerbosityLevel();

  @override
  String get tdType => 'getLogVerbosityLevel';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLogVerbosityLevel',
    };
  }
}


/// Returns the list of passkeys allowed to be used for the login by the current user
class TdGetLoginPasskeys extends TdObject {
  TdGetLoginPasskeys();

  @override
  String get tdType => 'getLoginPasskeys';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLoginPasskeys',
    };
  }
}


/// Returns an HTTP URL which can be used to automatically authorize the user on a website after clickin...
class TdGetLoginUrl extends TdObject {
  final int chatId;
  final int messageId;
  final int buttonId;
  final bool allowWriteAccess;

  TdGetLoginUrl({
    required this.chatId,
    required this.messageId,
    required this.buttonId,
    required this.allowWriteAccess,
  });

  @override
  String get tdType => 'getLoginUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLoginUrl',
      'chat_id': chatId,
      'message_id': messageId,
      'button_id': buttonId,
      'allow_write_access': allowWriteAccess,
    };
  }
}


/// Returns information about a button of type inlineKeyboardButtonTypeLoginUrl. The method needs to be ...
class TdGetLoginUrlInfo extends TdObject {
  final int chatId;
  final int messageId;
  final int buttonId;

  TdGetLoginUrlInfo({
    required this.chatId,
    required this.messageId,
    required this.buttonId,
  });

  @override
  String get tdType => 'getLoginUrlInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getLoginUrlInfo',
      'chat_id': chatId,
      'message_id': messageId,
      'button_id': buttonId,
    };
  }
}


/// Returns information needed to open the main Web App of a bot
class TdGetMainWebApp extends TdObject {
  final int chatId;
  final int botUserId;
  final String startParameter;
  final TdWebAppOpenParameters? eters;

  TdGetMainWebApp({
    required this.chatId,
    required this.botUserId,
    required this.startParameter,
    this.eters,
  });

  @override
  String get tdType => 'getMainWebApp';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMainWebApp',
      'chat_id': chatId,
      'bot_user_id': botUserId,
      'start_parameter': startParameter,
      'parameters': eters?.toMap(),
    };
  }
}


/// Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with s...
class TdGetMapThumbnailFile extends TdObject {
  final TdLocation? location;
  final int zoom;
  final int width;
  final int height;
  final int scale;
  final int chatId;

  TdGetMapThumbnailFile({
    this.location,
    required this.zoom,
    required this.width,
    required this.height,
    required this.scale,
    required this.chatId,
  });

  @override
  String get tdType => 'getMapThumbnailFile';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMapThumbnailFile',
      'location': location?.toMap(),
      'zoom': zoom,
      'width': width,
      'height': height,
      'scale': scale,
      'chat_id': chatId,
    };
  }
}


/// Replaces text entities with Markdown formatting in a human-friendly format. Entities that can\'t be r...
class TdGetMarkdownText extends TdObject {
  final TdFormattedText? text;

  TdGetMarkdownText({
    this.text,
  });

  @override
  String get tdType => 'getMarkdownText';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMarkdownText',
      'text': text?.toMap(),
    };
  }
}


/// Returns the current user
class TdGetMe extends TdObject {
  TdGetMe();

  @override
  String get tdType => 'getMe';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMe',
    };
  }
}


/// Returns menu button set by the bot for the given user; for bots only @user_id Identifier of the user...
class TdGetMenuButton extends TdObject {
  final int userId;

  TdGetMenuButton({
    required this.userId,
  });

  @override
  String get tdType => 'getMenuButton';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMenuButton',
      'user_id': userId,
    };
  }
}


/// Returns information about a message. Returns a 404 error if the message doesn\'t exist
class TdGetMessage extends TdObject {
  final int chatId;
  final int messageId;

  TdGetMessage({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessage',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns reactions added for a message, along with their sender
class TdGetMessageAddedReactions extends TdObject {
  final int chatId;
  final int messageId;
  final TdReactionType? reactionType;
  final String offset;
  final int limit;

  TdGetMessageAddedReactions({
    required this.chatId,
    required this.messageId,
    this.reactionType,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getMessageAddedReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageAddedReactions',
      'chat_id': chatId,
      'message_id': messageId,
      'reaction_type': reactionType?.toMap(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns information about actual author of a message sent on behalf of a channel. The method can be ...
class TdGetMessageAuthor extends TdObject {
  final int chatId;
  final int messageId;

  TdGetMessageAuthor({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getMessageAuthor';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageAuthor',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns reactions, which can be added to a message. The list can change after updateActiveEmojiReact...
class TdGetMessageAvailableReactions extends TdObject {
  final int chatId;
  final int messageId;
  final int rowSize;

  TdGetMessageAvailableReactions({
    required this.chatId,
    required this.messageId,
    required this.rowSize,
  });

  @override
  String get tdType => 'getMessageAvailableReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageAvailableReactions',
      'chat_id': chatId,
      'message_id': messageId,
      'row_size': rowSize,
    };
  }
}


/// Returns information about a message effect. Returns a 404 error if the effect is not found @effect_i...
class TdGetMessageEffect extends TdObject {
  final int effectId;

  TdGetMessageEffect({
    required this.effectId,
  });

  @override
  String get tdType => 'getMessageEffect';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageEffect',
      'effect_id': effectId,
    };
  }
}


/// Returns an HTML code for embedding the message. Available only if messageProperties.can_get_embeddin...
class TdGetMessageEmbeddingCode extends TdObject {
  final int chatId;
  final int messageId;
  final bool forAlbum;

  TdGetMessageEmbeddingCode({
    required this.chatId,
    required this.messageId,
    required this.forAlbum,
  });

  @override
  String get tdType => 'getMessageEmbeddingCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageEmbeddingCode',
      'chat_id': chatId,
      'message_id': messageId,
      'for_album': forAlbum,
    };
  }
}


/// Returns information about a file with messages exported from another application @message_file_head ...
class TdGetMessageFileType extends TdObject {
  final String messageFileHead;

  TdGetMessageFileType({
    required this.messageFileHead,
  });

  @override
  String get tdType => 'getMessageFileType';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageFileType',
      'message_file_head': messageFileHead,
    };
  }
}


/// Returns a confirmation text to be shown to the user before starting message import
class TdGetMessageImportConfirmationText extends TdObject {
  final int chatId;

  TdGetMessageImportConfirmationText({
    required this.chatId,
  });

  @override
  String get tdType => 'getMessageImportConfirmationText';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageImportConfirmationText',
      'chat_id': chatId,
    };
  }
}


/// Returns an HTTPS link to a message in a chat. Available only if messageProperties.can_get_link, or i...
class TdGetMessageLink extends TdObject {
  final int chatId;
  final int messageId;
  final int mediaTimestamp;
  final bool forAlbum;
  final bool inMessageThread;

  TdGetMessageLink({
    required this.chatId,
    required this.messageId,
    required this.mediaTimestamp,
    required this.forAlbum,
    required this.inMessageThread,
  });

  @override
  String get tdType => 'getMessageLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageLink',
      'chat_id': chatId,
      'message_id': messageId,
      'media_timestamp': mediaTimestamp,
      'for_album': forAlbum,
      'in_message_thread': inMessageThread,
    };
  }
}


/// Returns information about a public or private message link. Can be called for any internal link of t...
class TdGetMessageLinkInfo extends TdObject {
  final String url;

  TdGetMessageLinkInfo({
    required this.url,
  });

  @override
  String get tdType => 'getMessageLinkInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageLinkInfo',
      'url': url,
    };
  }
}


/// Returns information about a message, if it is available without sending network request. Returns a 4...
class TdGetMessageLocally extends TdObject {
  final int chatId;
  final int messageId;

  TdGetMessageLocally({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getMessageLocally';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageLocally',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns properties of a message. This is an offline method @chat_id Chat identifier @message_id Iden...
class TdGetMessageProperties extends TdObject {
  final int chatId;
  final int messageId;

  TdGetMessageProperties({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getMessageProperties';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageProperties',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns forwarded copies of a channel message to different public channels and public reposts as a s...
class TdGetMessagePublicForwards extends TdObject {
  final int chatId;
  final int messageId;
  final String offset;
  final int limit;

  TdGetMessagePublicForwards({
    required this.chatId,
    required this.messageId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getMessagePublicForwards';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessagePublicForwards',
      'chat_id': chatId,
      'message_id': messageId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns read date of a recent outgoing message in a private chat. The method can be called if messag...
class TdGetMessageReadDate extends TdObject {
  final int chatId;
  final int messageId;

  TdGetMessageReadDate({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getMessageReadDate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageReadDate',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns detailed statistics about a message. Can be used only if messageProperties.can_get_statistic...
class TdGetMessageStatistics extends TdObject {
  final int chatId;
  final int messageId;
  final bool isDark;

  TdGetMessageStatistics({
    required this.chatId,
    required this.messageId,
    required this.isDark,
  });

  @override
  String get tdType => 'getMessageStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageStatistics',
      'chat_id': chatId,
      'message_id': messageId,
      'is_dark': isDark,
    };
  }
}


/// Returns information about a message thread. Can be used only if messageProperties.can_get_message_th...
class TdGetMessageThread extends TdObject {
  final int chatId;
  final int messageId;

  TdGetMessageThread({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getMessageThread';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageThread',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns messages in a message thread of a message. Can be used only if messageProperties.can_get_mes...
class TdGetMessageThreadHistory extends TdObject {
  final int chatId;
  final int messageId;
  final int fromMessageId;
  final int offset;
  final int limit;

  TdGetMessageThreadHistory({
    required this.chatId,
    required this.messageId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getMessageThreadHistory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageThreadHistory',
      'chat_id': chatId,
      'message_id': messageId,
      'from_message_id': fromMessageId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns viewers of a recent outgoing message in a basic group or a supergroup chat. For video notes ...
class TdGetMessageViewers extends TdObject {
  final int chatId;
  final int messageId;

  TdGetMessageViewers({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getMessageViewers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessageViewers',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns information about messages. If a message is not found, returns null on the corresponding pos...
class TdGetMessages extends TdObject {
  final int chatId;
  final List<int> messageIds;

  TdGetMessages({
    required this.chatId,
    required this.messageIds,
  });

  @override
  String get tdType => 'getMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getMessages',
      'chat_id': chatId,
      'message_ids': messageIds,
    };
  }
}


/// Returns network data usage statistics. Can be called before authorization @only_current Pass true to...
class TdGetNetworkStatistics extends TdObject {
  final bool onlyCurrent;

  TdGetNetworkStatistics({
    required this.onlyCurrent,
  });

  @override
  String get tdType => 'getNetworkStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getNetworkStatistics',
      'only_current': onlyCurrent,
    };
  }
}


/// Returns privacy settings for new chat creation
class TdGetNewChatPrivacySettings extends TdObject {
  TdGetNewChatPrivacySettings();

  @override
  String get tdType => 'getNewChatPrivacySettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getNewChatPrivacySettings',
    };
  }
}


/// Returns the value of an option by its name. (Check the list of available options on https://core.tel...
class TdGetOption extends TdObject {
  final String name;

  TdGetOption({
    required this.name,
  });

  @override
  String get tdType => 'getOption';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getOption',
      'name': name,
    };
  }
}


/// Returns the list of bots owned by the current user
class TdGetOwnedBots extends TdObject {
  TdGetOwnedBots();

  @override
  String get tdType => 'getOwnedBots';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getOwnedBots',
    };
  }
}


/// Returns sticker sets owned by the current user
class TdGetOwnedStickerSets extends TdObject {
  final int offsetStickerSetId;
  final int limit;

  TdGetOwnedStickerSets({
    required this.offsetStickerSetId,
    required this.limit,
  });

  @override
  String get tdType => 'getOwnedStickerSets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getOwnedStickerSets',
      'offset_sticker_set_id': offsetStickerSetId,
      'limit': limit,
    };
  }
}


/// Returns the total number of Telegram Stars received by the current user for paid messages from the g...
class TdGetPaidMessageRevenue extends TdObject {
  final int userId;

  TdGetPaidMessageRevenue({
    required this.userId,
  });

  @override
  String get tdType => 'getPaidMessageRevenue';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPaidMessageRevenue',
      'user_id': userId,
    };
  }
}


/// Returns parameters for creating of a new passkey as JSON-serialized string
class TdGetPasskeyParameters extends TdObject {
  TdGetPasskeyParameters();

  @override
  String get tdType => 'getPasskeyParameters';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPasskeyParameters',
    };
  }
}


/// Returns a Telegram Passport authorization form for sharing data with a service
class TdGetPassportAuthorizationForm extends TdObject {
  final int botUserId;
  final String scope;
  final String publicKey;
  final String nonce;

  TdGetPassportAuthorizationForm({
    required this.botUserId,
    required this.scope,
    required this.publicKey,
    required this.nonce,
  });

  @override
  String get tdType => 'getPassportAuthorizationForm';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPassportAuthorizationForm',
      'bot_user_id': botUserId,
      'scope': scope,
      'public_key': publicKey,
      'nonce': nonce,
    };
  }
}


/// Returns already available Telegram Passport elements suitable for completing a Telegram Passport aut...
class TdGetPassportAuthorizationFormAvailableElements extends TdObject {
  final int authorizationFormId;
  final String password;

  TdGetPassportAuthorizationFormAvailableElements({
    required this.authorizationFormId,
    required this.password,
  });

  @override
  String get tdType => 'getPassportAuthorizationFormAvailableElements';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPassportAuthorizationFormAvailableElements',
      'authorization_form_id': authorizationFormId,
      'password': password,
    };
  }
}


/// Returns one of the available Telegram Passport elements @type Telegram Passport element type @passwo...
class TdGetPassportElement extends TdObject {
  final TdPassportElementType? type;
  final String password;

  TdGetPassportElement({
    this.type,
    required this.password,
  });

  @override
  String get tdType => 'getPassportElement';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPassportElement',
      'type': type?.toMap(),
      'password': password,
    };
  }
}


/// Returns the current state of 2-step verification
class TdGetPasswordState extends TdObject {
  TdGetPasswordState();

  @override
  String get tdType => 'getPasswordState';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPasswordState',
    };
  }
}


/// Returns an invoice payment form. This method must be called when the user presses inline button of t...
class TdGetPaymentForm extends TdObject {
  final TdInputInvoice? inputInvoice;
  final TdThemeParameters? theme;

  TdGetPaymentForm({
    this.inputInvoice,
    this.theme,
  });

  @override
  String get tdType => 'getPaymentForm';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPaymentForm',
      'input_invoice': inputInvoice?.toMap(),
      'theme': theme?.toMap(),
    };
  }
}


/// Returns information about a successful payment @chat_id Chat identifier of the messagePaymentSuccess...
class TdGetPaymentReceipt extends TdObject {
  final int chatId;
  final int messageId;

  TdGetPaymentReceipt({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getPaymentReceipt';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPaymentReceipt',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns information about a phone number by its prefix. Can be called before authorization @phone_nu...
class TdGetPhoneNumberInfo extends TdObject {
  final String phoneNumberPrefix;

  TdGetPhoneNumberInfo({
    required this.phoneNumberPrefix,
  });

  @override
  String get tdType => 'getPhoneNumberInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPhoneNumberInfo',
      'phone_number_prefix': phoneNumberPrefix,
    };
  }
}


/// Returns information about a phone number by its prefix synchronously. getCountries must be called at...
class TdGetPhoneNumberInfoSync extends TdObject {
  final String languageCode;
  final String phoneNumberPrefix;

  TdGetPhoneNumberInfoSync({
    required this.languageCode,
    required this.phoneNumberPrefix,
  });

  @override
  String get tdType => 'getPhoneNumberInfoSync';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPhoneNumberInfoSync',
      'language_code': languageCode,
      'phone_number_prefix': phoneNumberPrefix,
    };
  }
}


/// Returns message senders voted for the specified option in a non-anonymous polls. For optimal perform...
class TdGetPollVoters extends TdObject {
  final int chatId;
  final int messageId;
  final int optionId;
  final int offset;
  final int limit;

  TdGetPollVoters({
    required this.chatId,
    required this.messageId,
    required this.optionId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getPollVoters';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPollVoters',
      'chat_id': chatId,
      'message_id': messageId,
      'option_id': optionId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns an IETF language tag of the language preferred in the country, which must be used to fill na...
class TdGetPreferredCountryLanguage extends TdObject {
  final String countryCode;

  TdGetPreferredCountryLanguage({
    required this.countryCode,
  });

  @override
  String get tdType => 'getPreferredCountryLanguage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPreferredCountryLanguage',
      'country_code': countryCode,
    };
  }
}


/// Returns information about features, available to Premium users @source Source of the request; pass n...
class TdGetPremiumFeatures extends TdObject {
  final TdPremiumSource? source;

  TdGetPremiumFeatures({
    this.source,
  });

  @override
  String get tdType => 'getPremiumFeatures';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPremiumFeatures',
      'source': source?.toMap(),
    };
  }
}


/// Returns available options for gifting Telegram Premium to a user
class TdGetPremiumGiftPaymentOptions extends TdObject {
  TdGetPremiumGiftPaymentOptions();

  @override
  String get tdType => 'getPremiumGiftPaymentOptions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPremiumGiftPaymentOptions',
    };
  }
}


/// Returns available options for creating of Telegram Premium giveaway or manual distribution of Telegr...
class TdGetPremiumGiveawayPaymentOptions extends TdObject {
  final int boostedChatId;

  TdGetPremiumGiveawayPaymentOptions({
    required this.boostedChatId,
  });

  @override
  String get tdType => 'getPremiumGiveawayPaymentOptions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPremiumGiveawayPaymentOptions',
      'boosted_chat_id': boostedChatId,
    };
  }
}


/// Returns the sticker to be used as representation of the Telegram Premium subscription @month_count N...
class TdGetPremiumInfoSticker extends TdObject {
  final int monthCount;

  TdGetPremiumInfoSticker({
    required this.monthCount,
  });

  @override
  String get tdType => 'getPremiumInfoSticker';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPremiumInfoSticker',
      'month_count': monthCount,
    };
  }
}


/// Returns information about a limit, increased for Premium users. Returns a 404 error if the limit is ...
class TdGetPremiumLimit extends TdObject {
  final TdPremiumLimitType? limitType;

  TdGetPremiumLimit({
    this.limitType,
  });

  @override
  String get tdType => 'getPremiumLimit';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPremiumLimit',
      'limit_type': limitType?.toMap(),
    };
  }
}


/// Returns state of Telegram Premium subscription and promotion videos for Premium features
class TdGetPremiumState extends TdObject {
  TdGetPremiumState();

  @override
  String get tdType => 'getPremiumState';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPremiumState',
    };
  }
}


/// Returns examples of premium stickers for demonstration purposes
class TdGetPremiumStickerExamples extends TdObject {
  TdGetPremiumStickerExamples();

  @override
  String get tdType => 'getPremiumStickerExamples';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPremiumStickerExamples',
    };
  }
}


/// Returns premium stickers from regular sticker sets @limit The maximum number of stickers to be retur...
class TdGetPremiumStickers extends TdObject {
  final int limit;

  TdGetPremiumStickers({
    required this.limit,
  });

  @override
  String get tdType => 'getPremiumStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPremiumStickers',
      'limit': limit,
    };
  }
}


/// Saves an inline message to be sent by the given user
class TdGetPreparedInlineMessage extends TdObject {
  final int botUserId;
  final String preparedMessageId;

  TdGetPreparedInlineMessage({
    required this.botUserId,
    required this.preparedMessageId,
  });

  @override
  String get tdType => 'getPreparedInlineMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPreparedInlineMessage',
      'bot_user_id': botUserId,
      'prepared_message_id': preparedMessageId,
    };
  }
}


/// Returns the list of proxies that are currently set up. Can be called before authorization
class TdGetProxies extends TdObject {
  TdGetProxies();

  @override
  String get tdType => 'getProxies';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getProxies',
    };
  }
}


/// Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxi...
class TdGetProxyLink extends TdObject {
  final int proxyId;

  TdGetProxyLink({
    required this.proxyId,
  });

  @override
  String get tdType => 'getProxyLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getProxyLink',
      'proxy_id': proxyId,
    };
  }
}


/// Checks public post search limits without actually performing the search @query Query that will be se...
class TdGetPublicPostSearchLimits extends TdObject {
  final String query;

  TdGetPublicPostSearchLimits({
    required this.query,
  });

  @override
  String get tdType => 'getPublicPostSearchLimits';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPublicPostSearchLimits',
      'query': query,
    };
  }
}


/// Returns a globally unique push notification subscription identifier for identification of an account...
class TdGetPushReceiverId extends TdObject {
  final String payload;

  TdGetPushReceiverId({
    required this.payload,
  });

  @override
  String get tdType => 'getPushReceiverId';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getPushReceiverId',
      'payload': payload,
    };
  }
}


/// Returns privacy settings for message read date
class TdGetReadDatePrivacySettings extends TdObject {
  TdGetReadDatePrivacySettings();

  @override
  String get tdType => 'getReadDatePrivacySettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getReadDatePrivacySettings',
    };
  }
}


/// Returns information about a received gift @received_gift_id Identifier of the gift
class TdGetReceivedGift extends TdObject {
  final String receivedGiftId;

  TdGetReceivedGift({
    required this.receivedGiftId,
  });

  @override
  String get tdType => 'getReceivedGift';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getReceivedGift',
      'received_gift_id': receivedGiftId,
    };
  }
}


/// Returns gifts received by the given user or chat
class TdGetReceivedGifts extends TdObject {
  final String businessConnectionId;
  final TdMessageSender? ownerId;
  final int collectionId;
  final bool excludeUnsaved;
  final bool excludeSaved;
  final bool excludeUnlimited;
  final bool excludeUpgradable;
  final bool excludeNonUpgradable;
  final bool excludeUpgraded;
  final bool excludeWithoutColors;
  final bool excludeHosted;
  final bool sortByPrice;
  final String offset;
  final int limit;

  TdGetReceivedGifts({
    required this.businessConnectionId,
    this.ownerId,
    required this.collectionId,
    required this.excludeUnsaved,
    required this.excludeSaved,
    required this.excludeUnlimited,
    required this.excludeUpgradable,
    required this.excludeNonUpgradable,
    required this.excludeUpgraded,
    required this.excludeWithoutColors,
    required this.excludeHosted,
    required this.sortByPrice,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getReceivedGifts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getReceivedGifts',
      'business_connection_id': businessConnectionId,
      'owner_id': ownerId?.toMap(),
      'collection_id': collectionId,
      'exclude_unsaved': excludeUnsaved,
      'exclude_saved': excludeSaved,
      'exclude_unlimited': excludeUnlimited,
      'exclude_upgradable': excludeUpgradable,
      'exclude_non_upgradable': excludeNonUpgradable,
      'exclude_upgraded': excludeUpgraded,
      'exclude_without_colors': excludeWithoutColors,
      'exclude_hosted': excludeHosted,
      'sort_by_price': sortByPrice,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns recent emoji statuses for self status
class TdGetRecentEmojiStatuses extends TdObject {
  TdGetRecentEmojiStatuses();

  @override
  String get tdType => 'getRecentEmojiStatuses';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRecentEmojiStatuses',
    };
  }
}


/// Returns up to 20 recently used inline bots in the order of their last usage
class TdGetRecentInlineBots extends TdObject {
  TdGetRecentInlineBots();

  @override
  String get tdType => 'getRecentInlineBots';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRecentInlineBots',
    };
  }
}


/// Returns a list of recently used stickers @is_attached Pass true to return stickers and masks that we...
class TdGetRecentStickers extends TdObject {
  final bool isAttached;

  TdGetRecentStickers({
    required this.isAttached,
  });

  @override
  String get tdType => 'getRecentStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRecentStickers',
      'is_attached': isAttached,
    };
  }
}


/// Returns recently opened chats. This is an offline method. Returns chats in the order of last opening...
class TdGetRecentlyOpenedChats extends TdObject {
  final int limit;

  TdGetRecentlyOpenedChats({
    required this.limit,
  });

  @override
  String get tdType => 'getRecentlyOpenedChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRecentlyOpenedChats',
      'limit': limit,
    };
  }
}


/// Returns t.me URLs recently visited by a newly registered user @referrer Google Play referrer to iden...
class TdGetRecentlyVisitedTMeUrls extends TdObject {
  final String referrer;

  TdGetRecentlyVisitedTMeUrls({
    required this.referrer,
  });

  @override
  String get tdType => 'getRecentlyVisitedTMeUrls';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRecentlyVisitedTMeUrls',
      'referrer': referrer,
    };
  }
}


/// Returns recommended chat folders for the current user
class TdGetRecommendedChatFolders extends TdObject {
  TdGetRecommendedChatFolders();

  @override
  String get tdType => 'getRecommendedChatFolders';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRecommendedChatFolders',
    };
  }
}


/// Returns a list of channel chats recommended to the current user
class TdGetRecommendedChats extends TdObject {
  TdGetRecommendedChats();

  @override
  String get tdType => 'getRecommendedChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRecommendedChats',
    };
  }
}


/// Returns a 2-step verification recovery email address that was previously set up. This method can be ...
class TdGetRecoveryEmailAddress extends TdObject {
  final String password;

  TdGetRecoveryEmailAddress({
    required this.password,
  });

  @override
  String get tdType => 'getRecoveryEmailAddress';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRecoveryEmailAddress',
      'password': password,
    };
  }
}


/// Returns information about a file by its remote identifier. This is an offline method. Can be used to...
class TdGetRemoteFile extends TdObject {
  final String remoteFileId;
  final TdFileType? fileType;

  TdGetRemoteFile({
    required this.remoteFileId,
    this.fileType,
  });

  @override
  String get tdType => 'getRemoteFile';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRemoteFile',
      'remote_file_id': remoteFileId,
      'file_type': fileType?.toMap(),
    };
  }
}


/// Returns information about a non-bundled message that is replied by a given message. Also, returns th...
class TdGetRepliedMessage extends TdObject {
  final int chatId;
  final int messageId;

  TdGetRepliedMessage({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getRepliedMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getRepliedMessage',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns saved animations
class TdGetSavedAnimations extends TdObject {
  TdGetSavedAnimations();

  @override
  String get tdType => 'getSavedAnimations';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSavedAnimations',
    };
  }
}


/// Returns tags used in Saved Messages or a Saved Messages topic
class TdGetSavedMessagesTags extends TdObject {
  final int savedMessagesTopicId;

  TdGetSavedMessagesTags({
    required this.savedMessagesTopicId,
  });

  @override
  String get tdType => 'getSavedMessagesTags';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSavedMessagesTags',
      'saved_messages_topic_id': savedMessagesTopicId,
    };
  }
}


/// Returns messages in a Saved Messages topic. The messages are returned in reverse chronological order...
class TdGetSavedMessagesTopicHistory extends TdObject {
  final int savedMessagesTopicId;
  final int fromMessageId;
  final int offset;
  final int limit;

  TdGetSavedMessagesTopicHistory({
    required this.savedMessagesTopicId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getSavedMessagesTopicHistory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSavedMessagesTopicHistory',
      'saved_messages_topic_id': savedMessagesTopicId,
      'from_message_id': fromMessageId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns the last message sent in a Saved Messages topic no later than the specified date
class TdGetSavedMessagesTopicMessageByDate extends TdObject {
  final int savedMessagesTopicId;
  final int date;

  TdGetSavedMessagesTopicMessageByDate({
    required this.savedMessagesTopicId,
    required this.date,
  });

  @override
  String get tdType => 'getSavedMessagesTopicMessageByDate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSavedMessagesTopicMessageByDate',
      'saved_messages_topic_id': savedMessagesTopicId,
      'date': date,
    };
  }
}


/// Returns saved notification sound by its identifier. Returns a 404 error if there is no saved notific...
class TdGetSavedNotificationSound extends TdObject {
  final int notificationSoundId;

  TdGetSavedNotificationSound({
    required this.notificationSoundId,
  });

  @override
  String get tdType => 'getSavedNotificationSound';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSavedNotificationSound',
      'notification_sound_id': notificationSoundId,
    };
  }
}


/// Returns the list of saved notification sounds. If a sound isn\'t in the list, then default sound need...
class TdGetSavedNotificationSounds extends TdObject {
  TdGetSavedNotificationSounds();

  @override
  String get tdType => 'getSavedNotificationSounds';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSavedNotificationSounds',
    };
  }
}


/// Returns saved order information. Returns a 404 error if there is no saved order information
class TdGetSavedOrderInfo extends TdObject {
  TdGetSavedOrderInfo();

  @override
  String get tdType => 'getSavedOrderInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSavedOrderInfo',
    };
  }
}


/// Returns the notification settings for chats of a given type @scope Types of chats for which to retur...
class TdGetScopeNotificationSettings extends TdObject {
  final TdNotificationSettingsScope? scope;

  TdGetScopeNotificationSettings({
    this.scope,
  });

  @override
  String get tdType => 'getScopeNotificationSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getScopeNotificationSettings',
      'scope': scope?.toMap(),
    };
  }
}


/// Returns sponsored chats to be shown in the search results @query Query the user searches for
class TdGetSearchSponsoredChats extends TdObject {
  final String query;

  TdGetSearchSponsoredChats({
    required this.query,
  });

  @override
  String get tdType => 'getSearchSponsoredChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSearchSponsoredChats',
      'query': query,
    };
  }
}


/// Returns recently searched for hashtags or cashtags by their prefix @tag_prefix Prefix of hashtags or...
class TdGetSearchedForTags extends TdObject {
  final String tagPrefix;
  final int limit;

  TdGetSearchedForTags({
    required this.tagPrefix,
    required this.limit,
  });

  @override
  String get tdType => 'getSearchedForTags';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSearchedForTags',
      'tag_prefix': tagPrefix,
      'limit': limit,
    };
  }
}


/// Returns information about a secret chat by its identifier. This is an offline method @secret_chat_id...
class TdGetSecretChat extends TdObject {
  final int secretChatId;

  TdGetSecretChat({
    required this.secretChatId,
  });

  @override
  String get tdType => 'getSecretChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSecretChat',
      'secret_chat_id': secretChatId,
    };
  }
}


/// Returns a URL for a Telegram Ad platform account that can be used to set up advertisements for the c...
class TdGetStarAdAccountUrl extends TdObject {
  final TdMessageSender? ownerId;

  TdGetStarAdAccountUrl({
    this.ownerId,
  });

  @override
  String get tdType => 'getStarAdAccountUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStarAdAccountUrl',
      'owner_id': ownerId?.toMap(),
    };
  }
}


/// Returns available options for Telegram Stars gifting @user_id Identifier of the user that will recei...
class TdGetStarGiftPaymentOptions extends TdObject {
  final int userId;

  TdGetStarGiftPaymentOptions({
    required this.userId,
  });

  @override
  String get tdType => 'getStarGiftPaymentOptions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStarGiftPaymentOptions',
      'user_id': userId,
    };
  }
}


/// Returns available options for Telegram Star giveaway creation
class TdGetStarGiveawayPaymentOptions extends TdObject {
  TdGetStarGiveawayPaymentOptions();

  @override
  String get tdType => 'getStarGiveawayPaymentOptions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStarGiveawayPaymentOptions',
    };
  }
}


/// Returns available options for Telegram Stars purchase
class TdGetStarPaymentOptions extends TdObject {
  TdGetStarPaymentOptions();

  @override
  String get tdType => 'getStarPaymentOptions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStarPaymentOptions',
    };
  }
}


/// Returns detailed Telegram Star revenue statistics
class TdGetStarRevenueStatistics extends TdObject {
  final TdMessageSender? ownerId;
  final bool isDark;

  TdGetStarRevenueStatistics({
    this.ownerId,
    required this.isDark,
  });

  @override
  String get tdType => 'getStarRevenueStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStarRevenueStatistics',
      'owner_id': ownerId?.toMap(),
      'is_dark': isDark,
    };
  }
}


/// Returns the list of Telegram Star subscriptions for the current user
class TdGetStarSubscriptions extends TdObject {
  final bool onlyExpiring;
  final String offset;

  TdGetStarSubscriptions({
    required this.onlyExpiring,
    required this.offset,
  });

  @override
  String get tdType => 'getStarSubscriptions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStarSubscriptions',
      'only_expiring': onlyExpiring,
      'offset': offset,
    };
  }
}


/// Returns the list of Telegram Star transactions for the specified owner or identifier of a supergroup...
class TdGetStarTransactions extends TdObject {
  final TdMessageSender? ownerId;
  final String subscriptionId;
  final TdTransactionDirection? direction;
  final String offset;
  final int limit;

  TdGetStarTransactions({
    this.ownerId,
    required this.subscriptionId,
    this.direction,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getStarTransactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStarTransactions',
      'owner_id': ownerId?.toMap(),
      'subscription_id': subscriptionId,
      'direction': direction?.toMap(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns a URL for Telegram Star withdrawal
class TdGetStarWithdrawalUrl extends TdObject {
  final TdMessageSender? ownerId;
  final int starCount;
  final String password;

  TdGetStarWithdrawalUrl({
    this.ownerId,
    required this.starCount,
    required this.password,
  });

  @override
  String get tdType => 'getStarWithdrawalUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStarWithdrawalUrl',
      'owner_id': ownerId?.toMap(),
      'star_count': starCount,
      'password': password,
    };
  }
}


/// Loads an asynchronous or a zoomed in statistical graph @chat_id Chat identifier @token The token for...
class TdGetStatisticalGraph extends TdObject {
  final int chatId;
  final String token;
  final int x;

  TdGetStatisticalGraph({
    required this.chatId,
    required this.token,
    required this.x,
  });

  @override
  String get tdType => 'getStatisticalGraph';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStatisticalGraph',
      'chat_id': chatId,
      'token': token,
      'x': x,
    };
  }
}


/// Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sti...
class TdGetStickerEmojis extends TdObject {
  final TdInputFile? sticker;

  TdGetStickerEmojis({
    this.sticker,
  });

  @override
  String get tdType => 'getStickerEmojis';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStickerEmojis',
      'sticker': sticker?.toMap(),
    };
  }
}


/// Returns outline of a sticker. This is an offline method. Returns a 404 error if the outline isn\'t kn...
class TdGetStickerOutline extends TdObject {
  final int stickerFileId;
  final bool forAnimatedEmoji;
  final bool forClickedAnimatedEmojiMessage;

  TdGetStickerOutline({
    required this.stickerFileId,
    required this.forAnimatedEmoji,
    required this.forClickedAnimatedEmojiMessage,
  });

  @override
  String get tdType => 'getStickerOutline';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStickerOutline',
      'sticker_file_id': stickerFileId,
      'for_animated_emoji': forAnimatedEmoji,
      'for_clicked_animated_emoji_message': forClickedAnimatedEmojiMessage,
    };
  }
}


/// Returns outline of a sticker as an SVG path. This is an offline method. Returns an empty string if t...
class TdGetStickerOutlineSvgPath extends TdObject {
  final int stickerFileId;
  final bool forAnimatedEmoji;
  final bool forClickedAnimatedEmojiMessage;

  TdGetStickerOutlineSvgPath({
    required this.stickerFileId,
    required this.forAnimatedEmoji,
    required this.forClickedAnimatedEmojiMessage,
  });

  @override
  String get tdType => 'getStickerOutlineSvgPath';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStickerOutlineSvgPath',
      'sticker_file_id': stickerFileId,
      'for_animated_emoji': forAnimatedEmoji,
      'for_clicked_animated_emoji_message': forClickedAnimatedEmojiMessage,
    };
  }
}


/// Returns information about a sticker set by its identifier @set_id Identifier of the sticker set
class TdGetStickerSet extends TdObject {
  final int setId;

  TdGetStickerSet({
    required this.setId,
  });

  @override
  String get tdType => 'getStickerSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStickerSet',
      'set_id': setId,
    };
  }
}


/// Returns name of a sticker set by its identifier @set_id Identifier of the sticker set
class TdGetStickerSetName extends TdObject {
  final int setId;

  TdGetStickerSetName({
    required this.setId,
  });

  @override
  String get tdType => 'getStickerSetName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStickerSetName',
      'set_id': setId,
    };
  }
}


/// Returns stickers from the installed sticker sets that correspond to any of the given emoji or can be...
class TdGetStickers extends TdObject {
  final TdStickerType? stickerType;
  final String query;
  final int limit;
  final int chatId;

  TdGetStickers({
    this.stickerType,
    required this.query,
    required this.limit,
    required this.chatId,
  });

  @override
  String get tdType => 'getStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStickers',
      'sticker_type': stickerType?.toMap(),
      'query': query,
      'limit': limit,
      'chat_id': chatId,
    };
  }
}


/// Returns storage usage statistics. Can be called before authorization
class TdGetStorageStatistics extends TdObject {
  final int chatLimit;

  TdGetStorageStatistics({
    required this.chatLimit,
  });

  @override
  String get tdType => 'getStorageStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStorageStatistics',
      'chat_limit': chatLimit,
    };
  }
}


/// Quickly returns approximate storage usage statistics. Can be called before authorization
class TdGetStorageStatisticsFast extends TdObject {
  TdGetStorageStatisticsFast();

  @override
  String get tdType => 'getStorageStatisticsFast';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStorageStatisticsFast',
    };
  }
}


/// Returns a story
class TdGetStory extends TdObject {
  final int storyPosterChatId;
  final int storyId;
  final bool onlyLocal;

  TdGetStory({
    required this.storyPosterChatId,
    required this.storyId,
    required this.onlyLocal,
  });

  @override
  String get tdType => 'getStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStory',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
      'only_local': onlyLocal,
    };
  }
}


/// Returns the list of stories added to the given story album. For optimal performance, the number of r...
class TdGetStoryAlbumStories extends TdObject {
  final int chatId;
  final int storyAlbumId;
  final int offset;
  final int limit;

  TdGetStoryAlbumStories({
    required this.chatId,
    required this.storyAlbumId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getStoryAlbumStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStoryAlbumStories',
      'chat_id': chatId,
      'story_album_id': storyAlbumId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns reactions, which can be chosen for a story @row_size Number of reaction per row, 5-25
class TdGetStoryAvailableReactions extends TdObject {
  final int rowSize;

  TdGetStoryAvailableReactions({
    required this.rowSize,
  });

  @override
  String get tdType => 'getStoryAvailableReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStoryAvailableReactions',
      'row_size': rowSize,
    };
  }
}


/// Returns interactions with a story. The method can be called only for stories posted on behalf of the...
class TdGetStoryInteractions extends TdObject {
  final int storyId;
  final String query;
  final bool onlyContacts;
  final bool preferForwards;
  final bool preferWithReaction;
  final String offset;
  final int limit;

  TdGetStoryInteractions({
    required this.storyId,
    required this.query,
    required this.onlyContacts,
    required this.preferForwards,
    required this.preferWithReaction,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getStoryInteractions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStoryInteractions',
      'story_id': storyId,
      'query': query,
      'only_contacts': onlyContacts,
      'prefer_forwards': preferForwards,
      'prefer_with_reaction': preferWithReaction,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns the list of chats with non-default notification settings for stories
class TdGetStoryNotificationSettingsExceptions extends TdObject {
  TdGetStoryNotificationSettingsExceptions();

  @override
  String get tdType => 'getStoryNotificationSettingsExceptions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStoryNotificationSettingsExceptions',
    };
  }
}


/// Returns forwards of a story as a message to public chats and reposts by public channels. Can be used...
class TdGetStoryPublicForwards extends TdObject {
  final int storyPosterChatId;
  final int storyId;
  final String offset;
  final int limit;

  TdGetStoryPublicForwards({
    required this.storyPosterChatId,
    required this.storyId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getStoryPublicForwards';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStoryPublicForwards',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns detailed statistics about a story. Can be used only if story.can_get_statistics == true @cha...
class TdGetStoryStatistics extends TdObject {
  final int chatId;
  final int storyId;
  final bool isDark;

  TdGetStoryStatistics({
    required this.chatId,
    required this.storyId,
    required this.isDark,
  });

  @override
  String get tdType => 'getStoryStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getStoryStatistics',
      'chat_id': chatId,
      'story_id': storyId,
      'is_dark': isDark,
    };
  }
}


/// Returns suggested name for saving a file in a given directory @file_id Identifier of the file @direc...
class TdGetSuggestedFileName extends TdObject {
  final int fileId;
  final String directory;

  TdGetSuggestedFileName({
    required this.fileId,
    required this.directory,
  });

  @override
  String get tdType => 'getSuggestedFileName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSuggestedFileName',
      'file_id': fileId,
      'directory': directory,
    };
  }
}


/// Returns a suggested name for a new sticker set with a given title @title Sticker set title; 1-64 cha...
class TdGetSuggestedStickerSetName extends TdObject {
  final String title;

  TdGetSuggestedStickerSetName({
    required this.title,
  });

  @override
  String get tdType => 'getSuggestedStickerSetName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSuggestedStickerSetName',
      'title': title,
    };
  }
}


/// Returns a list of basic group and supergroup chats, which can be used as a discussion group for a ch...
class TdGetSuitableDiscussionChats extends TdObject {
  TdGetSuitableDiscussionChats();

  @override
  String get tdType => 'getSuitableDiscussionChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSuitableDiscussionChats',
    };
  }
}


/// Returns a list of channel chats, which can be used as a personal chat
class TdGetSuitablePersonalChats extends TdObject {
  TdGetSuitablePersonalChats();

  @override
  String get tdType => 'getSuitablePersonalChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSuitablePersonalChats',
    };
  }
}


/// Returns information about a supergroup or a channel by its identifier. This is an offline method if ...
class TdGetSupergroup extends TdObject {
  final int supergroupId;

  TdGetSupergroup({
    required this.supergroupId,
  });

  @override
  String get tdType => 'getSupergroup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSupergroup',
      'supergroup_id': supergroupId,
    };
  }
}


/// Returns full information about a supergroup or a channel by its identifier, cached for up to 1 minut...
class TdGetSupergroupFullInfo extends TdObject {
  final int supergroupId;

  TdGetSupergroupFullInfo({
    required this.supergroupId,
  });

  @override
  String get tdType => 'getSupergroupFullInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSupergroupFullInfo',
      'supergroup_id': supergroupId,
    };
  }
}


/// Returns information about members or banned users in a supergroup or channel. Can be used only if su...
class TdGetSupergroupMembers extends TdObject {
  final int supergroupId;
  final TdSupergroupMembersFilter? filter;
  final int offset;
  final int limit;

  TdGetSupergroupMembers({
    required this.supergroupId,
    this.filter,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getSupergroupMembers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSupergroupMembers',
      'supergroup_id': supergroupId,
      'filter': filter?.toMap(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns localized name of the Telegram support user; for Telegram support only
class TdGetSupportName extends TdObject {
  TdGetSupportName();

  @override
  String get tdType => 'getSupportName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSupportName',
    };
  }
}


/// Returns a user that can be contacted to get support
class TdGetSupportUser extends TdObject {
  TdGetSupportUser();

  @override
  String get tdType => 'getSupportUser';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getSupportUser',
    };
  }
}


/// Returns information about the current temporary password
class TdGetTemporaryPasswordState extends TdObject {
  TdGetTemporaryPasswordState();

  @override
  String get tdType => 'getTemporaryPasswordState';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getTemporaryPasswordState',
    };
  }
}


/// Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, URLs, and email...
class TdGetTextEntities extends TdObject {
  final String text;

  TdGetTextEntities({
    required this.text,
  });

  @override
  String get tdType => 'getTextEntities';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getTextEntities',
      'text': text,
    };
  }
}


/// Converts a themeParameters object to corresponding JSON-serialized string. Can be called synchronous...
class TdGetThemeParametersJsonString extends TdObject {
  final TdThemeParameters? theme;

  TdGetThemeParametersJsonString({
    this.theme,
  });

  @override
  String get tdType => 'getThemeParametersJsonString';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getThemeParametersJsonString',
      'theme': theme?.toMap(),
    };
  }
}


/// Returns up to 8 emoji statuses, which must be shown in the emoji status list for chats
class TdGetThemedChatEmojiStatuses extends TdObject {
  TdGetThemedChatEmojiStatuses();

  @override
  String get tdType => 'getThemedChatEmojiStatuses';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getThemedChatEmojiStatuses',
    };
  }
}


/// Returns up to 8 emoji statuses, which must be shown right after the default Premium Badge in the emo...
class TdGetThemedEmojiStatuses extends TdObject {
  TdGetThemedEmojiStatuses();

  @override
  String get tdType => 'getThemedEmojiStatuses';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getThemedEmojiStatuses',
    };
  }
}


/// Returns the list of supported time zones
class TdGetTimeZones extends TdObject {
  TdGetTimeZones();

  @override
  String get tdType => 'getTimeZones';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getTimeZones',
    };
  }
}


/// Returns detailed Toncoin revenue statistics of the current user @is_dark Pass true if a dark theme i...
class TdGetTonRevenueStatistics extends TdObject {
  final bool isDark;

  TdGetTonRevenueStatistics({
    required this.isDark,
  });

  @override
  String get tdType => 'getTonRevenueStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getTonRevenueStatistics',
      'is_dark': isDark,
    };
  }
}


/// Returns the list of Toncoin transactions of the current user
class TdGetTonTransactions extends TdObject {
  final TdTransactionDirection? direction;
  final String offset;
  final int limit;

  TdGetTonTransactions({
    this.direction,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getTonTransactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getTonTransactions',
      'direction': direction?.toMap(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns a URL for Toncoin withdrawal from the current user\'s account. The user must have at least 10...
class TdGetTonWithdrawalUrl extends TdObject {
  final String password;

  TdGetTonWithdrawalUrl({
    required this.password,
  });

  @override
  String get tdType => 'getTonWithdrawalUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getTonWithdrawalUrl',
      'password': password,
    };
  }
}


/// Returns a list of frequently used chats @category Category of chats to be returned @limit The maximu...
class TdGetTopChats extends TdObject {
  final TdTopChatCategory? category;
  final int limit;

  TdGetTopChats({
    this.category,
    required this.limit,
  });

  @override
  String get tdType => 'getTopChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getTopChats',
      'category': category?.toMap(),
      'limit': limit,
    };
  }
}


/// Returns a list of trending sticker sets. For optimal performance, the number of returned sticker set...
class TdGetTrendingStickerSets extends TdObject {
  final TdStickerType? stickerType;
  final int offset;
  final int limit;

  TdGetTrendingStickerSets({
    this.stickerType,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getTrendingStickerSets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getTrendingStickerSets',
      'sticker_type': stickerType?.toMap(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns information about an upgraded gift by its name @name Unique name of the upgraded gift
class TdGetUpgradedGift extends TdObject {
  final String name;

  TdGetUpgradedGift({
    required this.name,
  });

  @override
  String get tdType => 'getUpgradedGift';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUpgradedGift',
      'name': name,
    };
  }
}


/// Returns available upgraded gift emoji statuses for self status
class TdGetUpgradedGiftEmojiStatuses extends TdObject {
  TdGetUpgradedGiftEmojiStatuses();

  @override
  String get tdType => 'getUpgradedGiftEmojiStatuses';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUpgradedGiftEmojiStatuses',
    };
  }
}


/// Returns information about value of an upgraded gift by its name @name Unique name of the upgraded gi...
class TdGetUpgradedGiftValueInfo extends TdObject {
  final String name;

  TdGetUpgradedGiftValueInfo({
    required this.name,
  });

  @override
  String get tdType => 'getUpgradedGiftValueInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUpgradedGiftValueInfo',
      'name': name,
    };
  }
}


/// Returns a URL for upgraded gift withdrawal in the TON blockchain as an NFT; requires owner privilege...
class TdGetUpgradedGiftWithdrawalUrl extends TdObject {
  final String receivedGiftId;
  final String password;

  TdGetUpgradedGiftWithdrawalUrl({
    required this.receivedGiftId,
    required this.password,
  });

  @override
  String get tdType => 'getUpgradedGiftWithdrawalUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUpgradedGiftWithdrawalUrl',
      'received_gift_id': receivedGiftId,
      'password': password,
    };
  }
}


/// Returns promotional anumation for upgraded gifts
class TdGetUpgradedGiftsPromotionalAnimation extends TdObject {
  TdGetUpgradedGiftsPromotionalAnimation();

  @override
  String get tdType => 'getUpgradedGiftsPromotionalAnimation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUpgradedGiftsPromotionalAnimation',
    };
  }
}


/// Returns information about a user by their identifier. This is an offline method if the current user ...
class TdGetUser extends TdObject {
  final int userId;

  TdGetUser({
    required this.userId,
  });

  @override
  String get tdType => 'getUser';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUser',
      'user_id': userId,
    };
  }
}


/// Returns the list of boosts applied to a chat by a given user; requires administrator rights in the c...
class TdGetUserChatBoosts extends TdObject {
  final int chatId;
  final int userId;

  TdGetUserChatBoosts({
    required this.chatId,
    required this.userId,
  });

  @override
  String get tdType => 'getUserChatBoosts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUserChatBoosts',
      'chat_id': chatId,
      'user_id': userId,
    };
  }
}


/// Returns full information about a user by their identifier @user_id User identifier
class TdGetUserFullInfo extends TdObject {
  final int userId;

  TdGetUserFullInfo({
    required this.userId,
  });

  @override
  String get tdType => 'getUserFullInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUserFullInfo',
      'user_id': userId,
    };
  }
}


/// Returns an HTTPS link, which can be used to get information about the current user
class TdGetUserLink extends TdObject {
  TdGetUserLink();

  @override
  String get tdType => 'getUserLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUserLink',
    };
  }
}


/// Returns the current privacy settings @setting The privacy setting
class TdGetUserPrivacySettingRules extends TdObject {
  final TdUserPrivacySetting? setting;

  TdGetUserPrivacySettingRules({
    this.setting,
  });

  @override
  String get tdType => 'getUserPrivacySettingRules';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUserPrivacySettingRules',
      'setting': setting?.toMap(),
    };
  }
}


/// Returns the list of profile audio files of a user
class TdGetUserProfileAudios extends TdObject {
  final int userId;
  final int offset;
  final int limit;

  TdGetUserProfileAudios({
    required this.userId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getUserProfileAudios';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUserProfileAudios',
      'user_id': userId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns the profile photos of a user. Personal and public photo aren\'t returned
class TdGetUserProfilePhotos extends TdObject {
  final int userId;
  final int offset;
  final int limit;

  TdGetUserProfilePhotos({
    required this.userId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'getUserProfilePhotos';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUserProfilePhotos',
      'user_id': userId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns support information for the given user; for Telegram support only @user_id User identifier
class TdGetUserSupportInfo extends TdObject {
  final int userId;

  TdGetUserSupportInfo({
    required this.userId,
  });

  @override
  String get tdType => 'getUserSupportInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getUserSupportInfo',
      'user_id': userId,
    };
  }
}


/// Returns the list of participant identifiers, on whose behalf a video chat in the chat can be joined ...
class TdGetVideoChatAvailableParticipants extends TdObject {
  final int chatId;

  TdGetVideoChatAvailableParticipants({
    required this.chatId,
  });

  @override
  String get tdType => 'getVideoChatAvailableParticipants';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getVideoChatAvailableParticipants',
      'chat_id': chatId,
    };
  }
}


/// Returns invite link to a video chat in a public chat
class TdGetVideoChatInviteLink extends TdObject {
  final int groupCallId;
  final bool canSelfUnmute;

  TdGetVideoChatInviteLink({
    required this.groupCallId,
    required this.canSelfUnmute,
  });

  @override
  String get tdType => 'getVideoChatInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getVideoChatInviteLink',
      'group_call_id': groupCallId,
      'can_self_unmute': canSelfUnmute,
    };
  }
}


/// Returns RTMP URL for streaming to the video chat of a chat; requires can_manage_video_chats administ...
class TdGetVideoChatRtmpUrl extends TdObject {
  final int chatId;

  TdGetVideoChatRtmpUrl({
    required this.chatId,
  });

  @override
  String get tdType => 'getVideoChatRtmpUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getVideoChatRtmpUrl',
      'chat_id': chatId,
    };
  }
}


/// Returns advertisements to be shown while a video from a message is watched. Available only if messag...
class TdGetVideoMessageAdvertisements extends TdObject {
  final int chatId;
  final int messageId;

  TdGetVideoMessageAdvertisements({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'getVideoMessageAdvertisements';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getVideoMessageAdvertisements',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Returns an HTTPS URL of a Web App to open after a link of the type internalLinkTypeWebApp is clicked
class TdGetWebAppLinkUrl extends TdObject {
  final int chatId;
  final int botUserId;
  final String webAppShortName;
  final String startParameter;
  final bool allowWriteAccess;
  final TdWebAppOpenParameters? eters;

  TdGetWebAppLinkUrl({
    required this.chatId,
    required this.botUserId,
    required this.webAppShortName,
    required this.startParameter,
    required this.allowWriteAccess,
    this.eters,
  });

  @override
  String get tdType => 'getWebAppLinkUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getWebAppLinkUrl',
      'chat_id': chatId,
      'bot_user_id': botUserId,
      'web_app_short_name': webAppShortName,
      'start_parameter': startParameter,
      'allow_write_access': allowWriteAccess,
      'parameters': eters?.toMap(),
    };
  }
}


/// Returns a default placeholder for Web Apps of a bot. This is an offline method. Returns a 404 error ...
class TdGetWebAppPlaceholder extends TdObject {
  final int botUserId;

  TdGetWebAppPlaceholder({
    required this.botUserId,
  });

  @override
  String get tdType => 'getWebAppPlaceholder';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getWebAppPlaceholder',
      'bot_user_id': botUserId,
    };
  }
}


/// Returns an HTTPS URL of a Web App to open from the side menu, a keyboardButtonTypeWebApp button, or ...
class TdGetWebAppUrl extends TdObject {
  final int botUserId;
  final String url;
  final TdWebAppOpenParameters? eters;

  TdGetWebAppUrl({
    required this.botUserId,
    required this.url,
    this.eters,
  });

  @override
  String get tdType => 'getWebAppUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getWebAppUrl',
      'bot_user_id': botUserId,
      'url': url,
      'parameters': eters?.toMap(),
    };
  }
}


/// Returns an instant view version of a web page if available. This is an offline method if only_local ...
class TdGetWebPageInstantView extends TdObject {
  final String url;
  final bool onlyLocal;

  TdGetWebPageInstantView({
    required this.url,
    required this.onlyLocal,
  });

  @override
  String get tdType => 'getWebPageInstantView';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'getWebPageInstantView',
      'url': url,
      'only_local': onlyLocal,
    };
  }
}


/// Allows to buy a Telegram Premium subscription for another user with payment in Telegram Stars; for b...
class TdGiftPremiumWithStars extends TdObject {
  final int userId;
  final int starCount;
  final int monthCount;
  final TdFormattedText? text;

  TdGiftPremiumWithStars({
    required this.userId,
    required this.starCount,
    required this.monthCount,
    this.text,
  });

  @override
  String get tdType => 'giftPremiumWithStars';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'giftPremiumWithStars',
      'user_id': userId,
      'star_count': starCount,
      'month_count': monthCount,
      'text': text?.toMap(),
    };
  }
}


/// Hides the list of contacts that have close birthdays for 24 hours
class TdHideContactCloseBirthdays extends TdObject {
  TdHideContactCloseBirthdays();

  @override
  String get tdType => 'hideContactCloseBirthdays';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'hideContactCloseBirthdays',
    };
  }
}


/// Hides a suggested action @action Suggested action to hide
class TdHideSuggestedAction extends TdObject {
  final TdSuggestedAction? action;

  TdHideSuggestedAction({
    this.action,
  });

  @override
  String get tdType => 'hideSuggestedAction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'hideSuggestedAction',
      'action': action?.toMap(),
    };
  }
}


/// Adds new contacts or edits existing contacts by their phone numbers; contacts\' user identifiers are ...
class TdImportContacts extends TdObject {
  final List<TdImportedContact> contacts;

  TdImportContacts({
    required this.contacts,
  });

  @override
  String get tdType => 'importContacts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'importContacts',
      'contacts': contacts.map((e) => e.toMap()).toList(),
    };
  }
}


/// Imports messages exported from another app
class TdImportMessages extends TdObject {
  final int chatId;
  final TdInputFile? messageFile;
  final List<TdInputFile> attachedFiles;

  TdImportMessages({
    required this.chatId,
    this.messageFile,
    required this.attachedFiles,
  });

  @override
  String get tdType => 'importMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'importMessages',
      'chat_id': chatId,
      'message_file': messageFile?.toMap(),
      'attached_files': attachedFiles.map((e) => e.toMap()).toList(),
    };
  }
}


/// Increases a bid for an auction gift without changing gift text and receiver
class TdIncreaseGiftAuctionBid extends TdObject {
  final int giftId;
  final int starCount;

  TdIncreaseGiftAuctionBid({
    required this.giftId,
    required this.starCount,
  });

  @override
  String get tdType => 'increaseGiftAuctionBid';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'increaseGiftAuctionBid',
      'gift_id': giftId,
      'star_count': starCount,
    };
  }
}


/// Invites a user to an active group call; for group calls not bound to a chat only. Sends a service me...
class TdInviteGroupCallParticipant extends TdObject {
  final int groupCallId;
  final int userId;
  final bool isVideo;

  TdInviteGroupCallParticipant({
    required this.groupCallId,
    required this.userId,
    required this.isVideo,
  });

  @override
  String get tdType => 'inviteGroupCallParticipant';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'inviteGroupCallParticipant',
      'group_call_id': groupCallId,
      'user_id': userId,
      'is_video': isVideo,
    };
  }
}


/// Invites users to an active video chat. Sends a service message of the type messageInviteVideoChatPar...
class TdInviteVideoChatParticipants extends TdObject {
  final int groupCallId;
  final List<int> userIds;

  TdInviteVideoChatParticipants({
    required this.groupCallId,
    required this.userIds,
  });

  @override
  String get tdType => 'inviteVideoChatParticipants';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'inviteVideoChatParticipants',
      'group_call_id': groupCallId,
      'user_ids': userIds,
    };
  }
}


/// Checks whether the current user is required to set login email address
class TdIsLoginEmailAddressRequired extends TdObject {
  TdIsLoginEmailAddressRequired();

  @override
  String get tdType => 'isLoginEmailAddressRequired';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'isLoginEmailAddressRequired',
    };
  }
}


/// Checks whether a file is in the profile audio files of the current user. Returns a 404 error if it i...
class TdIsProfileAudio extends TdObject {
  final int fileId;

  TdIsProfileAudio({
    required this.fileId,
  });

  @override
  String get tdType => 'isProfileAudio';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'isProfileAudio',
      'file_id': fileId,
    };
  }
}


/// Adds the current user as a new member to a chat. Private and secret chats can\'t be joined using this...
class TdJoinChat extends TdObject {
  final int chatId;

  TdJoinChat({
    required this.chatId,
  });

  @override
  String get tdType => 'joinChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'joinChat',
      'chat_id': chatId,
    };
  }
}


/// Uses an invite link to add the current user to the chat if possible. May return an error with a mess...
class TdJoinChatByInviteLink extends TdObject {
  final String inviteLink;

  TdJoinChatByInviteLink({
    required this.inviteLink,
  });

  @override
  String get tdType => 'joinChatByInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'joinChatByInviteLink',
      'invite_link': inviteLink,
    };
  }
}


/// Joins a regular group call that is not bound to a chat @input_group_call The group call to join @joi...
class TdJoinGroupCall extends TdObject {
  final TdInputGroupCall? inputGroupCall;
  final TdGroupCallJoinParameters? joinParameters;

  TdJoinGroupCall({
    this.inputGroupCall,
    this.joinParameters,
  });

  @override
  String get tdType => 'joinGroupCall';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'joinGroupCall',
      'input_group_call': inputGroupCall?.toMap(),
      'join_parameters': joinParameters?.toMap(),
    };
  }
}


/// Joins a group call of an active live story. Returns join response payload for tgcalls
class TdJoinLiveStory extends TdObject {
  final int groupCallId;
  final TdGroupCallJoinParameters? joinParameters;

  TdJoinLiveStory({
    required this.groupCallId,
    this.joinParameters,
  });

  @override
  String get tdType => 'joinLiveStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'joinLiveStory',
      'group_call_id': groupCallId,
      'join_parameters': joinParameters?.toMap(),
    };
  }
}


/// Joins an active video chat. Returns join response payload for tgcalls
class TdJoinVideoChat extends TdObject {
  final int groupCallId;
  final TdMessageSender? participantId;
  final TdGroupCallJoinParameters? joinParameters;
  final String inviteHash;

  TdJoinVideoChat({
    required this.groupCallId,
    this.participantId,
    this.joinParameters,
    required this.inviteHash,
  });

  @override
  String get tdType => 'joinVideoChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'joinVideoChat',
      'group_call_id': groupCallId,
      'participant_id': participantId?.toMap(),
      'join_parameters': joinParameters?.toMap(),
      'invite_hash': inviteHash,
    };
  }
}


/// Launches a prepaid giveaway
class TdLaunchPrepaidGiveaway extends TdObject {
  final int giveawayId;
  final TdGiveawayParameters? eters;
  final int winnerCount;
  final int starCount;

  TdLaunchPrepaidGiveaway({
    required this.giveawayId,
    this.eters,
    required this.winnerCount,
    required this.starCount,
  });

  @override
  String get tdType => 'launchPrepaidGiveaway';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'launchPrepaidGiveaway',
      'giveaway_id': giveawayId,
      'parameters': eters?.toMap(),
      'winner_count': winnerCount,
      'star_count': starCount,
    };
  }
}


/// Removes the current user from chat members. Private and secret chats can\'t be left using this method...
class TdLeaveChat extends TdObject {
  final int chatId;

  TdLeaveChat({
    required this.chatId,
  });

  @override
  String get tdType => 'leaveChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'leaveChat',
      'chat_id': chatId,
    };
  }
}


/// Leaves a group call @group_call_id Group call identifier
class TdLeaveGroupCall extends TdObject {
  final int groupCallId;

  TdLeaveGroupCall({
    required this.groupCallId,
  });

  @override
  String get tdType => 'leaveGroupCall';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'leaveGroupCall',
      'group_call_id': groupCallId,
    };
  }
}


/// Loads more active stories from a story list. The loaded stories will be sent through updates. Active...
class TdLoadActiveStories extends TdObject {
  final TdStoryList? storyList;

  TdLoadActiveStories({
    this.storyList,
  });

  @override
  String get tdType => 'loadActiveStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'loadActiveStories',
      'story_list': storyList?.toMap(),
    };
  }
}


/// Loads more chats from a chat list. The loaded chats and their positions in the chat list will be sen...
class TdLoadChats extends TdObject {
  final TdChatList? chatList;
  final int limit;

  TdLoadChats({
    this.chatList,
    required this.limit,
  });

  @override
  String get tdType => 'loadChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'loadChats',
      'chat_list': chatList?.toMap(),
      'limit': limit,
    };
  }
}


/// Loads more topics in a channel direct messages chat administered by the current user. The loaded top...
class TdLoadDirectMessagesChatTopics extends TdObject {
  final int chatId;
  final int limit;

  TdLoadDirectMessagesChatTopics({
    required this.chatId,
    required this.limit,
  });

  @override
  String get tdType => 'loadDirectMessagesChatTopics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'loadDirectMessagesChatTopics',
      'chat_id': chatId,
      'limit': limit,
    };
  }
}


/// Loads more participants of a group call; not supported in live stories. The loaded participants will...
class TdLoadGroupCallParticipants extends TdObject {
  final int groupCallId;
  final int limit;

  TdLoadGroupCallParticipants({
    required this.groupCallId,
    required this.limit,
  });

  @override
  String get tdType => 'loadGroupCallParticipants';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'loadGroupCallParticipants',
      'group_call_id': groupCallId,
      'limit': limit,
    };
  }
}


/// Loads quick reply messages that can be sent by a given quick reply shortcut. The loaded messages wil...
class TdLoadQuickReplyShortcutMessages extends TdObject {
  final int shortcutId;

  TdLoadQuickReplyShortcutMessages({
    required this.shortcutId,
  });

  @override
  String get tdType => 'loadQuickReplyShortcutMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'loadQuickReplyShortcutMessages',
      'shortcut_id': shortcutId,
    };
  }
}


/// Loads quick reply shortcuts created by the current user. The loaded data will be sent through update...
class TdLoadQuickReplyShortcuts extends TdObject {
  TdLoadQuickReplyShortcuts();

  @override
  String get tdType => 'loadQuickReplyShortcuts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'loadQuickReplyShortcuts',
    };
  }
}


/// Loads more Saved Messages topics. The loaded topics will be sent through updateSavedMessagesTopic. T...
class TdLoadSavedMessagesTopics extends TdObject {
  final int limit;

  TdLoadSavedMessagesTopics({
    required this.limit,
  });

  @override
  String get tdType => 'loadSavedMessagesTopics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'loadSavedMessagesTopics',
      'limit': limit,
    };
  }
}


/// Closes the TDLib instance after a proper logout. Requires an available network connection. All local...
class TdLogOut extends TdObject {
  TdLogOut();

  @override
  String get tdType => 'logOut';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'logOut',
    };
  }
}


/// Adds tasks of a checklist in a message as done or not done
class TdMarkChecklistTasksAsDone extends TdObject {
  final int chatId;
  final int messageId;
  final List<int> markedAsDoneTaskIds;
  final List<int> markedAsNotDoneTaskIds;

  TdMarkChecklistTasksAsDone({
    required this.chatId,
    required this.messageId,
    required this.markedAsDoneTaskIds,
    required this.markedAsNotDoneTaskIds,
  });

  @override
  String get tdType => 'markChecklistTasksAsDone';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'markChecklistTasksAsDone',
      'chat_id': chatId,
      'message_id': messageId,
      'marked_as_done_task_ids': markedAsDoneTaskIds,
      'marked_as_not_done_task_ids': markedAsNotDoneTaskIds,
    };
  }
}


/// Informs TDLib that a bot was opened from the list of similar bots
class TdOpenBotSimilarBot extends TdObject {
  final int botUserId;
  final int openedBotUserId;

  TdOpenBotSimilarBot({
    required this.botUserId,
    required this.openedBotUserId,
  });

  @override
  String get tdType => 'openBotSimilarBot';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'openBotSimilarBot',
      'bot_user_id': botUserId,
      'opened_bot_user_id': openedBotUserId,
    };
  }
}


/// Informs TDLib that the chat is opened by the user. Many useful activities depend on the chat being o...
class TdOpenChat extends TdObject {
  final int chatId;

  TdOpenChat({
    required this.chatId,
  });

  @override
  String get tdType => 'openChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'openChat',
      'chat_id': chatId,
    };
  }
}


/// Informs TDLib that a chat was opened from the list of similar chats. The method is independent of op...
class TdOpenChatSimilarChat extends TdObject {
  final int chatId;
  final int openedChatId;

  TdOpenChatSimilarChat({
    required this.chatId,
    required this.openedChatId,
  });

  @override
  String get tdType => 'openChatSimilarChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'openChatSimilarChat',
      'chat_id': chatId,
      'opened_chat_id': openedChatId,
    };
  }
}


/// Informs TDLib that a gift auction was opened by the user @gift_id Identifier of the gift, which auct...
class TdOpenGiftAuction extends TdObject {
  final int giftId;

  TdOpenGiftAuction({
    required this.giftId,
  });

  @override
  String get tdType => 'openGiftAuction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'openGiftAuction',
      'gift_id': giftId,
    };
  }
}


/// Informs TDLib that the message content has been opened (e.g., the user has opened a photo, video, do...
class TdOpenMessageContent extends TdObject {
  final int chatId;
  final int messageId;

  TdOpenMessageContent({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'openMessageContent';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'openMessageContent',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Informs TDLib that the user opened a sponsored chat @sponsored_chat_unique_id Unique identifier of t...
class TdOpenSponsoredChat extends TdObject {
  final int sponsoredChatUniqueId;

  TdOpenSponsoredChat({
    required this.sponsoredChatUniqueId,
  });

  @override
  String get tdType => 'openSponsoredChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'openSponsoredChat',
      'sponsored_chat_unique_id': sponsoredChatUniqueId,
    };
  }
}


/// Informs TDLib that a story is opened and is being viewed by the user
class TdOpenStory extends TdObject {
  final int storyPosterChatId;
  final int storyId;

  TdOpenStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  @override
  String get tdType => 'openStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'openStory',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
    };
  }
}


/// Informs TDLib that a Web App is being opened from the attachment menu, a botMenuButton button, an in...
class TdOpenWebApp extends TdObject {
  final int chatId;
  final int botUserId;
  final String url;
  final TdMessageTopic? topicId;
  final TdInputMessageReplyTo? replyTo;
  final TdWebAppOpenParameters? eters;

  TdOpenWebApp({
    required this.chatId,
    required this.botUserId,
    required this.url,
    this.topicId,
    this.replyTo,
    this.eters,
  });

  @override
  String get tdType => 'openWebApp';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'openWebApp',
      'chat_id': chatId,
      'bot_user_id': botUserId,
      'url': url,
      'topic_id': topicId?.toMap(),
      'reply_to': replyTo?.toMap(),
      'parameters': eters?.toMap(),
    };
  }
}


/// Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret th...
class TdOptimizeStorage extends TdObject {
  final int size;
  final int ttl;
  final int count;
  final int immunityDelay;
  final List<TdFileType> fileTypes;
  final List<int> chatIds;
  final List<int> excludeChatIds;
  final bool returnDeletedFileStatistics;
  final int chatLimit;

  TdOptimizeStorage({
    required this.size,
    required this.ttl,
    required this.count,
    required this.immunityDelay,
    required this.fileTypes,
    required this.chatIds,
    required this.excludeChatIds,
    required this.returnDeletedFileStatistics,
    required this.chatLimit,
  });

  @override
  String get tdType => 'optimizeStorage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'optimizeStorage',
      'size': size,
      'ttl': ttl,
      'count': count,
      'immunity_delay': immunityDelay,
      'file_types': fileTypes.map((e) => e.toMap()).toList(),
      'chat_ids': chatIds,
      'exclude_chat_ids': excludeChatIds,
      'return_deleted_file_statistics': returnDeletedFileStatistics,
      'chat_limit': chatLimit,
    };
  }
}


/// Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchrono...
class TdParseMarkdown extends TdObject {
  final TdFormattedText? text;

  TdParseMarkdown({
    this.text,
  });

  @override
  String get tdType => 'parseMarkdown';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'parseMarkdown',
      'text': text?.toMap(),
    };
  }
}


/// Parses Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, ExpandableBlockQuot...
class TdParseTextEntities extends TdObject {
  final String text;
  final TdTextParseMode? parseMode;

  TdParseTextEntities({
    required this.text,
    this.parseMode,
  });

  @override
  String get tdType => 'parseTextEntities';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'parseTextEntities',
      'text': text,
      'parse_mode': parseMode?.toMap(),
    };
  }
}


/// Pins a message in a chat. A message can be pinned only if messageProperties.can_be_pinned
class TdPinChatMessage extends TdObject {
  final int chatId;
  final int messageId;
  final bool disableNotification;
  final bool onlyForSelf;

  TdPinChatMessage({
    required this.chatId,
    required this.messageId,
    required this.disableNotification,
    required this.onlyForSelf,
  });

  @override
  String get tdType => 'pinChatMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'pinChatMessage',
      'chat_id': chatId,
      'message_id': messageId,
      'disable_notification': disableNotification,
      'only_for_self': onlyForSelf,
    };
  }
}


/// Computes time needed to receive a response from a Telegram server through a proxy. Can be called bef...
class TdPingProxy extends TdObject {
  final int proxyId;

  TdPingProxy({
    required this.proxyId,
  });

  @override
  String get tdType => 'pingProxy';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'pingProxy',
      'proxy_id': proxyId,
    };
  }
}


/// Places a bid on an auction gift Must be empty if the receiver enabled paid messages
class TdPlaceGiftAuctionBid extends TdObject {
  final int giftId;
  final int starCount;
  final int userId;
  final TdFormattedText? text;
  final bool isPrivate;

  TdPlaceGiftAuctionBid({
    required this.giftId,
    required this.starCount,
    required this.userId,
    this.text,
    required this.isPrivate,
  });

  @override
  String get tdType => 'placeGiftAuctionBid';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'placeGiftAuctionBid',
      'gift_id': giftId,
      'star_count': starCount,
      'user_id': userId,
      'text': text?.toMap(),
      'is_private': isPrivate,
    };
  }
}


/// Posts a new story on behalf of a chat; requires can_post_stories administrator right for supergroup ...
class TdPostStory extends TdObject {
  final int chatId;
  final TdInputStoryContent? content;
  final TdInputStoryAreas? areas;
  final TdFormattedText? caption;
  final TdStoryPrivacySettings? privacySettings;
  final List<int> albumIds;
  final int activePeriod;
  final TdStoryFullId? fromStoryFullId;
  final bool isPostedToChatPage;
  final bool protectContent;

  TdPostStory({
    required this.chatId,
    this.content,
    this.areas,
    this.caption,
    this.privacySettings,
    required this.albumIds,
    required this.activePeriod,
    this.fromStoryFullId,
    required this.isPostedToChatPage,
    required this.protectContent,
  });

  @override
  String get tdType => 'postStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'postStory',
      'chat_id': chatId,
      'content': content?.toMap(),
      'areas': areas?.toMap(),
      'caption': caption?.toMap(),
      'privacy_settings': privacySettings?.toMap(),
      'album_ids': albumIds,
      'active_period': activePeriod,
      'from_story_full_id': fromStoryFullId?.toMap(),
      'is_posted_to_chat_page': isPostedToChatPage,
      'protect_content': protectContent,
    };
  }
}


/// Preliminarily uploads a file to the cloud before sending it in a message, which can be useful for up...
class TdPreliminaryUploadFile extends TdObject {
  final TdInputFile? file;
  final TdFileType? fileType;
  final int priority;

  TdPreliminaryUploadFile({
    this.file,
    this.fileType,
    required this.priority,
  });

  @override
  String get tdType => 'preliminaryUploadFile';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'preliminaryUploadFile',
      'file': file?.toMap(),
      'file_type': fileType?.toMap(),
      'priority': priority,
    };
  }
}


/// Process new chats added to a shareable chat folder by its owner @chat_folder_id Chat folder identifi...
class TdProcessChatFolderNewChats extends TdObject {
  final int chatFolderId;
  final List<int> addedChatIds;

  TdProcessChatFolderNewChats({
    required this.chatFolderId,
    required this.addedChatIds,
  });

  @override
  String get tdType => 'processChatFolderNewChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'processChatFolderNewChats',
      'chat_folder_id': chatFolderId,
      'added_chat_ids': addedChatIds,
    };
  }
}


/// Handles a pending join request in a chat @chat_id Chat identifier @user_id Identifier of the user th...
class TdProcessChatJoinRequest extends TdObject {
  final int chatId;
  final int userId;
  final bool approve;

  TdProcessChatJoinRequest({
    required this.chatId,
    required this.userId,
    required this.approve,
  });

  @override
  String get tdType => 'processChatJoinRequest';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'processChatJoinRequest',
      'chat_id': chatId,
      'user_id': userId,
      'approve': approve,
    };
  }
}


/// Handles all pending join requests for a given link in a chat
class TdProcessChatJoinRequests extends TdObject {
  final int chatId;
  final String inviteLink;
  final bool approve;

  TdProcessChatJoinRequests({
    required this.chatId,
    required this.inviteLink,
    required this.approve,
  });

  @override
  String get tdType => 'processChatJoinRequests';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'processChatJoinRequests',
      'chat_id': chatId,
      'invite_link': inviteLink,
      'approve': approve,
    };
  }
}


/// Handles a pending gift purchase offer
class TdProcessGiftPurchaseOffer extends TdObject {
  final int messageId;
  final bool approve;

  TdProcessGiftPurchaseOffer({
    required this.messageId,
    required this.approve,
  });

  @override
  String get tdType => 'processGiftPurchaseOffer';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'processGiftPurchaseOffer',
      'message_id': messageId,
      'approve': approve,
    };
  }
}


/// Handles a push notification. Returns error with code 406 if the push notification is not supported a...
class TdProcessPushNotification extends TdObject {
  final String payload;

  TdProcessPushNotification({
    required this.payload,
  });

  @override
  String get tdType => 'processPushNotification';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'processPushNotification',
      'payload': payload,
    };
  }
}


/// Rates recognized speech in a video note or a voice note message @chat_id Identifier of the chat to w...
class TdRateSpeechRecognition extends TdObject {
  final int chatId;
  final int messageId;
  final bool isGood;

  TdRateSpeechRecognition({
    required this.chatId,
    required this.messageId,
    required this.isGood,
  });

  @override
  String get tdType => 'rateSpeechRecognition';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'rateSpeechRecognition',
      'chat_id': chatId,
      'message_id': messageId,
      'is_good': isGood,
    };
  }
}


/// Marks all mentions in a chat as read @chat_id Chat identifier
class TdReadAllChatMentions extends TdObject {
  final int chatId;

  TdReadAllChatMentions({
    required this.chatId,
  });

  @override
  String get tdType => 'readAllChatMentions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'readAllChatMentions',
      'chat_id': chatId,
    };
  }
}


/// Marks all reactions in a chat as read @chat_id Chat identifier
class TdReadAllChatReactions extends TdObject {
  final int chatId;

  TdReadAllChatReactions({
    required this.chatId,
  });

  @override
  String get tdType => 'readAllChatReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'readAllChatReactions',
      'chat_id': chatId,
    };
  }
}


/// Removes all unread reactions in the topic in a channel direct messages chat administered by the curr...
class TdReadAllDirectMessagesChatTopicReactions extends TdObject {
  final int chatId;
  final int topicId;

  TdReadAllDirectMessagesChatTopicReactions({
    required this.chatId,
    required this.topicId,
  });

  @override
  String get tdType => 'readAllDirectMessagesChatTopicReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'readAllDirectMessagesChatTopicReactions',
      'chat_id': chatId,
      'topic_id': topicId,
    };
  }
}


/// Marks all mentions in a topic in a forum supergroup chat as read
class TdReadAllForumTopicMentions extends TdObject {
  final int chatId;
  final int forumTopicId;

  TdReadAllForumTopicMentions({
    required this.chatId,
    required this.forumTopicId,
  });

  @override
  String get tdType => 'readAllForumTopicMentions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'readAllForumTopicMentions',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
    };
  }
}


/// Marks all reactions in a topic in a forum supergroup chat or a chat with a bot with topics as read
class TdReadAllForumTopicReactions extends TdObject {
  final int chatId;
  final int forumTopicId;

  TdReadAllForumTopicReactions({
    required this.chatId,
    required this.forumTopicId,
  });

  @override
  String get tdType => 'readAllForumTopicReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'readAllForumTopicReactions',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
    };
  }
}


/// Reads a message on behalf of a business account; for bots only
class TdReadBusinessMessage extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final int messageId;

  TdReadBusinessMessage({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'readBusinessMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'readBusinessMessage',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Traverses all chats in a chat list and marks all messages in the chats as read @chat_list Chat list ...
class TdReadChatList extends TdObject {
  final TdChatList? chatList;

  TdReadChatList({
    this.chatList,
  });

  @override
  String get tdType => 'readChatList';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'readChatList',
      'chat_list': chatList?.toMap(),
    };
  }
}


/// Reads a part of a file from the TDLib file cache and returns read bytes. This method is intended to ...
class TdReadFilePart extends TdObject {
  final int fileId;
  final int offset;
  final int count;

  TdReadFilePart({
    required this.fileId,
    required this.offset,
    required this.count,
  });

  @override
  String get tdType => 'readFilePart';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'readFilePart',
      'file_id': fileId,
      'offset': offset,
      'count': count,
    };
  }
}


/// Readds quick reply messages which failed to add. Can be called only for messages for which messageSe...
class TdReaddQuickReplyShortcutMessages extends TdObject {
  final String shortcutName;
  final List<int> messageIds;

  TdReaddQuickReplyShortcutMessages({
    required this.shortcutName,
    required this.messageIds,
  });

  @override
  String get tdType => 'readdQuickReplyShortcutMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'readdQuickReplyShortcutMessages',
      'shortcut_name': shortcutName,
      'message_ids': messageIds,
    };
  }
}


/// Recognizes speech in a video note or a voice note message
class TdRecognizeSpeech extends TdObject {
  final int chatId;
  final int messageId;

  TdRecognizeSpeech({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'recognizeSpeech';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'recognizeSpeech',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Recovers the 2-step verification password with a password recovery code sent to an email address tha...
class TdRecoverAuthenticationPassword extends TdObject {
  final String recoveryCode;
  final String newPassword;
  final String newHint;

  TdRecoverAuthenticationPassword({
    required this.recoveryCode,
    required this.newPassword,
    required this.newHint,
  });

  @override
  String get tdType => 'recoverAuthenticationPassword';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'recoverAuthenticationPassword',
      'recovery_code': recoveryCode,
      'new_password': newPassword,
      'new_hint': newHint,
    };
  }
}


/// Recovers the 2-step verification password using a recovery code sent to an email address that was pr...
class TdRecoverPassword extends TdObject {
  final String recoveryCode;
  final String newPassword;
  final String newHint;

  TdRecoverPassword({
    required this.recoveryCode,
    required this.newPassword,
    required this.newHint,
  });

  @override
  String get tdType => 'recoverPassword';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'recoverPassword',
      'recovery_code': recoveryCode,
      'new_password': newPassword,
      'new_hint': newHint,
    };
  }
}


/// Refunds a previously done payment in Telegram Stars; for bots only
class TdRefundStarPayment extends TdObject {
  final int userId;
  final String telegramPaymentChargeId;

  TdRefundStarPayment({
    required this.userId,
    required this.telegramPaymentChargeId,
  });

  @override
  String get tdType => 'refundStarPayment';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'refundStarPayment',
      'user_id': userId,
      'telegram_payment_charge_id': telegramPaymentChargeId,
    };
  }
}


/// Registers the currently used device for receiving push notifications. Returns a globally unique iden...
class TdRegisterDevice extends TdObject {
  final TdDeviceToken? deviceToken;
  final List<int> otherUserIds;

  TdRegisterDevice({
    this.deviceToken,
    required this.otherUserIds,
  });

  @override
  String get tdType => 'registerDevice';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'registerDevice',
      'device_token': deviceToken?.toMap(),
      'other_user_ids': otherUserIds,
    };
  }
}


/// Finishes user registration. Works only when the current authorization state is authorizationStateWai...
class TdRegisterUser extends TdObject {
  final String firstName;
  final String lastName;
  final bool disableNotification;

  TdRegisterUser({
    required this.firstName,
    required this.lastName,
    required this.disableNotification,
  });

  @override
  String get tdType => 'registerUser';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'registerUser',
      'first_name': firstName,
      'last_name': lastName,
      'disable_notification': disableNotification,
    };
  }
}


/// Removes all files from the file download list
class TdRemoveAllFilesFromDownloads extends TdObject {
  final bool onlyActive;
  final bool onlyCompleted;
  final bool deleteFromCache;

  TdRemoveAllFilesFromDownloads({
    required this.onlyActive,
    required this.onlyCompleted,
    required this.deleteFromCache,
  });

  @override
  String get tdType => 'removeAllFilesFromDownloads';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeAllFilesFromDownloads',
      'only_active': onlyActive,
      'only_completed': onlyCompleted,
      'delete_from_cache': deleteFromCache,
    };
  }
}


/// Removes the connected business bot from a specific chat by adding the chat to businessRecipients.exc...
class TdRemoveBusinessConnectedBotFromChat extends TdObject {
  final int chatId;

  TdRemoveBusinessConnectedBotFromChat({
    required this.chatId,
  });

  @override
  String get tdType => 'removeBusinessConnectedBotFromChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeBusinessConnectedBotFromChat',
      'chat_id': chatId,
    };
  }
}


/// Removes a chat action bar without any other action @chat_id Chat identifier
class TdRemoveChatActionBar extends TdObject {
  final int chatId;

  TdRemoveChatActionBar({
    required this.chatId,
  });

  @override
  String get tdType => 'removeChatActionBar';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeChatActionBar',
      'chat_id': chatId,
    };
  }
}


/// Removes users from the contact list @user_ids Identifiers of users to be deleted
class TdRemoveContacts extends TdObject {
  final List<int> userIds;

  TdRemoveContacts({
    required this.userIds,
  });

  @override
  String get tdType => 'removeContacts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeContacts',
      'user_ids': userIds,
    };
  }
}


/// Removes a sticker from the list of favorite stickers @sticker Sticker file to delete from the list
class TdRemoveFavoriteSticker extends TdObject {
  final TdInputFile? sticker;

  TdRemoveFavoriteSticker({
    this.sticker,
  });

  @override
  String get tdType => 'removeFavoriteSticker';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeFavoriteSticker',
      'sticker': sticker?.toMap(),
    };
  }
}


/// Removes a file from the file download list @file_id Identifier of the downloaded file @delete_from_c...
class TdRemoveFileFromDownloads extends TdObject {
  final int fileId;
  final bool deleteFromCache;

  TdRemoveFileFromDownloads({
    required this.fileId,
    required this.deleteFromCache,
  });

  @override
  String get tdType => 'removeFileFromDownloads';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeFileFromDownloads',
      'file_id': fileId,
      'delete_from_cache': deleteFromCache,
    };
  }
}


/// Removes gifts from a collection. If the collection is owned by a channel chat, then requires can_pos...
class TdRemoveGiftCollectionGifts extends TdObject {
  final TdMessageSender? ownerId;
  final int collectionId;
  final List<String> receivedGiftIds;

  TdRemoveGiftCollectionGifts({
    this.ownerId,
    required this.collectionId,
    required this.receivedGiftIds,
  });

  @override
  String get tdType => 'removeGiftCollectionGifts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeGiftCollectionGifts',
      'owner_id': ownerId?.toMap(),
      'collection_id': collectionId,
      'received_gift_ids': receivedGiftIds,
    };
  }
}


/// Removes background from the list of installed backgrounds @background_id The background identifier
class TdRemoveInstalledBackground extends TdObject {
  final int backgroundId;

  TdRemoveInstalledBackground({
    required this.backgroundId,
  });

  @override
  String get tdType => 'removeInstalledBackground';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeInstalledBackground',
      'background_id': backgroundId,
    };
  }
}


/// Removes a passkey from the list of passkeys allowed to be used for the login by the current user @pa...
class TdRemoveLoginPasskey extends TdObject {
  final String passkeyId;

  TdRemoveLoginPasskey({
    required this.passkeyId,
  });

  @override
  String get tdType => 'removeLoginPasskey';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeLoginPasskey',
      'passkey_id': passkeyId,
    };
  }
}


/// Removes a reaction from a message. A chosen reaction can always be removed
class TdRemoveMessageReaction extends TdObject {
  final int chatId;
  final int messageId;
  final TdReactionType? reactionType;

  TdRemoveMessageReaction({
    required this.chatId,
    required this.messageId,
    this.reactionType,
  });

  @override
  String get tdType => 'removeMessageReaction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeMessageReaction',
      'chat_id': chatId,
      'message_id': messageId,
      'reaction_type': reactionType?.toMap(),
    };
  }
}


/// Removes the verification status of a user or a chat by an owned bot
class TdRemoveMessageSenderBotVerification extends TdObject {
  final int botUserId;
  final TdMessageSender? verifiedId;

  TdRemoveMessageSenderBotVerification({
    required this.botUserId,
    this.verifiedId,
  });

  @override
  String get tdType => 'removeMessageSenderBotVerification';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeMessageSenderBotVerification',
      'bot_user_id': botUserId,
      'verified_id': verifiedId?.toMap(),
    };
  }
}


/// Removes an active notification from notification list. Needs to be called only if the notification i...
class TdRemoveNotification extends TdObject {
  final int notificationGroupId;
  final int notificationId;

  TdRemoveNotification({
    required this.notificationGroupId,
    required this.notificationId,
  });

  @override
  String get tdType => 'removeNotification';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeNotification',
      'notification_group_id': notificationGroupId,
      'notification_id': notificationId,
    };
  }
}


/// Removes a group of active notifications. Needs to be called only if the notification group is remove...
class TdRemoveNotificationGroup extends TdObject {
  final int notificationGroupId;
  final int maxNotificationId;

  TdRemoveNotificationGroup({
    required this.notificationGroupId,
    required this.maxNotificationId,
  });

  @override
  String get tdType => 'removeNotificationGroup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeNotificationGroup',
      'notification_group_id': notificationGroupId,
      'max_notification_id': maxNotificationId,
    };
  }
}


/// Removes all pending paid reactions in a live story group call @group_call_id Group call identifier
class TdRemovePendingLiveStoryReactions extends TdObject {
  final int groupCallId;

  TdRemovePendingLiveStoryReactions({
    required this.groupCallId,
  });

  @override
  String get tdType => 'removePendingLiveStoryReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removePendingLiveStoryReactions',
      'group_call_id': groupCallId,
    };
  }
}


/// Removes all pending paid reactions on a message @chat_id Identifier of the chat to which the message...
class TdRemovePendingPaidMessageReactions extends TdObject {
  final int chatId;
  final int messageId;

  TdRemovePendingPaidMessageReactions({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'removePendingPaidMessageReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removePendingPaidMessageReactions',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Removes an audio file from the profile audio files of the current user @file_id Identifier of the au...
class TdRemoveProfileAudio extends TdObject {
  final int fileId;

  TdRemoveProfileAudio({
    required this.fileId,
  });

  @override
  String get tdType => 'removeProfileAudio';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeProfileAudio',
      'file_id': fileId,
    };
  }
}


/// Removes a proxy server. Can be called before authorization @proxy_id Proxy identifier
class TdRemoveProxy extends TdObject {
  final int proxyId;

  TdRemoveProxy({
    required this.proxyId,
  });

  @override
  String get tdType => 'removeProxy';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeProxy',
      'proxy_id': proxyId,
    };
  }
}


/// Removes a hashtag from the list of recently used hashtags @hashtag Hashtag to delete
class TdRemoveRecentHashtag extends TdObject {
  final String hashtag;

  TdRemoveRecentHashtag({
    required this.hashtag,
  });

  @override
  String get tdType => 'removeRecentHashtag';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeRecentHashtag',
      'hashtag': hashtag,
    };
  }
}


/// Removes a sticker from the list of recently used stickers @is_attached Pass true to remove the stick...
class TdRemoveRecentSticker extends TdObject {
  final bool isAttached;
  final TdInputFile? sticker;

  TdRemoveRecentSticker({
    required this.isAttached,
    this.sticker,
  });

  @override
  String get tdType => 'removeRecentSticker';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeRecentSticker',
      'is_attached': isAttached,
      'sticker': sticker?.toMap(),
    };
  }
}


/// Removes a chat from the list of recently found chats @chat_id Identifier of the chat to be removed
class TdRemoveRecentlyFoundChat extends TdObject {
  final int chatId;

  TdRemoveRecentlyFoundChat({
    required this.chatId,
  });

  @override
  String get tdType => 'removeRecentlyFoundChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeRecentlyFoundChat',
      'chat_id': chatId,
    };
  }
}


/// Removes an animation from the list of saved animations @animation Animation file to be removed
class TdRemoveSavedAnimation extends TdObject {
  final TdInputFile? animation;

  TdRemoveSavedAnimation({
    this.animation,
  });

  @override
  String get tdType => 'removeSavedAnimation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeSavedAnimation',
      'animation': animation?.toMap(),
    };
  }
}


/// Removes a notification sound from the list of saved notification sounds @notification_sound_id Ident...
class TdRemoveSavedNotificationSound extends TdObject {
  final int notificationSoundId;

  TdRemoveSavedNotificationSound({
    required this.notificationSoundId,
  });

  @override
  String get tdType => 'removeSavedNotificationSound';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeSavedNotificationSound',
      'notification_sound_id': notificationSoundId,
    };
  }
}


/// Removes a hashtag or a cashtag from the list of recently searched for hashtags or cashtags @tag Hash...
class TdRemoveSearchedForTag extends TdObject {
  final String tag;

  TdRemoveSearchedForTag({
    required this.tag,
  });

  @override
  String get tdType => 'removeSearchedForTag';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeSearchedForTag',
      'tag': tag,
    };
  }
}


/// Removes a sticker from the set to which it belongs. The sticker set must be owned by the current use...
class TdRemoveStickerFromSet extends TdObject {
  final TdInputFile? sticker;

  TdRemoveStickerFromSet({
    this.sticker,
  });

  @override
  String get tdType => 'removeStickerFromSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeStickerFromSet',
      'sticker': sticker?.toMap(),
    };
  }
}


/// Removes stories from an album. If the album is owned by a supergroup or a channel chat, then require...
class TdRemoveStoryAlbumStories extends TdObject {
  final int chatId;
  final int storyAlbumId;
  final List<int> storyIds;

  TdRemoveStoryAlbumStories({
    required this.chatId,
    required this.storyAlbumId,
    required this.storyIds,
  });

  @override
  String get tdType => 'removeStoryAlbumStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeStoryAlbumStories',
      'chat_id': chatId,
      'story_album_id': storyAlbumId,
      'story_ids': storyIds,
    };
  }
}


/// Removes a chat from the list of frequently used chats. Supported only if the chat info database is e...
class TdRemoveTopChat extends TdObject {
  final TdTopChatCategory? category;
  final int chatId;

  TdRemoveTopChat({
    this.category,
    required this.chatId,
  });

  @override
  String get tdType => 'removeTopChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'removeTopChat',
      'category': category?.toMap(),
      'chat_id': chatId,
    };
  }
}


/// Changes order of active usernames of the current user @usernames The new order of active usernames. ...
class TdReorderActiveUsernames extends TdObject {
  final List<String> usernames;

  TdReorderActiveUsernames({
    required this.usernames,
  });

  @override
  String get tdType => 'reorderActiveUsernames';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderActiveUsernames',
      'usernames': usernames,
    };
  }
}


/// Changes order of active usernames of a bot. Can be called only if userTypeBot.can_be_edited == true ...
class TdReorderBotActiveUsernames extends TdObject {
  final int botUserId;
  final List<String> usernames;

  TdReorderBotActiveUsernames({
    required this.botUserId,
    required this.usernames,
  });

  @override
  String get tdType => 'reorderBotActiveUsernames';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderBotActiveUsernames',
      'bot_user_id': botUserId,
      'usernames': usernames,
    };
  }
}


/// Changes order of media previews in the list of media previews of a bot
class TdReorderBotMediaPreviews extends TdObject {
  final int botUserId;
  final String languageCode;
  final List<int> fileIds;

  TdReorderBotMediaPreviews({
    required this.botUserId,
    required this.languageCode,
    required this.fileIds,
  });

  @override
  String get tdType => 'reorderBotMediaPreviews';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderBotMediaPreviews',
      'bot_user_id': botUserId,
      'language_code': languageCode,
      'file_ids': fileIds,
    };
  }
}


/// Changes the order of chat folders @chat_folder_ids Identifiers of chat folders in the new correct or...
class TdReorderChatFolders extends TdObject {
  final List<int> chatFolderIds;
  final int mainChatListPosition;

  TdReorderChatFolders({
    required this.chatFolderIds,
    required this.mainChatListPosition,
  });

  @override
  String get tdType => 'reorderChatFolders';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderChatFolders',
      'chat_folder_ids': chatFolderIds,
      'main_chat_list_position': mainChatListPosition,
    };
  }
}


/// Changes order of gifts in a collection. If the collection is owned by a channel chat, then requires ...
class TdReorderGiftCollectionGifts extends TdObject {
  final TdMessageSender? ownerId;
  final int collectionId;
  final List<String> receivedGiftIds;

  TdReorderGiftCollectionGifts({
    this.ownerId,
    required this.collectionId,
    required this.receivedGiftIds,
  });

  @override
  String get tdType => 'reorderGiftCollectionGifts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderGiftCollectionGifts',
      'owner_id': ownerId?.toMap(),
      'collection_id': collectionId,
      'received_gift_ids': receivedGiftIds,
    };
  }
}


/// Changes order of gift collections. If the collections are owned by a channel chat, then requires can...
class TdReorderGiftCollections extends TdObject {
  final TdMessageSender? ownerId;
  final List<int> collectionIds;

  TdReorderGiftCollections({
    this.ownerId,
    required this.collectionIds,
  });

  @override
  String get tdType => 'reorderGiftCollections';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderGiftCollections',
      'owner_id': ownerId?.toMap(),
      'collection_ids': collectionIds,
    };
  }
}


/// Changes the order of installed sticker sets @sticker_type Type of the sticker sets to reorder @stick...
class TdReorderInstalledStickerSets extends TdObject {
  final TdStickerType? stickerType;
  final List<int> stickerSetIds;

  TdReorderInstalledStickerSets({
    this.stickerType,
    required this.stickerSetIds,
  });

  @override
  String get tdType => 'reorderInstalledStickerSets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderInstalledStickerSets',
      'sticker_type': stickerType?.toMap(),
      'sticker_set_ids': stickerSetIds,
    };
  }
}


/// Changes the order of quick reply shortcuts @shortcut_ids The new order of quick reply shortcuts
class TdReorderQuickReplyShortcuts extends TdObject {
  final List<int> shortcutIds;

  TdReorderQuickReplyShortcuts({
    required this.shortcutIds,
  });

  @override
  String get tdType => 'reorderQuickReplyShortcuts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderQuickReplyShortcuts',
      'shortcut_ids': shortcutIds,
    };
  }
}


/// Changes order of stories in an album. If the album is owned by a supergroup or a channel chat, then ...
class TdReorderStoryAlbumStories extends TdObject {
  final int chatId;
  final int storyAlbumId;
  final List<int> storyIds;

  TdReorderStoryAlbumStories({
    required this.chatId,
    required this.storyAlbumId,
    required this.storyIds,
  });

  @override
  String get tdType => 'reorderStoryAlbumStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderStoryAlbumStories',
      'chat_id': chatId,
      'story_album_id': storyAlbumId,
      'story_ids': storyIds,
    };
  }
}


/// Changes order of story albums. If the albums are owned by a supergroup or a channel chat, then requi...
class TdReorderStoryAlbums extends TdObject {
  final int chatId;
  final List<int> storyAlbumIds;

  TdReorderStoryAlbums({
    required this.chatId,
    required this.storyAlbumIds,
  });

  @override
  String get tdType => 'reorderStoryAlbums';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderStoryAlbums',
      'chat_id': chatId,
      'story_album_ids': storyAlbumIds,
    };
  }
}


/// Changes order of active usernames of a supergroup or channel, requires owner privileges in the super...
class TdReorderSupergroupActiveUsernames extends TdObject {
  final int supergroupId;
  final List<String> usernames;

  TdReorderSupergroupActiveUsernames({
    required this.supergroupId,
    required this.usernames,
  });

  @override
  String get tdType => 'reorderSupergroupActiveUsernames';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reorderSupergroupActiveUsernames',
      'supergroup_id': supergroupId,
      'usernames': usernames,
    };
  }
}


/// Replaces the current RTMP URL for streaming to a live story; requires owner privileges for channel c...
class TdReplaceLiveStoryRtmpUrl extends TdObject {
  final int chatId;

  TdReplaceLiveStoryRtmpUrl({
    required this.chatId,
  });

  @override
  String get tdType => 'replaceLiveStoryRtmpUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'replaceLiveStoryRtmpUrl',
      'chat_id': chatId,
    };
  }
}


/// Replaces current primary invite link for a chat with a new primary invite link. Available for basic ...
class TdReplacePrimaryChatInviteLink extends TdObject {
  final int chatId;

  TdReplacePrimaryChatInviteLink({
    required this.chatId,
  });

  @override
  String get tdType => 'replacePrimaryChatInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'replacePrimaryChatInviteLink',
      'chat_id': chatId,
    };
  }
}


/// Replaces existing sticker in a set. The function is equivalent to removeStickerFromSet, then addStic...
class TdReplaceStickerInSet extends TdObject {
  final int userId;
  final String name;
  final TdInputFile? oldSticker;
  final TdInputSticker? newSticker;

  TdReplaceStickerInSet({
    required this.userId,
    required this.name,
    this.oldSticker,
    this.newSticker,
  });

  @override
  String get tdType => 'replaceStickerInSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'replaceStickerInSet',
      'user_id': userId,
      'name': name,
      'old_sticker': oldSticker?.toMap(),
      'new_sticker': newSticker?.toMap(),
    };
  }
}


/// Replaces the current RTMP URL for streaming to the video chat of a chat; requires owner privileges i...
class TdReplaceVideoChatRtmpUrl extends TdObject {
  final int chatId;

  TdReplaceVideoChatRtmpUrl({
    required this.chatId,
  });

  @override
  String get tdType => 'replaceVideoChatRtmpUrl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'replaceVideoChatRtmpUrl',
      'chat_id': chatId,
    };
  }
}


/// Reports that authentication code wasn\'t delivered via SMS; for official mobile applications only. Wo...
class TdReportAuthenticationCodeMissing extends TdObject {
  final String mobileNetworkCode;

  TdReportAuthenticationCodeMissing({
    required this.mobileNetworkCode,
  });

  @override
  String get tdType => 'reportAuthenticationCodeMissing';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportAuthenticationCodeMissing',
      'mobile_network_code': mobileNetworkCode,
    };
  }
}


/// Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or ...
class TdReportChat extends TdObject {
  final int chatId;
  final String optionId;
  final List<int> messageIds;
  final String text;

  TdReportChat({
    required this.chatId,
    required this.optionId,
    required this.messageIds,
    required this.text,
  });

  @override
  String get tdType => 'reportChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportChat',
      'chat_id': chatId,
      'option_id': optionId,
      'message_ids': messageIds,
      'text': text,
    };
  }
}


/// Reports a chat photo to the Telegram moderators. A chat photo can be reported only if chat.can_be_re...
class TdReportChatPhoto extends TdObject {
  final int chatId;
  final int fileId;
  final TdReportReason? reason;
  final String text;

  TdReportChatPhoto({
    required this.chatId,
    required this.fileId,
    this.reason,
    required this.text,
  });

  @override
  String get tdType => 'reportChatPhoto';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportChatPhoto',
      'chat_id': chatId,
      'file_id': fileId,
      'reason': reason?.toMap(),
      'text': text,
    };
  }
}


/// Reports a sponsored message to Telegram moderators
class TdReportChatSponsoredMessage extends TdObject {
  final int chatId;
  final int messageId;
  final String optionId;

  TdReportChatSponsoredMessage({
    required this.chatId,
    required this.messageId,
    required this.optionId,
  });

  @override
  String get tdType => 'reportChatSponsoredMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportChatSponsoredMessage',
      'chat_id': chatId,
      'message_id': messageId,
      'option_id': optionId,
    };
  }
}


/// Reports reactions set on a message to the Telegram moderators. Reactions on a message can be reporte...
class TdReportMessageReactions extends TdObject {
  final int chatId;
  final int messageId;
  final TdMessageSender? senderId;

  TdReportMessageReactions({
    required this.chatId,
    required this.messageId,
    this.senderId,
  });

  @override
  String get tdType => 'reportMessageReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportMessageReactions',
      'chat_id': chatId,
      'message_id': messageId,
      'sender_id': senderId?.toMap(),
    };
  }
}


/// Reports that authentication code wasn\'t delivered via SMS to the specified phone number; for officia...
class TdReportPhoneNumberCodeMissing extends TdObject {
  final String mobileNetworkCode;

  TdReportPhoneNumberCodeMissing({
    required this.mobileNetworkCode,
  });

  @override
  String get tdType => 'reportPhoneNumberCodeMissing';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportPhoneNumberCodeMissing',
      'mobile_network_code': mobileNetworkCode,
    };
  }
}


/// Reports a sponsored chat to Telegram moderators
class TdReportSponsoredChat extends TdObject {
  final int sponsoredChatUniqueId;
  final String optionId;

  TdReportSponsoredChat({
    required this.sponsoredChatUniqueId,
    required this.optionId,
  });

  @override
  String get tdType => 'reportSponsoredChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportSponsoredChat',
      'sponsored_chat_unique_id': sponsoredChatUniqueId,
      'option_id': optionId,
    };
  }
}


/// Reports a story to the Telegram moderators
class TdReportStory extends TdObject {
  final int storyPosterChatId;
  final int storyId;
  final String optionId;
  final String text;

  TdReportStory({
    required this.storyPosterChatId,
    required this.storyId,
    required this.optionId,
    required this.text,
  });

  @override
  String get tdType => 'reportStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportStory',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
      'option_id': optionId,
      'text': text,
    };
  }
}


/// Reports a false deletion of a message by aggressive anti-spam checks; requires administrator rights ...
class TdReportSupergroupAntiSpamFalsePositive extends TdObject {
  final int supergroupId;
  final int messageId;

  TdReportSupergroupAntiSpamFalsePositive({
    required this.supergroupId,
    required this.messageId,
  });

  @override
  String get tdType => 'reportSupergroupAntiSpamFalsePositive';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportSupergroupAntiSpamFalsePositive',
      'supergroup_id': supergroupId,
      'message_id': messageId,
    };
  }
}


/// Reports messages in a supergroup as spam; requires administrator rights in the supergroup
class TdReportSupergroupSpam extends TdObject {
  final int supergroupId;
  final List<int> messageIds;

  TdReportSupergroupSpam({
    required this.supergroupId,
    required this.messageIds,
  });

  @override
  String get tdType => 'reportSupergroupSpam';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportSupergroupSpam',
      'supergroup_id': supergroupId,
      'message_ids': messageIds,
    };
  }
}


/// Reports a video message advertisement to Telegram moderators
class TdReportVideoMessageAdvertisement extends TdObject {
  final int advertisementUniqueId;
  final String optionId;

  TdReportVideoMessageAdvertisement({
    required this.advertisementUniqueId,
    required this.optionId,
  });

  @override
  String get tdType => 'reportVideoMessageAdvertisement';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reportVideoMessageAdvertisement',
      'advertisement_unique_id': advertisementUniqueId,
      'option_id': optionId,
    };
  }
}


/// Requests to send a 2-step verification password recovery code to an email address that was previousl...
class TdRequestAuthenticationPasswordRecovery extends TdObject {
  TdRequestAuthenticationPasswordRecovery();

  @override
  String get tdType => 'requestAuthenticationPasswordRecovery';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'requestAuthenticationPasswordRecovery',
    };
  }
}


/// Requests to send a 2-step verification password recovery code to an email address that was previousl...
class TdRequestPasswordRecovery extends TdObject {
  TdRequestPasswordRecovery();

  @override
  String get tdType => 'requestPasswordRecovery';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'requestPasswordRecovery',
    };
  }
}


/// Requests QR code authentication by scanning a QR code on another logged in device. Works only when t...
class TdRequestQrCodeAuthentication extends TdObject {
  final List<int> otherUserIds;

  TdRequestQrCodeAuthentication({
    required this.otherUserIds,
  });

  @override
  String get tdType => 'requestQrCodeAuthentication';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'requestQrCodeAuthentication',
      'other_user_ids': otherUserIds,
    };
  }
}


/// Resends an authentication code to the user. Works only when the current authorization state is autho...
class TdResendAuthenticationCode extends TdObject {
  final TdResendCodeReason? reason;

  TdResendAuthenticationCode({
    this.reason,
  });

  @override
  String get tdType => 'resendAuthenticationCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resendAuthenticationCode',
      'reason': reason?.toMap(),
    };
  }
}


/// Resends the code to verify an email address to be added to a user\'s Telegram Passport
class TdResendEmailAddressVerificationCode extends TdObject {
  TdResendEmailAddressVerificationCode();

  @override
  String get tdType => 'resendEmailAddressVerificationCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resendEmailAddressVerificationCode',
    };
  }
}


/// Resends the login email address verification code
class TdResendLoginEmailAddressCode extends TdObject {
  TdResendLoginEmailAddressCode();

  @override
  String get tdType => 'resendLoginEmailAddressCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resendLoginEmailAddressCode',
    };
  }
}


/// Resends messages which failed to send. Can be called only for messages for which messageSendingState...
class TdResendMessages extends TdObject {
  final int chatId;
  final List<int> messageIds;
  final TdInputTextQuote? quote;
  final int paidMessageStarCount;

  TdResendMessages({
    required this.chatId,
    required this.messageIds,
    this.quote,
    required this.paidMessageStarCount,
  });

  @override
  String get tdType => 'resendMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resendMessages',
      'chat_id': chatId,
      'message_ids': messageIds,
      'quote': quote?.toMap(),
      'paid_message_star_count': paidMessageStarCount,
    };
  }
}


/// Resends the authentication code sent to a phone number. Works only if the previously received authen...
class TdResendPhoneNumberCode extends TdObject {
  final TdResendCodeReason? reason;

  TdResendPhoneNumberCode({
    this.reason,
  });

  @override
  String get tdType => 'resendPhoneNumberCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resendPhoneNumberCode',
      'reason': reason?.toMap(),
    };
  }
}


/// Resends the 2-step verification recovery email address verification code
class TdResendRecoveryEmailAddressCode extends TdObject {
  TdResendRecoveryEmailAddressCode();

  @override
  String get tdType => 'resendRecoveryEmailAddressCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resendRecoveryEmailAddressCode',
    };
  }
}


/// Resets all chat and scope notification settings to their default values. By default, all chats are u...
class TdResetAllNotificationSettings extends TdObject {
  TdResetAllNotificationSettings();

  @override
  String get tdType => 'resetAllNotificationSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resetAllNotificationSettings',
    };
  }
}


/// Resets the login email address. May return an error with a message "TASK_ALREADY_EXISTS" if reset is...
class TdResetAuthenticationEmailAddress extends TdObject {
  TdResetAuthenticationEmailAddress();

  @override
  String get tdType => 'resetAuthenticationEmailAddress';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resetAuthenticationEmailAddress',
    };
  }
}


/// Resets list of installed backgrounds to its default value
class TdResetInstalledBackgrounds extends TdObject {
  TdResetInstalledBackgrounds();

  @override
  String get tdType => 'resetInstalledBackgrounds';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resetInstalledBackgrounds',
    };
  }
}


/// Resets all network data usage statistics to zero. Can be called before authorization
class TdResetNetworkStatistics extends TdObject {
  TdResetNetworkStatistics();

  @override
  String get tdType => 'resetNetworkStatistics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resetNetworkStatistics',
    };
  }
}


/// Removes 2-step verification password without previous password and access to recovery email address....
class TdResetPassword extends TdObject {
  TdResetPassword();

  @override
  String get tdType => 'resetPassword';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'resetPassword',
    };
  }
}


/// Reuses an active Telegram Star subscription to a channel chat and joins the chat again @subscription...
class TdReuseStarSubscription extends TdObject {
  final String subscriptionId;

  TdReuseStarSubscription({
    required this.subscriptionId,
  });

  @override
  String get tdType => 'reuseStarSubscription';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'reuseStarSubscription',
      'subscription_id': subscriptionId,
    };
  }
}


/// Revokes invite link for a chat. Available for basic groups, supergroups, and channels. Requires admi...
class TdRevokeChatInviteLink extends TdObject {
  final int chatId;
  final String inviteLink;

  TdRevokeChatInviteLink({
    required this.chatId,
    required this.inviteLink,
  });

  @override
  String get tdType => 'revokeChatInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'revokeChatInviteLink',
      'chat_id': chatId,
      'invite_link': inviteLink,
    };
  }
}


/// Revokes invite link for a group call. Requires groupCall.can_be_managed right for video chats or gro...
class TdRevokeGroupCallInviteLink extends TdObject {
  final int groupCallId;

  TdRevokeGroupCallInviteLink({
    required this.groupCallId,
  });

  @override
  String get tdType => 'revokeGroupCallInviteLink';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'revokeGroupCallInviteLink',
      'group_call_id': groupCallId,
    };
  }
}


/// Saves application log event on the server. Can be called before authorization @type Event type @chat...
class TdSaveApplicationLogEvent extends TdObject {
  final String type;
  final int chatId;
  final TdJsonValue? data;

  TdSaveApplicationLogEvent({
    required this.type,
    required this.chatId,
    this.data,
  });

  @override
  String get tdType => 'saveApplicationLogEvent';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'saveApplicationLogEvent',
      'type': type,
      'chat_id': chatId,
      'data': data?.toMap(),
    };
  }
}


/// Saves an inline message to be sent by the given user; for bots only
class TdSavePreparedInlineMessage extends TdObject {
  final int userId;
  final TdInputInlineQueryResult? result;
  final TdTargetChatTypes? chatTypes;

  TdSavePreparedInlineMessage({
    required this.userId,
    this.result,
    this.chatTypes,
  });

  @override
  String get tdType => 'savePreparedInlineMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'savePreparedInlineMessage',
      'user_id': userId,
      'result': result?.toMap(),
      'chat_types': chatTypes?.toMap(),
    };
  }
}


/// Searches affiliate programs that can be connected to the given affiliate
class TdSearchAffiliatePrograms extends TdObject {
  final TdAffiliateType? affiliate;
  final TdAffiliateProgramSortOrder? sortOrder;
  final String offset;
  final int limit;

  TdSearchAffiliatePrograms({
    this.affiliate,
    this.sortOrder,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'searchAffiliatePrograms';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchAffiliatePrograms',
      'affiliate': affiliate?.toMap(),
      'sort_order': sortOrder?.toMap(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Searches for a background by its name @name The name of the background
class TdSearchBackground extends TdObject {
  final String name;

  TdSearchBackground({
    required this.name,
  });

  @override
  String get tdType => 'searchBackground';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchBackground',
      'name': name,
    };
  }
}


/// Searches for call and group call messages. Returns the results in reverse chronological order (i.e.,...
class TdSearchCallMessages extends TdObject {
  final String offset;
  final int limit;
  final bool onlyMissed;

  TdSearchCallMessages({
    required this.offset,
    required this.limit,
    required this.onlyMissed,
  });

  @override
  String get tdType => 'searchCallMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchCallMessages',
      'offset': offset,
      'limit': limit,
      'only_missed': onlyMissed,
    };
  }
}


/// Searches a chat with an affiliate program. Returns the chat if found and the program is active
class TdSearchChatAffiliateProgram extends TdObject {
  final String username;
  final String referrer;

  TdSearchChatAffiliateProgram({
    required this.username,
    required this.referrer,
  });

  @override
  String get tdType => 'searchChatAffiliateProgram';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchChatAffiliateProgram',
      'username': username,
      'referrer': referrer,
    };
  }
}


/// Searches for a specified query in the first name, last name and usernames of the members of a specif...
class TdSearchChatMembers extends TdObject {
  final int chatId;
  final String query;
  final int limit;
  final TdChatMembersFilter? filter;

  TdSearchChatMembers({
    required this.chatId,
    required this.query,
    required this.limit,
    this.filter,
  });

  @override
  String get tdType => 'searchChatMembers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchChatMembers',
      'chat_id': chatId,
      'query': query,
      'limit': limit,
      'filter': filter?.toMap(),
    };
  }
}


/// Searches for messages with given words in the chat. Returns the results in reverse chronological ord...
class TdSearchChatMessages extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final String query;
  final TdMessageSender? senderId;
  final int fromMessageId;
  final int offset;
  final int limit;
  final TdSearchMessagesFilter? filter;

  TdSearchChatMessages({
    required this.chatId,
    this.topicId,
    required this.query,
    this.senderId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
    this.filter,
  });

  @override
  String get tdType => 'searchChatMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchChatMessages',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'query': query,
      'sender_id': senderId?.toMap(),
      'from_message_id': fromMessageId,
      'offset': offset,
      'limit': limit,
      'filter': filter?.toMap(),
    };
  }
}


/// Returns information about the recent locations of chat members that were sent to the chat. Returns u...
class TdSearchChatRecentLocationMessages extends TdObject {
  final int chatId;
  final int limit;

  TdSearchChatRecentLocationMessages({
    required this.chatId,
    required this.limit,
  });

  @override
  String get tdType => 'searchChatRecentLocationMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchChatRecentLocationMessages',
      'chat_id': chatId,
      'limit': limit,
    };
  }
}


/// Searches for the specified query in the title and username of already known chats. This is an offlin...
class TdSearchChats extends TdObject {
  final String query;
  final int limit;

  TdSearchChats({
    required this.query,
    required this.limit,
  });

  @override
  String get tdType => 'searchChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchChats',
      'query': query,
      'limit': limit,
    };
  }
}


/// Searches for the specified query in the title and username of already known chats via request to the...
class TdSearchChatsOnServer extends TdObject {
  final String query;
  final int limit;

  TdSearchChatsOnServer({
    required this.query,
    required this.limit,
  });

  @override
  String get tdType => 'searchChatsOnServer';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchChatsOnServer',
      'query': query,
      'limit': limit,
    };
  }
}


/// Searches for the specified query in the first names, last names and usernames of the known user cont...
class TdSearchContacts extends TdObject {
  final String query;
  final int limit;

  TdSearchContacts({
    required this.query,
    required this.limit,
  });

  @override
  String get tdType => 'searchContacts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchContacts',
      'query': query,
      'limit': limit,
    };
  }
}


/// Searches for emojis by keywords. Supported only if the file database is enabled. Order of results is...
class TdSearchEmojis extends TdObject {
  final String text;
  final List<String> inputLanguageCodes;

  TdSearchEmojis({
    required this.text,
    required this.inputLanguageCodes,
  });

  @override
  String get tdType => 'searchEmojis';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchEmojis',
      'text': text,
      'input_language_codes': inputLanguageCodes,
    };
  }
}


/// Searches for files in the file download list or recently downloaded files from the list
class TdSearchFileDownloads extends TdObject {
  final String query;
  final bool onlyActive;
  final bool onlyCompleted;
  final String offset;
  final int limit;

  TdSearchFileDownloads({
    required this.query,
    required this.onlyActive,
    required this.onlyCompleted,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'searchFileDownloads';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchFileDownloads',
      'query': query,
      'only_active': onlyActive,
      'only_completed': onlyCompleted,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Returns upgraded gifts that can be bought from other owners using sendResoldGift If none attributes ...
class TdSearchGiftsForResale extends TdObject {
  final int giftId;
  final TdGiftForResaleOrder? order;
  final List<TdUpgradedGiftAttributeId> attributes;
  final String offset;
  final int limit;

  TdSearchGiftsForResale({
    required this.giftId,
    this.order,
    required this.attributes,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'searchGiftsForResale';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchGiftsForResale',
      'gift_id': giftId,
      'order': order?.toMap(),
      'attributes': attributes.map((e) => e.toMap()).toList(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Searches for recently used hashtags by their prefix @prefix Hashtag prefix to search for @limit The ...
class TdSearchHashtags extends TdObject {
  final String prefix;
  final int limit;

  TdSearchHashtags({
    required this.prefix,
    required this.limit,
  });

  @override
  String get tdType => 'searchHashtags';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchHashtags',
      'prefix': prefix,
      'limit': limit,
    };
  }
}


/// Searches for installed sticker sets by looking for specified query in their title and name @sticker_...
class TdSearchInstalledStickerSets extends TdObject {
  final TdStickerType? stickerType;
  final String query;
  final int limit;

  TdSearchInstalledStickerSets({
    this.stickerType,
    required this.query,
    required this.limit,
  });

  @override
  String get tdType => 'searchInstalledStickerSets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchInstalledStickerSets',
      'sticker_type': stickerType?.toMap(),
      'query': query,
      'limit': limit,
    };
  }
}


/// Searches for messages in all chats except secret chats. Returns the results in reverse chronological...
class TdSearchMessages extends TdObject {
  final TdChatList? chatList;
  final String query;
  final String offset;
  final int limit;
  final TdSearchMessagesFilter? filter;
  final TdSearchMessagesChatTypeFilter? chatTypeFilter;
  final int minDate;
  final int maxDate;

  TdSearchMessages({
    this.chatList,
    required this.query,
    required this.offset,
    required this.limit,
    this.filter,
    this.chatTypeFilter,
    required this.minDate,
    required this.maxDate,
  });

  @override
  String get tdType => 'searchMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchMessages',
      'chat_list': chatList?.toMap(),
      'query': query,
      'offset': offset,
      'limit': limit,
      'filter': filter?.toMap(),
      'chat_type_filter': chatTypeFilter?.toMap(),
      'min_date': minDate,
      'max_date': maxDate,
    };
  }
}


/// Searches for outgoing messages with content of the type messageDocument in all chats except secret c...
class TdSearchOutgoingDocumentMessages extends TdObject {
  final String query;
  final int limit;

  TdSearchOutgoingDocumentMessages({
    required this.query,
    required this.limit,
  });

  @override
  String get tdType => 'searchOutgoingDocumentMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchOutgoingDocumentMessages',
      'query': query,
      'limit': limit,
    };
  }
}


/// Searches a public chat by its username. Currently, only private chats, supergroups and channels can ...
class TdSearchPublicChat extends TdObject {
  final String username;

  TdSearchPublicChat({
    required this.username,
  });

  @override
  String get tdType => 'searchPublicChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchPublicChat',
      'username': username,
    };
  }
}


/// Searches public chats by looking for specified query in their username and title. Currently, only pr...
class TdSearchPublicChats extends TdObject {
  final String query;

  TdSearchPublicChats({
    required this.query,
  });

  @override
  String get tdType => 'searchPublicChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchPublicChats',
      'query': query,
    };
  }
}


/// Searches for public channel posts containing the given hashtag or cashtag. For optimal performance, ...
class TdSearchPublicMessagesByTag extends TdObject {
  final String tag;
  final String offset;
  final int limit;

  TdSearchPublicMessagesByTag({
    required this.tag,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'searchPublicMessagesByTag';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchPublicMessagesByTag',
      'tag': tag,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Searches for public channel posts using the given query. For optimal performance, the number of retu...
class TdSearchPublicPosts extends TdObject {
  final String query;
  final String offset;
  final int limit;
  final int starCount;

  TdSearchPublicPosts({
    required this.query,
    required this.offset,
    required this.limit,
    required this.starCount,
  });

  @override
  String get tdType => 'searchPublicPosts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchPublicPosts',
      'query': query,
      'offset': offset,
      'limit': limit,
      'star_count': starCount,
    };
  }
}


/// Searches for public stories by the given address location. For optimal performance, the number of re...
class TdSearchPublicStoriesByLocation extends TdObject {
  final TdLocationAddress? address;
  final String offset;
  final int limit;

  TdSearchPublicStoriesByLocation({
    this.address,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'searchPublicStoriesByLocation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchPublicStoriesByLocation',
      'address': address?.toMap(),
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Searches for public stories containing the given hashtag or cashtag. For optimal performance, the nu...
class TdSearchPublicStoriesByTag extends TdObject {
  final int storyPosterChatId;
  final String tag;
  final String offset;
  final int limit;

  TdSearchPublicStoriesByTag({
    required this.storyPosterChatId,
    required this.tag,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'searchPublicStoriesByTag';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchPublicStoriesByTag',
      'story_poster_chat_id': storyPosterChatId,
      'tag': tag,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Searches for public stories from the given venue. For optimal performance, the number of returned st...
class TdSearchPublicStoriesByVenue extends TdObject {
  final String venueProvider;
  final String venueId;
  final String offset;
  final int limit;

  TdSearchPublicStoriesByVenue({
    required this.venueProvider,
    required this.venueId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'searchPublicStoriesByVenue';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchPublicStoriesByVenue',
      'venue_provider': venueProvider,
      'venue_id': venueId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Searches for a given quote in a text. Returns found quote start position in UTF-16 code units. Retur...
class TdSearchQuote extends TdObject {
  final TdFormattedText? text;
  final TdFormattedText? quote;
  final int quotePosition;

  TdSearchQuote({
    this.text,
    this.quote,
    required this.quotePosition,
  });

  @override
  String get tdType => 'searchQuote';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchQuote',
      'text': text?.toMap(),
      'quote': quote?.toMap(),
      'quote_position': quotePosition,
    };
  }
}


/// Searches for the specified query in the title and username of up to 50 recently found chats. This is...
class TdSearchRecentlyFoundChats extends TdObject {
  final String query;
  final int limit;

  TdSearchRecentlyFoundChats({
    required this.query,
    required this.limit,
  });

  @override
  String get tdType => 'searchRecentlyFoundChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchRecentlyFoundChats',
      'query': query,
      'limit': limit,
    };
  }
}


/// Searches for messages tagged by the given reaction and with the given words in the Saved Messages ch...
class TdSearchSavedMessages extends TdObject {
  final int savedMessagesTopicId;
  final TdReactionType? tag;
  final String query;
  final int fromMessageId;
  final int offset;
  final int limit;

  TdSearchSavedMessages({
    required this.savedMessagesTopicId,
    this.tag,
    required this.query,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'searchSavedMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchSavedMessages',
      'saved_messages_topic_id': savedMessagesTopicId,
      'tag': tag?.toMap(),
      'query': query,
      'from_message_id': fromMessageId,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Searches for messages in secret chats. Returns the results in reverse chronological order. For optim...
class TdSearchSecretMessages extends TdObject {
  final int chatId;
  final String query;
  final String offset;
  final int limit;
  final TdSearchMessagesFilter? filter;

  TdSearchSecretMessages({
    required this.chatId,
    required this.query,
    required this.offset,
    required this.limit,
    this.filter,
  });

  @override
  String get tdType => 'searchSecretMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchSecretMessages',
      'chat_id': chatId,
      'query': query,
      'offset': offset,
      'limit': limit,
      'filter': filter?.toMap(),
    };
  }
}


/// Searches for a sticker set by its name @name Name of the sticker set @ignore_cache Pass true to igno...
class TdSearchStickerSet extends TdObject {
  final String name;
  final bool ignoreCache;

  TdSearchStickerSet({
    required this.name,
    required this.ignoreCache,
  });

  @override
  String get tdType => 'searchStickerSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchStickerSet',
      'name': name,
      'ignore_cache': ignoreCache,
    };
  }
}


/// Searches for sticker sets by looking for specified query in their title and name. Excludes installed...
class TdSearchStickerSets extends TdObject {
  final TdStickerType? stickerType;
  final String query;

  TdSearchStickerSets({
    this.stickerType,
    required this.query,
  });

  @override
  String get tdType => 'searchStickerSets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchStickerSets',
      'sticker_type': stickerType?.toMap(),
      'query': query,
    };
  }
}


/// Searches for stickers from public sticker sets that correspond to any of the given emoji
class TdSearchStickers extends TdObject {
  final TdStickerType? stickerType;
  final String emojis;
  final String query;
  final List<String> inputLanguageCodes;
  final int offset;
  final int limit;

  TdSearchStickers({
    this.stickerType,
    required this.emojis,
    required this.query,
    required this.inputLanguageCodes,
    required this.offset,
    required this.limit,
  });

  @override
  String get tdType => 'searchStickers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchStickers',
      'sticker_type': stickerType?.toMap(),
      'emojis': emojis,
      'query': query,
      'input_language_codes': inputLanguageCodes,
      'offset': offset,
      'limit': limit,
    };
  }
}


/// Searches specified query by word prefixes in the provided strings. Returns 0-based positions of stri...
class TdSearchStringsByPrefix extends TdObject {
  final List<String> strings;
  final String query;
  final int limit;
  final bool returnNoneForEmptyQuery;

  TdSearchStringsByPrefix({
    required this.strings,
    required this.query,
    required this.limit,
    required this.returnNoneForEmptyQuery,
  });

  @override
  String get tdType => 'searchStringsByPrefix';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchStringsByPrefix',
      'strings': strings,
      'query': query,
      'limit': limit,
      'return_none_for_empty_query': returnNoneForEmptyQuery,
    };
  }
}


/// Searches a user by their phone number. Returns a 404 error if the user can\'t be found
class TdSearchUserByPhoneNumber extends TdObject {
  final String phoneNumber;
  final bool onlyLocal;

  TdSearchUserByPhoneNumber({
    required this.phoneNumber,
    required this.onlyLocal,
  });

  @override
  String get tdType => 'searchUserByPhoneNumber';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchUserByPhoneNumber',
      'phone_number': phoneNumber,
      'only_local': onlyLocal,
    };
  }
}


/// Searches a user by a token from the user\'s link @token Token to search for
class TdSearchUserByToken extends TdObject {
  final String token;

  TdSearchUserByToken({
    required this.token,
  });

  @override
  String get tdType => 'searchUserByToken';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchUserByToken',
      'token': token,
    };
  }
}


/// Returns information about a Web App by its short name. Returns a 404 error if the Web App is not fou...
class TdSearchWebApp extends TdObject {
  final int botUserId;
  final String webAppShortName;

  TdSearchWebApp({
    required this.botUserId,
    required this.webAppShortName,
  });

  @override
  String get tdType => 'searchWebApp';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'searchWebApp',
      'bot_user_id': botUserId,
      'web_app_short_name': webAppShortName,
    };
  }
}


/// Sells a gift for Telegram Stars; requires owner privileges for gifts owned by a chat
class TdSellGift extends TdObject {
  final String businessConnectionId;
  final String receivedGiftId;

  TdSellGift({
    required this.businessConnectionId,
    required this.receivedGiftId,
  });

  @override
  String get tdType => 'sellGift';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sellGift',
      'business_connection_id': businessConnectionId,
      'received_gift_id': receivedGiftId,
    };
  }
}


/// Sends Firebase Authentication SMS to the phone number of the user. Works only when the current autho...
class TdSendAuthenticationFirebaseSms extends TdObject {
  final String token;

  TdSendAuthenticationFirebaseSms({
    required this.token,
  });

  @override
  String get tdType => 'sendAuthenticationFirebaseSms';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendAuthenticationFirebaseSms',
      'token': token,
    };
  }
}


/// Invites a bot to a chat (if it is not yet a member) and sends it the /start command; requires can_in...
class TdSendBotStartMessage extends TdObject {
  final int botUserId;
  final int chatId;
  final String eter;

  TdSendBotStartMessage({
    required this.botUserId,
    required this.chatId,
    required this.eter,
  });

  @override
  String get tdType => 'sendBotStartMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendBotStartMessage',
      'bot_user_id': botUserId,
      'chat_id': chatId,
      'parameter': eter,
    };
  }
}


/// Sends a message on behalf of a business account; for bots only. Returns the message after it was sen...
class TdSendBusinessMessage extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final TdInputMessageReplyTo? replyTo;
  final bool disableNotification;
  final bool protectContent;
  final int effectId;
  final TdReplyMarkup? replyMarkup;
  final TdInputMessageContent? inputMessageContent;

  TdSendBusinessMessage({
    required this.businessConnectionId,
    required this.chatId,
    this.replyTo,
    required this.disableNotification,
    required this.protectContent,
    required this.effectId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'sendBusinessMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendBusinessMessage',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'reply_to': replyTo?.toMap(),
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'effect_id': effectId,
      'reply_markup': replyMarkup?.toMap(),
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Sends 2-10 messages grouped together into an album on behalf of a business account; for bots only. C...
class TdSendBusinessMessageAlbum extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final TdInputMessageReplyTo? replyTo;
  final bool disableNotification;
  final bool protectContent;
  final int effectId;
  final List<TdInputMessageContent> inputMessageContents;

  TdSendBusinessMessageAlbum({
    required this.businessConnectionId,
    required this.chatId,
    this.replyTo,
    required this.disableNotification,
    required this.protectContent,
    required this.effectId,
    required this.inputMessageContents,
  });

  @override
  String get tdType => 'sendBusinessMessageAlbum';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendBusinessMessageAlbum',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'reply_to': replyTo?.toMap(),
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'effect_id': effectId,
      'input_message_contents': inputMessageContents.map((e) => e.toMap()).toList(),
    };
  }
}


/// Sends debug information for a call to Telegram servers @call_id Call identifier @debug_information D...
class TdSendCallDebugInformation extends TdObject {
  final int callId;
  final String debugInformation;

  TdSendCallDebugInformation({
    required this.callId,
    required this.debugInformation,
  });

  @override
  String get tdType => 'sendCallDebugInformation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendCallDebugInformation',
      'call_id': callId,
      'debug_information': debugInformation,
    };
  }
}


/// Sends log file for a call to Telegram servers @call_id Call identifier @log_file Call log file. Only...
class TdSendCallLog extends TdObject {
  final int callId;
  final TdInputFile? logFile;

  TdSendCallLog({
    required this.callId,
    this.logFile,
  });

  @override
  String get tdType => 'sendCallLog';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendCallLog',
      'call_id': callId,
      'log_file': logFile?.toMap(),
    };
  }
}


/// Sends a call rating
class TdSendCallRating extends TdObject {
  final int callId;
  final int rating;
  final String comment;
  final List<TdCallProblem> problems;

  TdSendCallRating({
    required this.callId,
    required this.rating,
    required this.comment,
    required this.problems,
  });

  @override
  String get tdType => 'sendCallRating';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendCallRating',
      'call_id': callId,
      'rating': rating,
      'comment': comment,
      'problems': problems.map((e) => e.toMap()).toList(),
    };
  }
}


/// Sends call signaling data @call_id Call identifier @data The data
class TdSendCallSignalingData extends TdObject {
  final int callId;
  final String data;

  TdSendCallSignalingData({
    required this.callId,
    required this.data,
  });

  @override
  String get tdType => 'sendCallSignalingData';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendCallSignalingData',
      'call_id': callId,
      'data': data,
    };
  }
}


/// Sends a notification about user activity in a chat
class TdSendChatAction extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final String businessConnectionId;
  final TdChatAction? action;

  TdSendChatAction({
    required this.chatId,
    this.topicId,
    required this.businessConnectionId,
    this.action,
  });

  @override
  String get tdType => 'sendChatAction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendChatAction',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'business_connection_id': businessConnectionId,
      'action': action?.toMap(),
    };
  }
}


/// Sends a custom request; for bots only @method The method name @parameters JSON-serialized method par...
class TdSendCustomRequest extends TdObject {
  final String method;
  final String eters;

  TdSendCustomRequest({
    required this.method,
    required this.eters,
  });

  @override
  String get tdType => 'sendCustomRequest';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendCustomRequest',
      'method': method,
      'parameters': eters,
    };
  }
}


/// Sends a code to verify an email address to be added to a user\'s Telegram Passport @email_address Ema...
class TdSendEmailAddressVerificationCode extends TdObject {
  final String emailAddress;

  TdSendEmailAddressVerificationCode({
    required this.emailAddress,
  });

  @override
  String get tdType => 'sendEmailAddressVerificationCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendEmailAddressVerificationCode',
      'email_address': emailAddress,
    };
  }
}


/// Sends a gift to another user or channel chat. May return an error with a message "STARGIFT_USAGE_LIM...
class TdSendGift extends TdObject {
  final int giftId;
  final TdMessageSender? ownerId;
  final TdFormattedText? text;
  final bool isPrivate;
  final bool payForUpgrade;

  TdSendGift({
    required this.giftId,
    this.ownerId,
    this.text,
    required this.isPrivate,
    required this.payForUpgrade,
  });

  @override
  String get tdType => 'sendGift';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendGift',
      'gift_id': giftId,
      'owner_id': ownerId?.toMap(),
      'text': text?.toMap(),
      'is_private': isPrivate,
      'pay_for_upgrade': payForUpgrade,
    };
  }
}


/// Sends an offer to purchase an upgraded gift
class TdSendGiftPurchaseOffer extends TdObject {
  final TdMessageSender? ownerId;
  final String giftName;
  final TdGiftResalePrice? price;
  final int duration;
  final int paidMessageStarCount;

  TdSendGiftPurchaseOffer({
    this.ownerId,
    required this.giftName,
    this.price,
    required this.duration,
    required this.paidMessageStarCount,
  });

  @override
  String get tdType => 'sendGiftPurchaseOffer';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendGiftPurchaseOffer',
      'owner_id': ownerId?.toMap(),
      'gift_name': giftName,
      'price': price?.toMap(),
      'duration': duration,
      'paid_message_star_count': paidMessageStarCount,
    };
  }
}


/// Sends a message to other participants of a group call. Requires groupCall.can_send_messages right wh...
class TdSendGroupCallMessage extends TdObject {
  final int groupCallId;
  final TdFormattedText? text;
  final int paidMessageStarCount;

  TdSendGroupCallMessage({
    required this.groupCallId,
    this.text,
    required this.paidMessageStarCount,
  });

  @override
  String get tdType => 'sendGroupCallMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendGroupCallMessage',
      'group_call_id': groupCallId,
      'text': text?.toMap(),
      'paid_message_star_count': paidMessageStarCount,
    };
  }
}


/// Sends the result of an inline query as a message. Returns the sent message. Always clears a chat dra...
class TdSendInlineQueryResultMessage extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final TdInputMessageReplyTo? replyTo;
  final TdMessageSendOptions? options;
  final int queryId;
  final String resultId;
  final bool hideViaBot;

  TdSendInlineQueryResultMessage({
    required this.chatId,
    this.topicId,
    this.replyTo,
    this.options,
    required this.queryId,
    required this.resultId,
    required this.hideViaBot,
  });

  @override
  String get tdType => 'sendInlineQueryResultMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendInlineQueryResultMessage',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'reply_to': replyTo?.toMap(),
      'options': options?.toMap(),
      'query_id': queryId,
      'result_id': resultId,
      'hide_via_bot': hideViaBot,
    };
  }
}


/// Sends a message. Returns the sent message
class TdSendMessage extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final TdInputMessageReplyTo? replyTo;
  final TdMessageSendOptions? options;
  final TdReplyMarkup? replyMarkup;
  final TdInputMessageContent? inputMessageContent;

  TdSendMessage({
    required this.chatId,
    this.topicId,
    this.replyTo,
    this.options,
    this.replyMarkup,
    this.inputMessageContent,
  });

  @override
  String get tdType => 'sendMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendMessage',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'reply_to': replyTo?.toMap(),
      'options': options?.toMap(),
      'reply_markup': replyMarkup?.toMap(),
      'input_message_content': inputMessageContent?.toMap(),
    };
  }
}


/// Sends 2-10 messages grouped together into an album. Currently, only audio, document, photo and video...
class TdSendMessageAlbum extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final TdInputMessageReplyTo? replyTo;
  final TdMessageSendOptions? options;
  final List<TdInputMessageContent> inputMessageContents;

  TdSendMessageAlbum({
    required this.chatId,
    this.topicId,
    this.replyTo,
    this.options,
    required this.inputMessageContents,
  });

  @override
  String get tdType => 'sendMessageAlbum';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendMessageAlbum',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'reply_to': replyTo?.toMap(),
      'options': options?.toMap(),
      'input_message_contents': inputMessageContents.map((e) => e.toMap()).toList(),
    };
  }
}


/// Sends a Telegram Passport authorization form, effectively sharing data with the service. This method...
class TdSendPassportAuthorizationForm extends TdObject {
  final int authorizationFormId;
  final List<TdPassportElementType> types;

  TdSendPassportAuthorizationForm({
    required this.authorizationFormId,
    required this.types,
  });

  @override
  String get tdType => 'sendPassportAuthorizationForm';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendPassportAuthorizationForm',
      'authorization_form_id': authorizationFormId,
      'types': types.map((e) => e.toMap()).toList(),
    };
  }
}


/// Sends a filled-out payment form to the bot for final verification
class TdSendPaymentForm extends TdObject {
  final TdInputInvoice? inputInvoice;
  final int paymentFormId;
  final String orderInfoId;
  final String shippingOptionId;
  final TdInputCredentials? credentials;
  final int tipAmount;

  TdSendPaymentForm({
    this.inputInvoice,
    required this.paymentFormId,
    required this.orderInfoId,
    required this.shippingOptionId,
    this.credentials,
    required this.tipAmount,
  });

  @override
  String get tdType => 'sendPaymentForm';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendPaymentForm',
      'input_invoice': inputInvoice?.toMap(),
      'payment_form_id': paymentFormId,
      'order_info_id': orderInfoId,
      'shipping_option_id': shippingOptionId,
      'credentials': credentials?.toMap(),
      'tip_amount': tipAmount,
    };
  }
}


/// Sends a code to the specified phone number. Aborts previous phone number verification if there was o...
class TdSendPhoneNumberCode extends TdObject {
  final String phoneNumber;
  final TdPhoneNumberAuthenticationSettings? settings;
  final TdPhoneNumberCodeType? type;

  TdSendPhoneNumberCode({
    required this.phoneNumber,
    this.settings,
    this.type,
  });

  @override
  String get tdType => 'sendPhoneNumberCode';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendPhoneNumberCode',
      'phone_number': phoneNumber,
      'settings': settings?.toMap(),
      'type': type?.toMap(),
    };
  }
}


/// Sends Firebase Authentication SMS to the specified phone number. Works only when received a code of ...
class TdSendPhoneNumberFirebaseSms extends TdObject {
  final String token;

  TdSendPhoneNumberFirebaseSms({
    required this.token,
  });

  @override
  String get tdType => 'sendPhoneNumberFirebaseSms';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendPhoneNumberFirebaseSms',
      'token': token,
    };
  }
}


/// Sends messages from a quick reply shortcut. Requires Telegram Business subscription. Can\'t be used t...
class TdSendQuickReplyShortcutMessages extends TdObject {
  final int chatId;
  final int shortcutId;
  final int sendingId;

  TdSendQuickReplyShortcutMessages({
    required this.chatId,
    required this.shortcutId,
    required this.sendingId,
  });

  @override
  String get tdType => 'sendQuickReplyShortcutMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendQuickReplyShortcutMessages',
      'chat_id': chatId,
      'shortcut_id': shortcutId,
      'sending_id': sendingId,
    };
  }
}


/// Sends an upgraded gift that is available for resale to another user or channel chat; gifts already o...
class TdSendResoldGift extends TdObject {
  final String giftName;
  final TdMessageSender? ownerId;
  final TdGiftResalePrice? price;

  TdSendResoldGift({
    required this.giftName,
    this.ownerId,
    this.price,
  });

  @override
  String get tdType => 'sendResoldGift';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendResoldGift',
      'gift_name': giftName,
      'owner_id': ownerId?.toMap(),
      'price': price?.toMap(),
    };
  }
}


/// Sends a draft for a being generated text message; for bots only
class TdSendTextMessageDraft extends TdObject {
  final int chatId;
  final int forumTopicId;
  final int draftId;
  final TdFormattedText? text;

  TdSendTextMessageDraft({
    required this.chatId,
    required this.forumTopicId,
    required this.draftId,
    this.text,
  });

  @override
  String get tdType => 'sendTextMessageDraft';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendTextMessageDraft',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
      'draft_id': draftId,
      'text': text?.toMap(),
    };
  }
}


/// Sends a custom request from a Web App
class TdSendWebAppCustomRequest extends TdObject {
  final int botUserId;
  final String method;
  final String eters;

  TdSendWebAppCustomRequest({
    required this.botUserId,
    required this.method,
    required this.eters,
  });

  @override
  String get tdType => 'sendWebAppCustomRequest';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendWebAppCustomRequest',
      'bot_user_id': botUserId,
      'method': method,
      'parameters': eters,
    };
  }
}


/// Sends data received from a keyboardButtonTypeWebApp Web App to a bot
class TdSendWebAppData extends TdObject {
  final int botUserId;
  final String buttonText;
  final String data;

  TdSendWebAppData({
    required this.botUserId,
    required this.buttonText,
    required this.data,
  });

  @override
  String get tdType => 'sendWebAppData';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sendWebAppData',
      'bot_user_id': botUserId,
      'button_text': buttonText,
      'data': data,
    };
  }
}


/// Changes accent color and background custom emoji for the current user; for Telegram Premium users on...
class TdSetAccentColor extends TdObject {
  final int accentColorId;
  final int backgroundCustomEmojiId;

  TdSetAccentColor({
    required this.accentColorId,
    required this.backgroundCustomEmojiId,
  });

  @override
  String get tdType => 'setAccentColor';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setAccentColor',
      'accent_color_id': accentColorId,
      'background_custom_emoji_id': backgroundCustomEmojiId,
    };
  }
}


/// Changes the period of inactivity after which the account of the current user will automatically be d...
class TdSetAccountTtl extends TdObject {
  final TdAccountTtl? ttl;

  TdSetAccountTtl({
    this.ttl,
  });

  @override
  String get tdType => 'setAccountTtl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setAccountTtl',
      'ttl': ttl?.toMap(),
    };
  }
}


/// Succeeds after a specified amount of time has passed. Can be called before initialization @seconds N...
class TdSetAlarm extends TdObject {
  final double seconds;

  TdSetAlarm({
    required this.seconds,
  });

  @override
  String get tdType => 'setAlarm';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setAlarm',
      'seconds': seconds,
    };
  }
}


/// Informs TDLib that application or reCAPTCHA verification has been completed. Can be called before au...
class TdSetApplicationVerificationToken extends TdObject {
  final int verificationId;
  final String token;

  TdSetApplicationVerificationToken({
    required this.verificationId,
    required this.token,
  });

  @override
  String get tdType => 'setApplicationVerificationToken';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setApplicationVerificationToken',
      'verification_id': verificationId,
      'token': token,
    };
  }
}


/// Changes settings for automatic moving of chats to and from the Archive chat lists @settings New sett...
class TdSetArchiveChatListSettings extends TdObject {
  final TdArchiveChatListSettings? settings;

  TdSetArchiveChatListSettings({
    this.settings,
  });

  @override
  String get tdType => 'setArchiveChatListSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setArchiveChatListSettings',
      'settings': settings?.toMap(),
    };
  }
}


/// Sets the email address of the user and sends an authentication code to the email address. Works only...
class TdSetAuthenticationEmailAddress extends TdObject {
  final String emailAddress;

  TdSetAuthenticationEmailAddress({
    required this.emailAddress,
  });

  @override
  String get tdType => 'setAuthenticationEmailAddress';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setAuthenticationEmailAddress',
      'email_address': emailAddress,
    };
  }
}


/// Sets the phone number of the user and sends an authentication code to the user. Works only when the ...
class TdSetAuthenticationPhoneNumber extends TdObject {
  final String phoneNumber;
  final TdPhoneNumberAuthenticationSettings? settings;

  TdSetAuthenticationPhoneNumber({
    required this.phoneNumber,
    this.settings,
  });

  @override
  String get tdType => 'setAuthenticationPhoneNumber';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setAuthenticationPhoneNumber',
      'phone_number': phoneNumber,
      'settings': settings?.toMap(),
    };
  }
}


/// Informs server about an in-store purchase of Telegram Premium before authorization. Works only when ...
class TdSetAuthenticationPremiumPurchaseTransaction extends TdObject {
  final TdStoreTransaction? transaction;
  final bool isRestore;
  final String currency;
  final int amount;

  TdSetAuthenticationPremiumPurchaseTransaction({
    this.transaction,
    required this.isRestore,
    required this.currency,
    required this.amount,
  });

  @override
  String get tdType => 'setAuthenticationPremiumPurchaseTransaction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setAuthenticationPremiumPurchaseTransaction',
      'transaction': transaction?.toMap(),
      'is_restore': isRestore,
      'currency': currency,
      'amount': amount,
    };
  }
}


/// Sets auto-download settings @settings New user auto-download settings @type Type of the network for ...
class TdSetAutoDownloadSettings extends TdObject {
  final TdAutoDownloadSettings? settings;
  final TdNetworkType? type;

  TdSetAutoDownloadSettings({
    this.settings,
    this.type,
  });

  @override
  String get tdType => 'setAutoDownloadSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setAutoDownloadSettings',
      'settings': settings?.toMap(),
      'type': type?.toMap(),
    };
  }
}


/// Sets autosave settings for the given scope. The method is guaranteed to work only after at least one...
class TdSetAutosaveSettings extends TdObject {
  final TdAutosaveSettingsScope? scope;
  final TdScopeAutosaveSettings? settings;

  TdSetAutosaveSettings({
    this.scope,
    this.settings,
  });

  @override
  String get tdType => 'setAutosaveSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setAutosaveSettings',
      'scope': scope?.toMap(),
      'settings': settings?.toMap(),
    };
  }
}


/// Changes the bio of the current user @bio The new value of the user bio; 0-getOption("bio_length_max"...
class TdSetBio extends TdObject {
  final String bio;

  TdSetBio({
    required this.bio,
  });

  @override
  String get tdType => 'setBio';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBio',
      'bio': bio,
    };
  }
}


/// Changes the birthdate of the current user @birthdate The new value of the current user\'s birthdate; ...
class TdSetBirthdate extends TdObject {
  final TdBirthdate? birthdate;

  TdSetBirthdate({
    this.birthdate,
  });

  @override
  String get tdType => 'setBirthdate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBirthdate',
      'birthdate': birthdate?.toMap(),
    };
  }
}


/// Sets the text shown in the chat with a bot if the chat is empty. Can be called only if userTypeBot.c...
class TdSetBotInfoDescription extends TdObject {
  final int botUserId;
  final String languageCode;
  final String description;

  TdSetBotInfoDescription({
    required this.botUserId,
    required this.languageCode,
    required this.description,
  });

  @override
  String get tdType => 'setBotInfoDescription';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBotInfoDescription',
      'bot_user_id': botUserId,
      'language_code': languageCode,
      'description': description,
    };
  }
}


/// Sets the text shown on a bot\'s profile page and sent together with the link when users share the bot...
class TdSetBotInfoShortDescription extends TdObject {
  final int botUserId;
  final String languageCode;
  final String shortDescription;

  TdSetBotInfoShortDescription({
    required this.botUserId,
    required this.languageCode,
    required this.shortDescription,
  });

  @override
  String get tdType => 'setBotInfoShortDescription';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBotInfoShortDescription',
      'bot_user_id': botUserId,
      'language_code': languageCode,
      'short_description': shortDescription,
    };
  }
}


/// Sets the name of a bot. Can be called only if userTypeBot.can_be_edited == true
class TdSetBotName extends TdObject {
  final int botUserId;
  final String languageCode;
  final String name;

  TdSetBotName({
    required this.botUserId,
    required this.languageCode,
    required this.name,
  });

  @override
  String get tdType => 'setBotName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBotName',
      'bot_user_id': botUserId,
      'language_code': languageCode,
      'name': name,
    };
  }
}


/// Changes a profile photo for a bot @bot_user_id Identifier of the target bot @photo Profile photo to ...
class TdSetBotProfilePhoto extends TdObject {
  final int botUserId;
  final TdInputChatPhoto? photo;

  TdSetBotProfilePhoto({
    required this.botUserId,
    this.photo,
  });

  @override
  String get tdType => 'setBotProfilePhoto';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBotProfilePhoto',
      'bot_user_id': botUserId,
      'photo': photo?.toMap(),
    };
  }
}


/// Informs the server about the number of pending bot updates if they haven\'t been processed for a long...
class TdSetBotUpdatesStatus extends TdObject {
  final int pendingUpdateCount;
  final String errorMessage;

  TdSetBotUpdatesStatus({
    required this.pendingUpdateCount,
    required this.errorMessage,
  });

  @override
  String get tdType => 'setBotUpdatesStatus';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBotUpdatesStatus',
      'pending_update_count': pendingUpdateCount,
      'error_message': errorMessage,
    };
  }
}


/// Changes the bio of a business account; for bots only
class TdSetBusinessAccountBio extends TdObject {
  final String businessConnectionId;
  final String bio;

  TdSetBusinessAccountBio({
    required this.businessConnectionId,
    required this.bio,
  });

  @override
  String get tdType => 'setBusinessAccountBio';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessAccountBio',
      'business_connection_id': businessConnectionId,
      'bio': bio,
    };
  }
}


/// Changes settings for gift receiving of a business account; for bots only
class TdSetBusinessAccountGiftSettings extends TdObject {
  final String businessConnectionId;
  final TdGiftSettings? settings;

  TdSetBusinessAccountGiftSettings({
    required this.businessConnectionId,
    this.settings,
  });

  @override
  String get tdType => 'setBusinessAccountGiftSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessAccountGiftSettings',
      'business_connection_id': businessConnectionId,
      'settings': settings?.toMap(),
    };
  }
}


/// Changes the first and last name of a business account; for bots only
class TdSetBusinessAccountName extends TdObject {
  final String businessConnectionId;
  final String firstName;
  final String lastName;

  TdSetBusinessAccountName({
    required this.businessConnectionId,
    required this.firstName,
    required this.lastName,
  });

  @override
  String get tdType => 'setBusinessAccountName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessAccountName',
      'business_connection_id': businessConnectionId,
      'first_name': firstName,
      'last_name': lastName,
    };
  }
}


/// Changes a profile photo of a business account; for bots only
class TdSetBusinessAccountProfilePhoto extends TdObject {
  final String businessConnectionId;
  final TdInputChatPhoto? photo;
  final bool isPublic;

  TdSetBusinessAccountProfilePhoto({
    required this.businessConnectionId,
    this.photo,
    required this.isPublic,
  });

  @override
  String get tdType => 'setBusinessAccountProfilePhoto';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessAccountProfilePhoto',
      'business_connection_id': businessConnectionId,
      'photo': photo?.toMap(),
      'is_public': isPublic,
    };
  }
}


/// Changes the editable username of a business account; for bots only
class TdSetBusinessAccountUsername extends TdObject {
  final String businessConnectionId;
  final String username;

  TdSetBusinessAccountUsername({
    required this.businessConnectionId,
    required this.username,
  });

  @override
  String get tdType => 'setBusinessAccountUsername';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessAccountUsername',
      'business_connection_id': businessConnectionId,
      'username': username,
    };
  }
}


/// Changes the business away message settings of the current user. Requires Telegram Business subscript...
class TdSetBusinessAwayMessageSettings extends TdObject {
  final TdBusinessAwayMessageSettings? awayMessageSettings;

  TdSetBusinessAwayMessageSettings({
    this.awayMessageSettings,
  });

  @override
  String get tdType => 'setBusinessAwayMessageSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessAwayMessageSettings',
      'away_message_settings': awayMessageSettings?.toMap(),
    };
  }
}


/// Adds or changes business bot that is connected to the current user account @bot Connection settings ...
class TdSetBusinessConnectedBot extends TdObject {
  final TdBusinessConnectedBot? bot;

  TdSetBusinessConnectedBot({
    this.bot,
  });

  @override
  String get tdType => 'setBusinessConnectedBot';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessConnectedBot',
      'bot': bot?.toMap(),
    };
  }
}


/// Changes the business greeting message settings of the current user. Requires Telegram Business subsc...
class TdSetBusinessGreetingMessageSettings extends TdObject {
  final TdBusinessGreetingMessageSettings? greetingMessageSettings;

  TdSetBusinessGreetingMessageSettings({
    this.greetingMessageSettings,
  });

  @override
  String get tdType => 'setBusinessGreetingMessageSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessGreetingMessageSettings',
      'greeting_message_settings': greetingMessageSettings?.toMap(),
    };
  }
}


/// Changes the business location of the current user. Requires Telegram Business subscription @location...
class TdSetBusinessLocation extends TdObject {
  final TdBusinessLocation? location;

  TdSetBusinessLocation({
    this.location,
  });

  @override
  String get tdType => 'setBusinessLocation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessLocation',
      'location': location?.toMap(),
    };
  }
}


/// Pins or unpins a message sent on behalf of a business account; for bots only
class TdSetBusinessMessageIsPinned extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final int messageId;
  final bool isPinned;

  TdSetBusinessMessageIsPinned({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    required this.isPinned,
  });

  @override
  String get tdType => 'setBusinessMessageIsPinned';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessMessageIsPinned',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'is_pinned': isPinned,
    };
  }
}


/// Changes the business opening hours of the current user. Requires Telegram Business subscription
class TdSetBusinessOpeningHours extends TdObject {
  final TdBusinessOpeningHours? openingHours;

  TdSetBusinessOpeningHours({
    this.openingHours,
  });

  @override
  String get tdType => 'setBusinessOpeningHours';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessOpeningHours',
      'opening_hours': openingHours?.toMap(),
    };
  }
}


/// Changes the business start page of the current user. Requires Telegram Business subscription @start_...
class TdSetBusinessStartPage extends TdObject {
  final TdInputBusinessStartPage? startPage;

  TdSetBusinessStartPage({
    this.startPage,
  });

  @override
  String get tdType => 'setBusinessStartPage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setBusinessStartPage',
      'start_page': startPage?.toMap(),
    };
  }
}


/// Changes accent color and background custom emoji of a channel chat. Requires can_change_info adminis...
class TdSetChatAccentColor extends TdObject {
  final int chatId;
  final int accentColorId;
  final int backgroundCustomEmojiId;

  TdSetChatAccentColor({
    required this.chatId,
    required this.accentColorId,
    required this.backgroundCustomEmojiId,
  });

  @override
  String get tdType => 'setChatAccentColor';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatAccentColor',
      'chat_id': chatId,
      'accent_color_id': accentColorId,
      'background_custom_emoji_id': backgroundCustomEmojiId,
    };
  }
}


/// Changes story list in which stories from the chat are shown @chat_id Identifier of the chat that pos...
class TdSetChatActiveStoriesList extends TdObject {
  final int chatId;
  final TdStoryList? storyList;

  TdSetChatActiveStoriesList({
    required this.chatId,
    this.storyList,
  });

  @override
  String get tdType => 'setChatActiveStoriesList';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatActiveStoriesList',
      'chat_id': chatId,
      'story_list': storyList?.toMap(),
    };
  }
}


/// Changes affiliate program for a bot If the active program is scheduled to be closed, then it can\'t b...
class TdSetChatAffiliateProgram extends TdObject {
  final int chatId;
  final TdAffiliateProgramParameters? eters;

  TdSetChatAffiliateProgram({
    required this.chatId,
    this.eters,
  });

  @override
  String get tdType => 'setChatAffiliateProgram';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatAffiliateProgram',
      'chat_id': chatId,
      'parameters': eters?.toMap(),
    };
  }
}


/// Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requi...
class TdSetChatAvailableReactions extends TdObject {
  final int chatId;
  final TdChatAvailableReactions? availableReactions;

  TdSetChatAvailableReactions({
    required this.chatId,
    this.availableReactions,
  });

  @override
  String get tdType => 'setChatAvailableReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatAvailableReactions',
      'chat_id': chatId,
      'available_reactions': availableReactions?.toMap(),
    };
  }
}


/// Sets the background in a specific chat. Supported only in private and secret chats with non-deleted ...
class TdSetChatBackground extends TdObject {
  final int chatId;
  final TdInputBackground? background;
  final TdBackgroundType? type;
  final int darkThemeDimming;
  final bool onlyForSelf;

  TdSetChatBackground({
    required this.chatId,
    this.background,
    this.type,
    required this.darkThemeDimming,
    required this.onlyForSelf,
  });

  @override
  String get tdType => 'setChatBackground';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatBackground',
      'chat_id': chatId,
      'background': background?.toMap(),
      'type': type?.toMap(),
      'dark_theme_dimming': darkThemeDimming,
      'only_for_self': onlyForSelf,
    };
  }
}


/// Changes application-specific data associated with a chat @chat_id Chat identifier @client_data New v...
class TdSetChatClientData extends TdObject {
  final int chatId;
  final String clientData;

  TdSetChatClientData({
    required this.chatId,
    required this.clientData,
  });

  @override
  String get tdType => 'setChatClientData';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatClientData',
      'chat_id': chatId,
      'client_data': clientData,
    };
  }
}


/// Changes information about a chat. Available for basic groups, supergroups, and channels. Requires ca...
class TdSetChatDescription extends TdObject {
  final int chatId;
  final String description;

  TdSetChatDescription({
    required this.chatId,
    required this.description,
  });

  @override
  String get tdType => 'setChatDescription';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatDescription',
      'chat_id': chatId,
      'description': description,
    };
  }
}


/// Changes direct messages group settings for a channel chat; requires owner privileges in the chat The...
class TdSetChatDirectMessagesGroup extends TdObject {
  final int chatId;
  final bool isEnabled;
  final int paidMessageStarCount;

  TdSetChatDirectMessagesGroup({
    required this.chatId,
    required this.isEnabled,
    required this.paidMessageStarCount,
  });

  @override
  String get tdType => 'setChatDirectMessagesGroup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatDirectMessagesGroup',
      'chat_id': chatId,
      'is_enabled': isEnabled,
      'paid_message_star_count': paidMessageStarCount,
    };
  }
}


/// Changes the discussion group of a channel chat; requires can_change_info administrator right in the ...
class TdSetChatDiscussionGroup extends TdObject {
  final int chatId;
  final int discussionChatId;

  TdSetChatDiscussionGroup({
    required this.chatId,
    required this.discussionChatId,
  });

  @override
  String get tdType => 'setChatDiscussionGroup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatDiscussionGroup',
      'chat_id': chatId,
      'discussion_chat_id': discussionChatId,
    };
  }
}


/// Changes the draft message in a chat or a topic
class TdSetChatDraftMessage extends TdObject {
  final int chatId;
  final TdMessageTopic? topicId;
  final TdDraftMessage? draftMessage;

  TdSetChatDraftMessage({
    required this.chatId,
    this.topicId,
    this.draftMessage,
  });

  @override
  String get tdType => 'setChatDraftMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatDraftMessage',
      'chat_id': chatId,
      'topic_id': topicId?.toMap(),
      'draft_message': draftMessage?.toMap(),
    };
  }
}


/// Changes the emoji status of a chat. Use chatBoostLevelFeatures.can_set_emoji_status to check whether...
class TdSetChatEmojiStatus extends TdObject {
  final int chatId;
  final TdEmojiStatus? emojiStatus;

  TdSetChatEmojiStatus({
    required this.chatId,
    this.emojiStatus,
  });

  @override
  String get tdType => 'setChatEmojiStatus';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatEmojiStatus',
      'chat_id': chatId,
      'emoji_status': emojiStatus?.toMap(),
    };
  }
}


/// Changes the location of a chat. Available only for some location-based supergroups, use supergroupFu...
class TdSetChatLocation extends TdObject {
  final int chatId;
  final TdChatLocation? location;

  TdSetChatLocation({
    required this.chatId,
    this.location,
  });

  @override
  String get tdType => 'setChatLocation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatLocation',
      'chat_id': chatId,
      'location': location?.toMap(),
    };
  }
}


/// Changes the status of a chat member; requires can_invite_users member right to add a chat member, ca...
class TdSetChatMemberStatus extends TdObject {
  final int chatId;
  final TdMessageSender? memberId;
  final TdChatMemberStatus? status;

  TdSetChatMemberStatus({
    required this.chatId,
    this.memberId,
    this.status,
  });

  @override
  String get tdType => 'setChatMemberStatus';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatMemberStatus',
      'chat_id': chatId,
      'member_id': memberId?.toMap(),
      'status': status?.toMap(),
    };
  }
}


/// Changes the message auto-delete or self-destruct (for secret chats) time in a chat. Requires change_...
class TdSetChatMessageAutoDeleteTime extends TdObject {
  final int chatId;
  final int messageAutoDeleteTime;

  TdSetChatMessageAutoDeleteTime({
    required this.chatId,
    required this.messageAutoDeleteTime,
  });

  @override
  String get tdType => 'setChatMessageAutoDeleteTime';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatMessageAutoDeleteTime',
      'chat_id': chatId,
      'message_auto_delete_time': messageAutoDeleteTime,
    };
  }
}


/// Selects a message sender to send messages in a chat @chat_id Chat identifier @message_sender_id New ...
class TdSetChatMessageSender extends TdObject {
  final int chatId;
  final TdMessageSender? messageSenderId;

  TdSetChatMessageSender({
    required this.chatId,
    this.messageSenderId,
  });

  @override
  String get tdType => 'setChatMessageSender';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatMessageSender',
      'chat_id': chatId,
      'message_sender_id': messageSenderId?.toMap(),
    };
  }
}


/// Changes the notification settings of a chat. Notification settings of a chat with the current user (...
class TdSetChatNotificationSettings extends TdObject {
  final int chatId;
  final TdChatNotificationSettings? notificationSettings;

  TdSetChatNotificationSettings({
    required this.chatId,
    this.notificationSettings,
  });

  @override
  String get tdType => 'setChatNotificationSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatNotificationSettings',
      'chat_id': chatId,
      'notification_settings': notificationSettings?.toMap(),
    };
  }
}


/// Changes the amount of Telegram Stars that must be paid to send a message to a supergroup chat; requi...
class TdSetChatPaidMessageStarCount extends TdObject {
  final int chatId;
  final int paidMessageStarCount;

  TdSetChatPaidMessageStarCount({
    required this.chatId,
    required this.paidMessageStarCount,
  });

  @override
  String get tdType => 'setChatPaidMessageStarCount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatPaidMessageStarCount',
      'chat_id': chatId,
      'paid_message_star_count': paidMessageStarCount,
    };
  }
}


/// Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_...
class TdSetChatPermissions extends TdObject {
  final int chatId;
  final TdChatPermissions? permissions;

  TdSetChatPermissions({
    required this.chatId,
    this.permissions,
  });

  @override
  String get tdType => 'setChatPermissions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatPermissions',
      'chat_id': chatId,
      'permissions': permissions?.toMap(),
    };
  }
}


/// Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can...
class TdSetChatPhoto extends TdObject {
  final int chatId;
  final TdInputChatPhoto? photo;

  TdSetChatPhoto({
    required this.chatId,
    this.photo,
  });

  @override
  String get tdType => 'setChatPhoto';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatPhoto',
      'chat_id': chatId,
      'photo': photo?.toMap(),
    };
  }
}


/// Changes the list of pinned stories on a chat page; requires can_edit_stories administrator right in ...
class TdSetChatPinnedStories extends TdObject {
  final int chatId;
  final List<int> storyIds;

  TdSetChatPinnedStories({
    required this.chatId,
    required this.storyIds,
  });

  @override
  String get tdType => 'setChatPinnedStories';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatPinnedStories',
      'chat_id': chatId,
      'story_ids': storyIds,
    };
  }
}


/// Changes accent color and background custom emoji for profile of a supergroup or channel chat. Requir...
class TdSetChatProfileAccentColor extends TdObject {
  final int chatId;
  final int profileAccentColorId;
  final int profileBackgroundCustomEmojiId;

  TdSetChatProfileAccentColor({
    required this.chatId,
    required this.profileAccentColorId,
    required this.profileBackgroundCustomEmojiId,
  });

  @override
  String get tdType => 'setChatProfileAccentColor';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatProfileAccentColor',
      'chat_id': chatId,
      'profile_accent_color_id': profileAccentColorId,
      'profile_background_custom_emoji_id': profileBackgroundCustomEmojiId,
    };
  }
}


/// Changes the slow mode delay of a chat. Available only for supergroups; requires can_restrict_members...
class TdSetChatSlowModeDelay extends TdObject {
  final int chatId;
  final int slowModeDelay;

  TdSetChatSlowModeDelay({
    required this.chatId,
    required this.slowModeDelay,
  });

  @override
  String get tdType => 'setChatSlowModeDelay';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatSlowModeDelay',
      'chat_id': chatId,
      'slow_mode_delay': slowModeDelay,
    };
  }
}


/// Changes the chat theme. Supported only in private and secret chats @chat_id Chat identifier @theme N...
class TdSetChatTheme extends TdObject {
  final int chatId;
  final TdInputChatTheme? theme;

  TdSetChatTheme({
    required this.chatId,
    this.theme,
  });

  @override
  String get tdType => 'setChatTheme';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatTheme',
      'chat_id': chatId,
      'theme': theme?.toMap(),
    };
  }
}


/// Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_chan...
class TdSetChatTitle extends TdObject {
  final int chatId;
  final String title;

  TdSetChatTitle({
    required this.chatId,
    required this.title,
  });

  @override
  String get tdType => 'setChatTitle';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setChatTitle',
      'chat_id': chatId,
      'title': title,
    };
  }
}


/// Changes the list of close friends of the current user @user_ids User identifiers of close friends; t...
class TdSetCloseFriends extends TdObject {
  final List<int> userIds;

  TdSetCloseFriends({
    required this.userIds,
  });

  @override
  String get tdType => 'setCloseFriends';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setCloseFriends',
      'user_ids': userIds,
    };
  }
}


/// Sets the list of commands supported by the bot for the given user scope and language; for bots only
class TdSetCommands extends TdObject {
  final TdBotCommandScope? scope;
  final String languageCode;
  final List<TdBotCommand> commands;

  TdSetCommands({
    this.scope,
    required this.languageCode,
    required this.commands,
  });

  @override
  String get tdType => 'setCommands';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setCommands',
      'scope': scope?.toMap(),
      'language_code': languageCode,
      'commands': commands.map((e) => e.toMap()).toList(),
    };
  }
}


/// Sets a custom emoji sticker set thumbnail
class TdSetCustomEmojiStickerSetThumbnail extends TdObject {
  final String name;
  final int customEmojiId;

  TdSetCustomEmojiStickerSetThumbnail({
    required this.name,
    required this.customEmojiId,
  });

  @override
  String get tdType => 'setCustomEmojiStickerSetThumbnail';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setCustomEmojiStickerSetThumbnail',
      'name': name,
      'custom_emoji_id': customEmojiId,
    };
  }
}


/// Adds or changes a custom local language pack to the current localization target
class TdSetCustomLanguagePack extends TdObject {
  final TdLanguagePackInfo? info;
  final List<TdLanguagePackString> strings;

  TdSetCustomLanguagePack({
    this.info,
    required this.strings,
  });

  @override
  String get tdType => 'setCustomLanguagePack';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setCustomLanguagePack',
      'info': info?.toMap(),
      'strings': strings.map((e) => e.toMap()).toList(),
    };
  }
}


/// Adds, edits or deletes a string in a custom local language pack. Can be called before authorization ...
class TdSetCustomLanguagePackString extends TdObject {
  final String languagePackId;
  final TdLanguagePackString? newString;

  TdSetCustomLanguagePackString({
    required this.languagePackId,
    this.newString,
  });

  @override
  String get tdType => 'setCustomLanguagePackString';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setCustomLanguagePackString',
      'language_pack_id': languagePackId,
      'new_string': newString?.toMap(),
    };
  }
}


/// Changes the database encryption key. Usually the encryption key is never changed and is stored in so...
class TdSetDatabaseEncryptionKey extends TdObject {
  final String newEncryptionKey;

  TdSetDatabaseEncryptionKey({
    required this.newEncryptionKey,
  });

  @override
  String get tdType => 'setDatabaseEncryptionKey';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setDatabaseEncryptionKey',
      'new_encryption_key': newEncryptionKey,
    };
  }
}


/// Sets default background for chats; adds the background to the list of installed backgrounds
class TdSetDefaultBackground extends TdObject {
  final TdInputBackground? background;
  final TdBackgroundType? type;
  final bool forDarkTheme;

  TdSetDefaultBackground({
    this.background,
    this.type,
    required this.forDarkTheme,
  });

  @override
  String get tdType => 'setDefaultBackground';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setDefaultBackground',
      'background': background?.toMap(),
      'type': type?.toMap(),
      'for_dark_theme': forDarkTheme,
    };
  }
}


/// Sets default administrator rights for adding the bot to channel chats; for bots only @default_channe...
class TdSetDefaultChannelAdministratorRights extends TdObject {
  final TdChatAdministratorRights? defaultChannelAdministratorRights;

  TdSetDefaultChannelAdministratorRights({
    this.defaultChannelAdministratorRights,
  });

  @override
  String get tdType => 'setDefaultChannelAdministratorRights';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setDefaultChannelAdministratorRights',
      'default_channel_administrator_rights': defaultChannelAdministratorRights?.toMap(),
    };
  }
}


/// Sets default administrator rights for adding the bot to basic group and supergroup chats; for bots o...
class TdSetDefaultGroupAdministratorRights extends TdObject {
  final TdChatAdministratorRights? defaultGroupAdministratorRights;

  TdSetDefaultGroupAdministratorRights({
    this.defaultGroupAdministratorRights,
  });

  @override
  String get tdType => 'setDefaultGroupAdministratorRights';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setDefaultGroupAdministratorRights',
      'default_group_administrator_rights': defaultGroupAdministratorRights?.toMap(),
    };
  }
}


/// Changes the default message auto-delete time for new chats @message_auto_delete_time New default mes...
class TdSetDefaultMessageAutoDeleteTime extends TdObject {
  final TdMessageAutoDeleteTime? messageAutoDeleteTime;

  TdSetDefaultMessageAutoDeleteTime({
    this.messageAutoDeleteTime,
  });

  @override
  String get tdType => 'setDefaultMessageAutoDeleteTime';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setDefaultMessageAutoDeleteTime',
      'message_auto_delete_time': messageAutoDeleteTime?.toMap(),
    };
  }
}


/// Changes type of default reaction for the current user @reaction_type New type of the default reactio...
class TdSetDefaultReactionType extends TdObject {
  final TdReactionType? reactionType;

  TdSetDefaultReactionType({
    this.reactionType,
  });

  @override
  String get tdType => 'setDefaultReactionType';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setDefaultReactionType',
      'reaction_type': reactionType?.toMap(),
    };
  }
}


/// Changes the marked as unread state of the topic in a channel direct messages chat administered by th...
class TdSetDirectMessagesChatTopicIsMarkedAsUnread extends TdObject {
  final int chatId;
  final int topicId;
  final bool isMarkedAsUnread;

  TdSetDirectMessagesChatTopicIsMarkedAsUnread({
    required this.chatId,
    required this.topicId,
    required this.isMarkedAsUnread,
  });

  @override
  String get tdType => 'setDirectMessagesChatTopicIsMarkedAsUnread';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setDirectMessagesChatTopicIsMarkedAsUnread',
      'chat_id': chatId,
      'topic_id': topicId,
      'is_marked_as_unread': isMarkedAsUnread,
    };
  }
}


/// Changes the emoji status of the current user; for Telegram Premium users only @emoji_status New emoj...
class TdSetEmojiStatus extends TdObject {
  final TdEmojiStatus? emojiStatus;

  TdSetEmojiStatus({
    this.emojiStatus,
  });

  @override
  String get tdType => 'setEmojiStatus';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setEmojiStatus',
      'emoji_status': emojiStatus?.toMap(),
    };
  }
}


/// Informs TDLib on a file generation progress
class TdSetFileGenerationProgress extends TdObject {
  final int generationId;
  final int expectedSize;
  final int localPrefixSize;

  TdSetFileGenerationProgress({
    required this.generationId,
    required this.expectedSize,
    required this.localPrefixSize,
  });

  @override
  String get tdType => 'setFileGenerationProgress';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setFileGenerationProgress',
      'generation_id': generationId,
      'expected_size': expectedSize,
      'local_prefix_size': localPrefixSize,
    };
  }
}


/// Changes the notification settings of a forum topic in a forum supergroup chat or a chat with a bot w...
class TdSetForumTopicNotificationSettings extends TdObject {
  final int chatId;
  final int forumTopicId;
  final TdChatNotificationSettings? notificationSettings;

  TdSetForumTopicNotificationSettings({
    required this.chatId,
    required this.forumTopicId,
    this.notificationSettings,
  });

  @override
  String get tdType => 'setForumTopicNotificationSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setForumTopicNotificationSettings',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
      'notification_settings': notificationSettings?.toMap(),
    };
  }
}


/// Updates the game score of the specified user in the game; for bots only
class TdSetGameScore extends TdObject {
  final int chatId;
  final int messageId;
  final bool editMessage;
  final int userId;
  final int score;
  final bool force;

  TdSetGameScore({
    required this.chatId,
    required this.messageId,
    required this.editMessage,
    required this.userId,
    required this.score,
    required this.force,
  });

  @override
  String get tdType => 'setGameScore';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setGameScore',
      'chat_id': chatId,
      'message_id': messageId,
      'edit_message': editMessage,
      'user_id': userId,
      'score': score,
      'force': force,
    };
  }
}


/// Changes name of a gift collection. If the collection is owned by a channel chat, then requires can_p...
class TdSetGiftCollectionName extends TdObject {
  final TdMessageSender? ownerId;
  final int collectionId;
  final String name;

  TdSetGiftCollectionName({
    this.ownerId,
    required this.collectionId,
    required this.name,
  });

  @override
  String get tdType => 'setGiftCollectionName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setGiftCollectionName',
      'owner_id': ownerId?.toMap(),
      'collection_id': collectionId,
      'name': name,
    };
  }
}


/// Changes resale price of a unique gift owned by the current user getOption("gift_resale_star_earnings...
class TdSetGiftResalePrice extends TdObject {
  final String receivedGiftId;
  final TdGiftResalePrice? price;

  TdSetGiftResalePrice({
    required this.receivedGiftId,
    this.price,
  });

  @override
  String get tdType => 'setGiftResalePrice';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setGiftResalePrice',
      'received_gift_id': receivedGiftId,
      'price': price?.toMap(),
    };
  }
}


/// Changes settings for gift receiving for the current user @settings The new settings
class TdSetGiftSettings extends TdObject {
  final TdGiftSettings? settings;

  TdSetGiftSettings({
    this.settings,
  });

  @override
  String get tdType => 'setGiftSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setGiftSettings',
      'settings': settings?.toMap(),
    };
  }
}


/// Changes the minimum number of Telegram Stars that must be paid by general participant for each sent ...
class TdSetGroupCallPaidMessageStarCount extends TdObject {
  final int groupCallId;
  final int paidMessageStarCount;

  TdSetGroupCallPaidMessageStarCount({
    required this.groupCallId,
    required this.paidMessageStarCount,
  });

  @override
  String get tdType => 'setGroupCallPaidMessageStarCount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setGroupCallPaidMessageStarCount',
      'group_call_id': groupCallId,
      'paid_message_star_count': paidMessageStarCount,
    };
  }
}


/// Informs TDLib that speaking state of a participant of an active group call has changed. Returns iden...
class TdSetGroupCallParticipantIsSpeaking extends TdObject {
  final int groupCallId;
  final int audioSource;
  final bool isSpeaking;

  TdSetGroupCallParticipantIsSpeaking({
    required this.groupCallId,
    required this.audioSource,
    required this.isSpeaking,
  });

  @override
  String get tdType => 'setGroupCallParticipantIsSpeaking';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setGroupCallParticipantIsSpeaking',
      'group_call_id': groupCallId,
      'audio_source': audioSource,
      'is_speaking': isSpeaking,
    };
  }
}


/// Changes volume level of a participant of an active group call; not supported for live stories. If th...
class TdSetGroupCallParticipantVolumeLevel extends TdObject {
  final int groupCallId;
  final TdMessageSender? participantId;
  final int volumeLevel;

  TdSetGroupCallParticipantVolumeLevel({
    required this.groupCallId,
    this.participantId,
    required this.volumeLevel,
  });

  @override
  String get tdType => 'setGroupCallParticipantVolumeLevel';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setGroupCallParticipantVolumeLevel',
      'group_call_id': groupCallId,
      'participant_id': participantId?.toMap(),
      'volume_level': volumeLevel,
    };
  }
}


/// Changes the period of inactivity after which sessions will automatically be terminated @inactive_ses...
class TdSetInactiveSessionTtl extends TdObject {
  final int inactiveSessionTtlDays;

  TdSetInactiveSessionTtl({
    required this.inactiveSessionTtlDays,
  });

  @override
  String get tdType => 'setInactiveSessionTtl';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setInactiveSessionTtl',
      'inactive_session_ttl_days': inactiveSessionTtlDays,
    };
  }
}


/// Updates the game score of the specified user in a game; for bots only
class TdSetInlineGameScore extends TdObject {
  final String inlineMessageId;
  final bool editMessage;
  final int userId;
  final int score;
  final bool force;

  TdSetInlineGameScore({
    required this.inlineMessageId,
    required this.editMessage,
    required this.userId,
    required this.score,
    required this.force,
  });

  @override
  String get tdType => 'setInlineGameScore';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setInlineGameScore',
      'inline_message_id': inlineMessageId,
      'edit_message': editMessage,
      'user_id': userId,
      'score': score,
      'force': force,
    };
  }
}


/// Selects a message sender to send messages in a live story call
class TdSetLiveStoryMessageSender extends TdObject {
  final int groupCallId;
  final TdMessageSender? messageSenderId;

  TdSetLiveStoryMessageSender({
    required this.groupCallId,
    this.messageSenderId,
  });

  @override
  String get tdType => 'setLiveStoryMessageSender';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setLiveStoryMessageSender',
      'group_call_id': groupCallId,
      'message_sender_id': messageSenderId?.toMap(),
    };
  }
}


/// Sets new log stream for internal logging of TDLib. Can be called synchronously @log_stream New log s...
class TdSetLogStream extends TdObject {
  final TdLogStream? logStream;

  TdSetLogStream({
    this.logStream,
  });

  @override
  String get tdType => 'setLogStream';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setLogStream',
      'log_stream': logStream?.toMap(),
    };
  }
}


/// Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously
class TdSetLogTagVerbosityLevel extends TdObject {
  final String tag;
  final int newVerbosityLevel;

  TdSetLogTagVerbosityLevel({
    required this.tag,
    required this.newVerbosityLevel,
  });

  @override
  String get tdType => 'setLogTagVerbosityLevel';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setLogTagVerbosityLevel',
      'tag': tag,
      'new_verbosity_level': newVerbosityLevel,
    };
  }
}


/// Sets the verbosity level of the internal logging of TDLib. Can be called synchronously value 3 corre...
class TdSetLogVerbosityLevel extends TdObject {
  final int newVerbosityLevel;

  TdSetLogVerbosityLevel({
    required this.newVerbosityLevel,
  });

  @override
  String get tdType => 'setLogVerbosityLevel';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setLogVerbosityLevel',
      'new_verbosity_level': newVerbosityLevel,
    };
  }
}


/// Changes the login email address of the user. The email address can be changed only if the current us...
class TdSetLoginEmailAddress extends TdObject {
  final String newLoginEmailAddress;

  TdSetLoginEmailAddress({
    required this.newLoginEmailAddress,
  });

  @override
  String get tdType => 'setLoginEmailAddress';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setLoginEmailAddress',
      'new_login_email_address': newLoginEmailAddress,
    };
  }
}


/// Changes the main profile tab of the current user @main_profile_tab The new value of the main profile...
class TdSetMainProfileTab extends TdObject {
  final TdProfileTab? mainProfileTab;

  TdSetMainProfileTab({
    this.mainProfileTab,
  });

  @override
  String get tdType => 'setMainProfileTab';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setMainProfileTab',
      'main_profile_tab': mainProfileTab?.toMap(),
    };
  }
}


/// Sets menu button for the given user or for all users; for bots only
class TdSetMenuButton extends TdObject {
  final int userId;
  final TdBotMenuButton? menuButton;

  TdSetMenuButton({
    required this.userId,
    this.menuButton,
  });

  @override
  String get tdType => 'setMenuButton';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setMenuButton',
      'user_id': userId,
      'menu_button': menuButton?.toMap(),
    };
  }
}


/// Changes the fact-check of a message. Can be only used if messageProperties.can_set_fact_check == tru...
class TdSetMessageFactCheck extends TdObject {
  final int chatId;
  final int messageId;
  final TdFormattedText? text;

  TdSetMessageFactCheck({
    required this.chatId,
    required this.messageId,
    this.text,
  });

  @override
  String get tdType => 'setMessageFactCheck';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setMessageFactCheck',
      'chat_id': chatId,
      'message_id': messageId,
      'text': text?.toMap(),
    };
  }
}


/// Sets reactions on a message; for bots only
class TdSetMessageReactions extends TdObject {
  final int chatId;
  final int messageId;
  final List<TdReactionType> reactionTypes;
  final bool isBig;

  TdSetMessageReactions({
    required this.chatId,
    required this.messageId,
    required this.reactionTypes,
    required this.isBig,
  });

  @override
  String get tdType => 'setMessageReactions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setMessageReactions',
      'chat_id': chatId,
      'message_id': messageId,
      'reaction_types': reactionTypes.map((e) => e.toMap()).toList(),
      'is_big': isBig,
    };
  }
}


/// Changes the block list of a message sender. Currently, only users and supergroup chats can be blocke...
class TdSetMessageSenderBlockList extends TdObject {
  final TdMessageSender? senderId;
  final TdBlockList? blockList;

  TdSetMessageSenderBlockList({
    this.senderId,
    this.blockList,
  });

  @override
  String get tdType => 'setMessageSenderBlockList';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setMessageSenderBlockList',
      'sender_id': senderId?.toMap(),
      'block_list': blockList?.toMap(),
    };
  }
}


/// Changes the verification status of a user or a chat by an owned bot If empty, then "was verified by ...
class TdSetMessageSenderBotVerification extends TdObject {
  final int botUserId;
  final TdMessageSender? verifiedId;
  final String customDescription;

  TdSetMessageSenderBotVerification({
    required this.botUserId,
    this.verifiedId,
    required this.customDescription,
  });

  @override
  String get tdType => 'setMessageSenderBotVerification';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setMessageSenderBotVerification',
      'bot_user_id': botUserId,
      'verified_id': verifiedId?.toMap(),
      'custom_description': customDescription,
    };
  }
}


/// Changes the first and last name of the current user @first_name The new value of the first name for ...
class TdSetName extends TdObject {
  final String firstName;
  final String lastName;

  TdSetName({
    required this.firstName,
    required this.lastName,
  });

  @override
  String get tdType => 'setName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setName',
      'first_name': firstName,
      'last_name': lastName,
    };
  }
}


/// Sets the current network type. Can be called before authorization. Calling this method forces all ne...
class TdSetNetworkType extends TdObject {
  final TdNetworkType? type;

  TdSetNetworkType({
    this.type,
  });

  @override
  String get tdType => 'setNetworkType';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setNetworkType',
      'type': type?.toMap(),
    };
  }
}


/// Changes privacy settings for new chat creation; can be used only if getOption("can_set_new_chat_priv...
class TdSetNewChatPrivacySettings extends TdObject {
  final TdNewChatPrivacySettings? settings;

  TdSetNewChatPrivacySettings({
    this.settings,
  });

  @override
  String get tdType => 'setNewChatPrivacySettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setNewChatPrivacySettings',
      'settings': settings?.toMap(),
    };
  }
}


/// Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib...
class TdSetOption extends TdObject {
  final String name;
  final TdOptionValue? value;

  TdSetOption({
    required this.name,
    this.value,
  });

  @override
  String get tdType => 'setOption';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setOption',
      'name': name,
      'value': value?.toMap(),
    };
  }
}


/// Changes type of paid message reaction of the current user on a message. The message must have paid r...
class TdSetPaidMessageReactionType extends TdObject {
  final int chatId;
  final int messageId;
  final TdPaidReactionType? type;

  TdSetPaidMessageReactionType({
    required this.chatId,
    required this.messageId,
    this.type,
  });

  @override
  String get tdType => 'setPaidMessageReactionType';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPaidMessageReactionType',
      'chat_id': chatId,
      'message_id': messageId,
      'type': type?.toMap(),
    };
  }
}


/// Adds an element to the user\'s Telegram Passport. May return an error with a message "PHONE_VERIFICAT...
class TdSetPassportElement extends TdObject {
  final TdInputPassportElement? element;
  final String password;

  TdSetPassportElement({
    this.element,
    required this.password,
  });

  @override
  String get tdType => 'setPassportElement';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPassportElement',
      'element': element?.toMap(),
      'password': password,
    };
  }
}


/// Informs the user that some of the elements in their Telegram Passport contain errors; for bots only....
class TdSetPassportElementErrors extends TdObject {
  final int userId;
  final List<TdInputPassportElementError> errors;

  TdSetPassportElementErrors({
    required this.userId,
    required this.errors,
  });

  @override
  String get tdType => 'setPassportElementErrors';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPassportElementErrors',
      'user_id': userId,
      'errors': errors.map((e) => e.toMap()).toList(),
    };
  }
}


/// Changes the 2-step verification password for the current user. If a new recovery email address is sp...
class TdSetPassword extends TdObject {
  final String oldPassword;
  final String newPassword;
  final String newHint;
  final bool setRecoveryEmailAddress;
  final String newRecoveryEmailAddress;

  TdSetPassword({
    required this.oldPassword,
    required this.newPassword,
    required this.newHint,
    required this.setRecoveryEmailAddress,
    required this.newRecoveryEmailAddress,
  });

  @override
  String get tdType => 'setPassword';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPassword',
      'old_password': oldPassword,
      'new_password': newPassword,
      'new_hint': newHint,
      'set_recovery_email_address': setRecoveryEmailAddress,
      'new_recovery_email_address': newRecoveryEmailAddress,
    };
  }
}


/// Changes the personal chat of the current user @chat_id Identifier of the new personal chat; pass 0 t...
class TdSetPersonalChat extends TdObject {
  final int chatId;

  TdSetPersonalChat({
    required this.chatId,
  });

  @override
  String get tdType => 'setPersonalChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPersonalChat',
      'chat_id': chatId,
    };
  }
}


/// Changes the order of pinned chats @chat_list Chat list in which to change the order of pinned chats ...
class TdSetPinnedChats extends TdObject {
  final TdChatList? chatList;
  final List<int> chatIds;

  TdSetPinnedChats({
    this.chatList,
    required this.chatIds,
  });

  @override
  String get tdType => 'setPinnedChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPinnedChats',
      'chat_list': chatList?.toMap(),
      'chat_ids': chatIds,
    };
  }
}


/// Changes the order of pinned topics in a forum supergroup chat or a chat with a bot with topics; requ...
class TdSetPinnedForumTopics extends TdObject {
  final int chatId;
  final List<int> forumTopicIds;

  TdSetPinnedForumTopics({
    required this.chatId,
    required this.forumTopicIds,
  });

  @override
  String get tdType => 'setPinnedForumTopics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPinnedForumTopics',
      'chat_id': chatId,
      'forum_topic_ids': forumTopicIds,
    };
  }
}


/// Changes the list of pinned gifts on the current user\'s or the channel\'s profile page; requires can_p...
class TdSetPinnedGifts extends TdObject {
  final TdMessageSender? ownerId;
  final List<String> receivedGiftIds;

  TdSetPinnedGifts({
    this.ownerId,
    required this.receivedGiftIds,
  });

  @override
  String get tdType => 'setPinnedGifts';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPinnedGifts',
      'owner_id': ownerId?.toMap(),
      'received_gift_ids': receivedGiftIds,
    };
  }
}


/// Changes the order of pinned Saved Messages topics @saved_messages_topic_ids Identifiers of the new p...
class TdSetPinnedSavedMessagesTopics extends TdObject {
  final List<int> savedMessagesTopicIds;

  TdSetPinnedSavedMessagesTopics({
    required this.savedMessagesTopicIds,
  });

  @override
  String get tdType => 'setPinnedSavedMessagesTopics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPinnedSavedMessagesTopics',
      'saved_messages_topic_ids': savedMessagesTopicIds,
    };
  }
}


/// Changes the user answer to a poll. A poll in quiz mode can be answered only once
class TdSetPollAnswer extends TdObject {
  final int chatId;
  final int messageId;
  final List<int> optionIds;

  TdSetPollAnswer({
    required this.chatId,
    required this.messageId,
    required this.optionIds,
  });

  @override
  String get tdType => 'setPollAnswer';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setPollAnswer',
      'chat_id': chatId,
      'message_id': messageId,
      'option_ids': optionIds,
    };
  }
}


/// Changes accent color and background custom emoji for profile of the current user; for Telegram Premi...
class TdSetProfileAccentColor extends TdObject {
  final int profileAccentColorId;
  final int profileBackgroundCustomEmojiId;

  TdSetProfileAccentColor({
    required this.profileAccentColorId,
    required this.profileBackgroundCustomEmojiId,
  });

  @override
  String get tdType => 'setProfileAccentColor';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setProfileAccentColor',
      'profile_accent_color_id': profileAccentColorId,
      'profile_background_custom_emoji_id': profileBackgroundCustomEmojiId,
    };
  }
}


/// Changes position of an audio file in the profile audio files of the current user
class TdSetProfileAudioPosition extends TdObject {
  final int fileId;
  final int afterFileId;

  TdSetProfileAudioPosition({
    required this.fileId,
    required this.afterFileId,
  });

  @override
  String get tdType => 'setProfileAudioPosition';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setProfileAudioPosition',
      'file_id': fileId,
      'after_file_id': afterFileId,
    };
  }
}


/// Changes a profile photo for the current user
class TdSetProfilePhoto extends TdObject {
  final TdInputChatPhoto? photo;
  final bool isPublic;

  TdSetProfilePhoto({
    this.photo,
    required this.isPublic,
  });

  @override
  String get tdType => 'setProfilePhoto';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setProfilePhoto',
      'photo': photo?.toMap(),
      'is_public': isPublic,
    };
  }
}


/// Changes name of a quick reply shortcut @shortcut_id Unique identifier of the quick reply shortcut @n...
class TdSetQuickReplyShortcutName extends TdObject {
  final int shortcutId;
  final String name;

  TdSetQuickReplyShortcutName({
    required this.shortcutId,
    required this.name,
  });

  @override
  String get tdType => 'setQuickReplyShortcutName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setQuickReplyShortcutName',
      'shortcut_id': shortcutId,
      'name': name,
    };
  }
}


/// Changes notification settings for reactions @notification_settings The new notification settings for...
class TdSetReactionNotificationSettings extends TdObject {
  final TdReactionNotificationSettings? notificationSettings;

  TdSetReactionNotificationSettings({
    this.notificationSettings,
  });

  @override
  String get tdType => 'setReactionNotificationSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setReactionNotificationSettings',
      'notification_settings': notificationSettings?.toMap(),
    };
  }
}


/// Changes privacy settings for message read date @settings New settings
class TdSetReadDatePrivacySettings extends TdObject {
  final TdReadDatePrivacySettings? settings;

  TdSetReadDatePrivacySettings({
    this.settings,
  });

  @override
  String get tdType => 'setReadDatePrivacySettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setReadDatePrivacySettings',
      'settings': settings?.toMap(),
    };
  }
}


/// Changes the 2-step verification recovery email address of the user. If a new recovery email address ...
class TdSetRecoveryEmailAddress extends TdObject {
  final String password;
  final String newRecoveryEmailAddress;

  TdSetRecoveryEmailAddress({
    required this.password,
    required this.newRecoveryEmailAddress,
  });

  @override
  String get tdType => 'setRecoveryEmailAddress';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setRecoveryEmailAddress',
      'password': password,
      'new_recovery_email_address': newRecoveryEmailAddress,
    };
  }
}


/// Changes label of a Saved Messages tag; for Telegram Premium users only @tag The tag which label will...
class TdSetSavedMessagesTagLabel extends TdObject {
  final TdReactionType? tag;
  final String label;

  TdSetSavedMessagesTagLabel({
    this.tag,
    required this.label,
  });

  @override
  String get tdType => 'setSavedMessagesTagLabel';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setSavedMessagesTagLabel',
      'tag': tag?.toMap(),
      'label': label,
    };
  }
}


/// Changes notification settings for chats of a given type @scope Types of chats for which to change th...
class TdSetScopeNotificationSettings extends TdObject {
  final TdNotificationSettingsScope? scope;
  final TdScopeNotificationSettings? notificationSettings;

  TdSetScopeNotificationSettings({
    this.scope,
    this.notificationSettings,
  });

  @override
  String get tdType => 'setScopeNotificationSettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setScopeNotificationSettings',
      'scope': scope?.toMap(),
      'notification_settings': notificationSettings?.toMap(),
    };
  }
}


/// Changes the list of emojis corresponding to a sticker. The sticker must belong to a regular or custo...
class TdSetStickerEmojis extends TdObject {
  final TdInputFile? sticker;
  final String emojis;

  TdSetStickerEmojis({
    this.sticker,
    required this.emojis,
  });

  @override
  String get tdType => 'setStickerEmojis';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setStickerEmojis',
      'sticker': sticker?.toMap(),
      'emojis': emojis,
    };
  }
}


/// Changes the list of keywords of a sticker. The sticker must belong to a regular or custom emoji stic...
class TdSetStickerKeywords extends TdObject {
  final TdInputFile? sticker;
  final List<String> keywords;

  TdSetStickerKeywords({
    this.sticker,
    required this.keywords,
  });

  @override
  String get tdType => 'setStickerKeywords';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setStickerKeywords',
      'sticker': sticker?.toMap(),
      'keywords': keywords,
    };
  }
}


/// Changes the mask position of a mask sticker. The sticker must belong to a mask sticker set that is o...
class TdSetStickerMaskPosition extends TdObject {
  final TdInputFile? sticker;
  final TdMaskPosition? maskPosition;

  TdSetStickerMaskPosition({
    this.sticker,
    this.maskPosition,
  });

  @override
  String get tdType => 'setStickerMaskPosition';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setStickerMaskPosition',
      'sticker': sticker?.toMap(),
      'mask_position': maskPosition?.toMap(),
    };
  }
}


/// Changes the position of a sticker in the set to which it belongs. The sticker set must be owned by t...
class TdSetStickerPositionInSet extends TdObject {
  final TdInputFile? sticker;
  final int position;

  TdSetStickerPositionInSet({
    this.sticker,
    required this.position,
  });

  @override
  String get tdType => 'setStickerPositionInSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setStickerPositionInSet',
      'sticker': sticker?.toMap(),
      'position': position,
    };
  }
}


/// Sets a sticker set thumbnail
class TdSetStickerSetThumbnail extends TdObject {
  final int userId;
  final String name;
  final TdInputFile? thumbnail;
  final TdStickerFormat? format;

  TdSetStickerSetThumbnail({
    required this.userId,
    required this.name,
    this.thumbnail,
    this.format,
  });

  @override
  String get tdType => 'setStickerSetThumbnail';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setStickerSetThumbnail',
      'user_id': userId,
      'name': name,
      'thumbnail': thumbnail?.toMap(),
      'format': format?.toMap(),
    };
  }
}


/// Sets a sticker set title @name Sticker set name. The sticker set must be owned by the current user @...
class TdSetStickerSetTitle extends TdObject {
  final String name;
  final String title;

  TdSetStickerSetTitle({
    required this.name,
    required this.title,
  });

  @override
  String get tdType => 'setStickerSetTitle';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setStickerSetTitle',
      'name': name,
      'title': title,
    };
  }
}


/// Changes name of an album of stories. If the album is owned by a supergroup or a channel chat, then r...
class TdSetStoryAlbumName extends TdObject {
  final int chatId;
  final int storyAlbumId;
  final String name;

  TdSetStoryAlbumName({
    required this.chatId,
    required this.storyAlbumId,
    required this.name,
  });

  @override
  String get tdType => 'setStoryAlbumName';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setStoryAlbumName',
      'chat_id': chatId,
      'story_album_id': storyAlbumId,
      'name': name,
    };
  }
}


/// Changes privacy settings of a story. The method can be called only for stories posted on behalf of t...
class TdSetStoryPrivacySettings extends TdObject {
  final int storyId;
  final TdStoryPrivacySettings? privacySettings;

  TdSetStoryPrivacySettings({
    required this.storyId,
    this.privacySettings,
  });

  @override
  String get tdType => 'setStoryPrivacySettings';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setStoryPrivacySettings',
      'story_id': storyId,
      'privacy_settings': privacySettings?.toMap(),
    };
  }
}


/// Changes chosen reaction on a story that has already been sent; not supported for live stories
class TdSetStoryReaction extends TdObject {
  final int storyPosterChatId;
  final int storyId;
  final TdReactionType? reactionType;
  final bool updateRecentReactions;

  TdSetStoryReaction({
    required this.storyPosterChatId,
    required this.storyId,
    this.reactionType,
    required this.updateRecentReactions,
  });

  @override
  String get tdType => 'setStoryReaction';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setStoryReaction',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
      'reaction_type': reactionType?.toMap(),
      'update_recent_reactions': updateRecentReactions,
    };
  }
}


/// Changes the custom emoji sticker set of a supergroup; requires can_change_info administrator right. ...
class TdSetSupergroupCustomEmojiStickerSet extends TdObject {
  final int supergroupId;
  final int customEmojiStickerSetId;

  TdSetSupergroupCustomEmojiStickerSet({
    required this.supergroupId,
    required this.customEmojiStickerSetId,
  });

  @override
  String get tdType => 'setSupergroupCustomEmojiStickerSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setSupergroupCustomEmojiStickerSet',
      'supergroup_id': supergroupId,
      'custom_emoji_sticker_set_id': customEmojiStickerSetId,
    };
  }
}


/// Changes the main profile tab of the channel; requires can_change_info administrator right
class TdSetSupergroupMainProfileTab extends TdObject {
  final int supergroupId;
  final TdProfileTab? mainProfileTab;

  TdSetSupergroupMainProfileTab({
    required this.supergroupId,
    this.mainProfileTab,
  });

  @override
  String get tdType => 'setSupergroupMainProfileTab';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setSupergroupMainProfileTab',
      'supergroup_id': supergroupId,
      'main_profile_tab': mainProfileTab?.toMap(),
    };
  }
}


/// Changes the sticker set of a supergroup; requires can_change_info administrator right @supergroup_id...
class TdSetSupergroupStickerSet extends TdObject {
  final int supergroupId;
  final int stickerSetId;

  TdSetSupergroupStickerSet({
    required this.supergroupId,
    required this.stickerSetId,
  });

  @override
  String get tdType => 'setSupergroupStickerSet';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setSupergroupStickerSet',
      'supergroup_id': supergroupId,
      'sticker_set_id': stickerSetId,
    };
  }
}


/// Changes the number of times the supergroup must be boosted by a user to ignore slow mode and chat pe...
class TdSetSupergroupUnrestrictBoostCount extends TdObject {
  final int supergroupId;
  final int unrestrictBoostCount;

  TdSetSupergroupUnrestrictBoostCount({
    required this.supergroupId,
    required this.unrestrictBoostCount,
  });

  @override
  String get tdType => 'setSupergroupUnrestrictBoostCount';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setSupergroupUnrestrictBoostCount',
      'supergroup_id': supergroupId,
      'unrestrict_boost_count': unrestrictBoostCount,
    };
  }
}


/// Changes the editable username of a supergroup or channel, requires owner privileges in the supergrou...
class TdSetSupergroupUsername extends TdObject {
  final int supergroupId;
  final String username;

  TdSetSupergroupUsername({
    required this.supergroupId,
    required this.username,
  });

  @override
  String get tdType => 'setSupergroupUsername';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setSupergroupUsername',
      'supergroup_id': supergroupId,
      'username': username,
    };
  }
}


/// Sets the parameters for TDLib initialization. Works only when the current authorization state is aut...
class TdSetTdlibParameters extends TdObject {
  final bool useTestDc;
  final String databaseDirectory;
  final String filesDirectory;
  final String databaseEncryptionKey;
  final bool useFileDatabase;
  final bool useChatInfoDatabase;
  final bool useMessageDatabase;
  final bool useSecretChats;
  final int apiId;
  final String apiHash;
  final String systemLanguageCode;
  final String deviceModel;
  final String systemVersion;
  final String applicationVersion;

  TdSetTdlibParameters({
    required this.useTestDc,
    required this.databaseDirectory,
    required this.filesDirectory,
    required this.databaseEncryptionKey,
    required this.useFileDatabase,
    required this.useChatInfoDatabase,
    required this.useMessageDatabase,
    required this.useSecretChats,
    required this.apiId,
    required this.apiHash,
    required this.systemLanguageCode,
    required this.deviceModel,
    required this.systemVersion,
    required this.applicationVersion,
  });

  @override
  String get tdType => 'setTdlibParameters';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setTdlibParameters',
      'use_test_dc': useTestDc,
      'database_directory': databaseDirectory,
      'files_directory': filesDirectory,
      'database_encryption_key': databaseEncryptionKey,
      'use_file_database': useFileDatabase,
      'use_chat_info_database': useChatInfoDatabase,
      'use_message_database': useMessageDatabase,
      'use_secret_chats': useSecretChats,
      'api_id': apiId,
      'api_hash': apiHash,
      'system_language_code': systemLanguageCode,
      'device_model': deviceModel,
      'system_version': systemVersion,
      'application_version': applicationVersion,
    };
  }
}


/// Changes color scheme for the current user based on an owned or a hosted upgraded gift; for Telegram ...
class TdSetUpgradedGiftColors extends TdObject {
  final int upgradedGiftColorsId;

  TdSetUpgradedGiftColors({
    required this.upgradedGiftColorsId,
  });

  @override
  String get tdType => 'setUpgradedGiftColors';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setUpgradedGiftColors',
      'upgraded_gift_colors_id': upgradedGiftColorsId,
    };
  }
}


/// Changes the emoji status of a user; for bots only @user_id Identifier of the user @emoji_status New ...
class TdSetUserEmojiStatus extends TdObject {
  final int userId;
  final TdEmojiStatus? emojiStatus;

  TdSetUserEmojiStatus({
    required this.userId,
    this.emojiStatus,
  });

  @override
  String get tdType => 'setUserEmojiStatus';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setUserEmojiStatus',
      'user_id': userId,
      'emoji_status': emojiStatus?.toMap(),
    };
  }
}


/// Changes a note of a contact user
class TdSetUserNote extends TdObject {
  final int userId;
  final TdFormattedText? note;

  TdSetUserNote({
    required this.userId,
    this.note,
  });

  @override
  String get tdType => 'setUserNote';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setUserNote',
      'user_id': userId,
      'note': note?.toMap(),
    };
  }
}


/// Changes a personal profile photo of a contact user @user_id User identifier @photo Profile photo to ...
class TdSetUserPersonalProfilePhoto extends TdObject {
  final int userId;
  final TdInputChatPhoto? photo;

  TdSetUserPersonalProfilePhoto({
    required this.userId,
    this.photo,
  });

  @override
  String get tdType => 'setUserPersonalProfilePhoto';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setUserPersonalProfilePhoto',
      'user_id': userId,
      'photo': photo?.toMap(),
    };
  }
}


/// Changes user privacy settings @setting The privacy setting @rules The new privacy rules
class TdSetUserPrivacySettingRules extends TdObject {
  final TdUserPrivacySetting? setting;
  final TdUserPrivacySettingRules? rules;

  TdSetUserPrivacySettingRules({
    this.setting,
    this.rules,
  });

  @override
  String get tdType => 'setUserPrivacySettingRules';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setUserPrivacySettingRules',
      'setting': setting?.toMap(),
      'rules': rules?.toMap(),
    };
  }
}


/// Sets support information for the given user; for Telegram support only @user_id User identifier @mes...
class TdSetUserSupportInfo extends TdObject {
  final int userId;
  final TdFormattedText? message;

  TdSetUserSupportInfo({
    required this.userId,
    this.message,
  });

  @override
  String get tdType => 'setUserSupportInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setUserSupportInfo',
      'user_id': userId,
      'message': message?.toMap(),
    };
  }
}


/// Changes the editable username of the current user
class TdSetUsername extends TdObject {
  final String username;

  TdSetUsername({
    required this.username,
  });

  @override
  String get tdType => 'setUsername';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setUsername',
      'username': username,
    };
  }
}


/// Changes default participant identifier, on whose behalf a video chat in the chat will be joined
class TdSetVideoChatDefaultParticipant extends TdObject {
  final int chatId;
  final TdMessageSender? defaultParticipantId;

  TdSetVideoChatDefaultParticipant({
    required this.chatId,
    this.defaultParticipantId,
  });

  @override
  String get tdType => 'setVideoChatDefaultParticipant';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setVideoChatDefaultParticipant',
      'chat_id': chatId,
      'default_participant_id': defaultParticipantId?.toMap(),
    };
  }
}


/// Sets title of a video chat; requires groupCall.can_be_managed right @group_call_id Group call identi...
class TdSetVideoChatTitle extends TdObject {
  final int groupCallId;
  final String title;

  TdSetVideoChatTitle({
    required this.groupCallId,
    required this.title,
  });

  @override
  String get tdType => 'setVideoChatTitle';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'setVideoChatTitle',
      'group_call_id': groupCallId,
      'title': title,
    };
  }
}


/// Shares a chat after pressing a keyboardButtonTypeRequestChat button with the bot If the bot must be ...
class TdShareChatWithBot extends TdObject {
  final int chatId;
  final int messageId;
  final int buttonId;
  final int sharedChatId;
  final bool onlyCheck;

  TdShareChatWithBot({
    required this.chatId,
    required this.messageId,
    required this.buttonId,
    required this.sharedChatId,
    required this.onlyCheck,
  });

  @override
  String get tdType => 'shareChatWithBot';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'shareChatWithBot',
      'chat_id': chatId,
      'message_id': messageId,
      'button_id': buttonId,
      'shared_chat_id': sharedChatId,
      'only_check': onlyCheck,
    };
  }
}


/// Shares the phone number of the current user with a mutual contact. Supposed to be called when the us...
class TdSharePhoneNumber extends TdObject {
  final int userId;

  TdSharePhoneNumber({
    required this.userId,
  });

  @override
  String get tdType => 'sharePhoneNumber';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'sharePhoneNumber',
      'user_id': userId,
    };
  }
}


/// Shares users after pressing a keyboardButtonTypeRequestUsers button with the bot
class TdShareUsersWithBot extends TdObject {
  final int chatId;
  final int messageId;
  final int buttonId;
  final List<int> sharedUserIds;
  final bool onlyCheck;

  TdShareUsersWithBot({
    required this.chatId,
    required this.messageId,
    required this.buttonId,
    required this.sharedUserIds,
    required this.onlyCheck,
  });

  @override
  String get tdType => 'shareUsersWithBot';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'shareUsersWithBot',
      'chat_id': chatId,
      'message_id': messageId,
      'button_id': buttonId,
      'shared_user_ids': sharedUserIds,
      'only_check': onlyCheck,
    };
  }
}


/// Starts recording of an active group call; for video chats only. Requires groupCall.can_be_managed ri...
class TdStartGroupCallRecording extends TdObject {
  final int groupCallId;
  final String title;
  final bool recordVideo;
  final bool usePortraitOrientation;

  TdStartGroupCallRecording({
    required this.groupCallId,
    required this.title,
    required this.recordVideo,
    required this.usePortraitOrientation,
  });

  @override
  String get tdType => 'startGroupCallRecording';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'startGroupCallRecording',
      'group_call_id': groupCallId,
      'title': title,
      'record_video': recordVideo,
      'use_portrait_orientation': usePortraitOrientation,
    };
  }
}


/// Starts screen sharing in a joined group call; not supported in live stories. Returns join response p...
class TdStartGroupCallScreenSharing extends TdObject {
  final int groupCallId;
  final int audioSourceId;
  final String payload;

  TdStartGroupCallScreenSharing({
    required this.groupCallId,
    required this.audioSourceId,
    required this.payload,
  });

  @override
  String get tdType => 'startGroupCallScreenSharing';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'startGroupCallScreenSharing',
      'group_call_id': groupCallId,
      'audio_source_id': audioSourceId,
      'payload': payload,
    };
  }
}


/// Starts a new live story on behalf of a chat; requires can_post_stories administrator right for chann...
class TdStartLiveStory extends TdObject {
  final int chatId;
  final TdStoryPrivacySettings? privacySettings;
  final bool protectContent;
  final bool isRtmpStream;
  final bool enableMessages;
  final int paidMessageStarCount;

  TdStartLiveStory({
    required this.chatId,
    this.privacySettings,
    required this.protectContent,
    required this.isRtmpStream,
    required this.enableMessages,
    required this.paidMessageStarCount,
  });

  @override
  String get tdType => 'startLiveStory';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'startLiveStory',
      'chat_id': chatId,
      'privacy_settings': privacySettings?.toMap(),
      'protect_content': protectContent,
      'is_rtmp_stream': isRtmpStream,
      'enable_messages': enableMessages,
      'paid_message_star_count': paidMessageStarCount,
    };
  }
}


/// Starts a scheduled video chat @group_call_id Group call identifier of the video chat
class TdStartScheduledVideoChat extends TdObject {
  final int groupCallId;

  TdStartScheduledVideoChat({
    required this.groupCallId,
  });

  @override
  String get tdType => 'startScheduledVideoChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'startScheduledVideoChat',
      'group_call_id': groupCallId,
    };
  }
}


/// Stops a poll sent on behalf of a business account; for bots only
class TdStopBusinessPoll extends TdObject {
  final String businessConnectionId;
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;

  TdStopBusinessPoll({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
  });

  @override
  String get tdType => 'stopBusinessPoll';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'stopBusinessPoll',
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
    };
  }
}


/// Stops a poll
class TdStopPoll extends TdObject {
  final int chatId;
  final int messageId;
  final TdReplyMarkup? replyMarkup;

  TdStopPoll({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
  });

  @override
  String get tdType => 'stopPoll';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'stopPoll',
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup?.toMap(),
    };
  }
}


/// Suggests a birthdate to another regular user with common messages and allowing non-paid messages
class TdSuggestUserBirthdate extends TdObject {
  final int userId;
  final TdBirthdate? birthdate;

  TdSuggestUserBirthdate({
    required this.userId,
    this.birthdate,
  });

  @override
  String get tdType => 'suggestUserBirthdate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'suggestUserBirthdate',
      'user_id': userId,
      'birthdate': birthdate?.toMap(),
    };
  }
}


/// Suggests a profile photo to another regular user with common messages and allowing non-paid messages
class TdSuggestUserProfilePhoto extends TdObject {
  final int userId;
  final TdInputChatPhoto? photo;

  TdSuggestUserProfilePhoto({
    required this.userId,
    this.photo,
  });

  @override
  String get tdType => 'suggestUserProfilePhoto';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'suggestUserProfilePhoto',
      'user_id': userId,
      'photo': photo?.toMap(),
    };
  }
}


/// Fetches the latest versions of all strings from a language pack in the current localization target f...
class TdSynchronizeLanguagePack extends TdObject {
  final String languagePackId;

  TdSynchronizeLanguagePack({
    required this.languagePackId,
  });

  @override
  String get tdType => 'synchronizeLanguagePack';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'synchronizeLanguagePack',
      'language_pack_id': languagePackId,
    };
  }
}


/// Terminates all other sessions of the current user
class TdTerminateAllOtherSessions extends TdObject {
  TdTerminateAllOtherSessions();

  @override
  String get tdType => 'terminateAllOtherSessions';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'terminateAllOtherSessions',
    };
  }
}


/// Terminates a session of the current user @session_id Session identifier
class TdTerminateSession extends TdObject {
  final int sessionId;

  TdTerminateSession({
    required this.sessionId,
  });

  @override
  String get tdType => 'terminateSession';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'terminateSession',
      'session_id': sessionId,
    };
  }
}


/// Returns the received bytes; for testing only. This is an offline method. Can be called before author...
class TdTestCallBytes extends TdObject {
  final String x;

  TdTestCallBytes({
    required this.x,
  });

  @override
  String get tdType => 'testCallBytes';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testCallBytes',
      'x': x,
    };
  }
}


/// Does nothing; for testing only. This is an offline method. Can be called before authorization
class TdTestCallEmpty extends TdObject {
  TdTestCallEmpty();

  @override
  String get tdType => 'testCallEmpty';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testCallEmpty',
    };
  }
}


/// Returns the received string; for testing only. This is an offline method. Can be called before autho...
class TdTestCallString extends TdObject {
  final String x;

  TdTestCallString({
    required this.x,
  });

  @override
  String get tdType => 'testCallString';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testCallString',
      'x': x,
    };
  }
}


/// Returns the received vector of numbers; for testing only. This is an offline method. Can be called b...
class TdTestCallVectorInt extends TdObject {
  final List<int> x;

  TdTestCallVectorInt({
    required this.x,
  });

  @override
  String get tdType => 'testCallVectorInt';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testCallVectorInt',
      'x': x,
    };
  }
}


/// Returns the received vector of objects containing a number; for testing only. This is an offline met...
class TdTestCallVectorIntObject extends TdObject {
  final List<TdTestInt> x;

  TdTestCallVectorIntObject({
    required this.x,
  });

  @override
  String get tdType => 'testCallVectorIntObject';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testCallVectorIntObject',
      'x': x.map((e) => e.toMap()).toList(),
    };
  }
}


/// Returns the received vector of strings; for testing only. This is an offline method. Can be called b...
class TdTestCallVectorString extends TdObject {
  final List<String> x;

  TdTestCallVectorString({
    required this.x,
  });

  @override
  String get tdType => 'testCallVectorString';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testCallVectorString',
      'x': x,
    };
  }
}


/// Returns the received vector of objects containing a string; for testing only. This is an offline met...
class TdTestCallVectorStringObject extends TdObject {
  final List<TdTestString> x;

  TdTestCallVectorStringObject({
    required this.x,
  });

  @override
  String get tdType => 'testCallVectorStringObject';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testCallVectorStringObject',
      'x': x.map((e) => e.toMap()).toList(),
    };
  }
}


/// Forces an updates.getDifference call to the Telegram servers; for testing only
class TdTestGetDifference extends TdObject {
  TdTestGetDifference();

  @override
  String get tdType => 'testGetDifference';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testGetDifference',
    };
  }
}


/// Sends a simple network request to the Telegram servers; for testing only. Can be called before autho...
class TdTestNetwork extends TdObject {
  TdTestNetwork();

  @override
  String get tdType => 'testNetwork';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testNetwork',
    };
  }
}


/// Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called be...
class TdTestProxy extends TdObject {
  final String server;
  final int port;
  final TdProxyType? type;
  final int dcId;
  final double timeout;

  TdTestProxy({
    required this.server,
    required this.port,
    this.type,
    required this.dcId,
    required this.timeout,
  });

  @override
  String get tdType => 'testProxy';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testProxy',
      'server': server,
      'port': port,
      'type': type?.toMap(),
      'dc_id': dcId,
      'timeout': timeout,
    };
  }
}


/// Returns the specified error and ensures that the Error object is used; for testing only. Can be call...
class TdTestReturnError extends TdObject {
  final TdError? error;

  TdTestReturnError({
    this.error,
  });

  @override
  String get tdType => 'testReturnError';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testReturnError',
      'error': error?.toMap(),
    };
  }
}


/// Returns the squared received number; for testing only. This is an offline method. Can be called befo...
class TdTestSquareInt extends TdObject {
  final int x;

  TdTestSquareInt({
    required this.x,
  });

  @override
  String get tdType => 'testSquareInt';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testSquareInt',
      'x': x,
    };
  }
}


/// Does nothing and ensures that the Update object is used; for testing only. This is an offline method...
class TdTestUseUpdate extends TdObject {
  TdTestUseUpdate();

  @override
  String get tdType => 'testUseUpdate';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'testUseUpdate',
    };
  }
}


/// Changes pause state of all files in the file download list @are_paused Pass true to pause all downlo...
class TdToggleAllDownloadsArePaused extends TdObject {
  final bool arePaused;

  TdToggleAllDownloadsArePaused({
    required this.arePaused,
  });

  @override
  String get tdType => 'toggleAllDownloadsArePaused';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleAllDownloadsArePaused',
      'are_paused': arePaused,
    };
  }
}


/// Toggles whether the bot can manage emoji status of the current user @bot_user_id User identifier of ...
class TdToggleBotCanManageEmojiStatus extends TdObject {
  final int botUserId;
  final bool canManageEmojiStatus;

  TdToggleBotCanManageEmojiStatus({
    required this.botUserId,
    required this.canManageEmojiStatus,
  });

  @override
  String get tdType => 'toggleBotCanManageEmojiStatus';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleBotCanManageEmojiStatus',
      'bot_user_id': botUserId,
      'can_manage_emoji_status': canManageEmojiStatus,
    };
  }
}


/// Adds or removes a bot to attachment and side menu. Bot can be added to the menu, only if userTypeBot...
class TdToggleBotIsAddedToAttachmentMenu extends TdObject {
  final int botUserId;
  final bool isAdded;
  final bool allowWriteAccess;

  TdToggleBotIsAddedToAttachmentMenu({
    required this.botUserId,
    required this.isAdded,
    required this.allowWriteAccess,
  });

  @override
  String get tdType => 'toggleBotIsAddedToAttachmentMenu';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleBotIsAddedToAttachmentMenu',
      'bot_user_id': botUserId,
      'is_added': isAdded,
      'allow_write_access': allowWriteAccess,
    };
  }
}


/// Changes active state for a username of a bot. The editable username can be disabled only if there ar...
class TdToggleBotUsernameIsActive extends TdObject {
  final int botUserId;
  final String username;
  final bool isActive;

  TdToggleBotUsernameIsActive({
    required this.botUserId,
    required this.username,
    required this.isActive,
  });

  @override
  String get tdType => 'toggleBotUsernameIsActive';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleBotUsernameIsActive',
      'bot_user_id': botUserId,
      'username': username,
      'is_active': isActive,
    };
  }
}


/// Pauses or resumes the connected business bot in a specific chat @chat_id Chat identifier @is_paused ...
class TdToggleBusinessConnectedBotChatIsPaused extends TdObject {
  final int chatId;
  final bool isPaused;

  TdToggleBusinessConnectedBotChatIsPaused({
    required this.chatId,
    required this.isPaused,
  });

  @override
  String get tdType => 'toggleBusinessConnectedBotChatIsPaused';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleBusinessConnectedBotChatIsPaused',
      'chat_id': chatId,
      'is_paused': isPaused,
    };
  }
}


/// Changes the value of the default disable_notification parameter, used when a message is sent to a ch...
class TdToggleChatDefaultDisableNotification extends TdObject {
  final int chatId;
  final bool defaultDisableNotification;

  TdToggleChatDefaultDisableNotification({
    required this.chatId,
    required this.defaultDisableNotification,
  });

  @override
  String get tdType => 'toggleChatDefaultDisableNotification';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleChatDefaultDisableNotification',
      'chat_id': chatId,
      'default_disable_notification': defaultDisableNotification,
    };
  }
}


/// Toggles whether chat folder tags are enabled @are_tags_enabled Pass true to enable folder tags; pass...
class TdToggleChatFolderTags extends TdObject {
  final bool areTagsEnabled;

  TdToggleChatFolderTags({
    required this.areTagsEnabled,
  });

  @override
  String get tdType => 'toggleChatFolderTags';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleChatFolderTags',
      'are_tags_enabled': areTagsEnabled,
    };
  }
}


/// Toggles whether notifications for new gifts received by a channel chat are sent to the current user;...
class TdToggleChatGiftNotifications extends TdObject {
  final int chatId;
  final bool areEnabled;

  TdToggleChatGiftNotifications({
    required this.chatId,
    required this.areEnabled,
  });

  @override
  String get tdType => 'toggleChatGiftNotifications';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleChatGiftNotifications',
      'chat_id': chatId,
      'are_enabled': areEnabled,
    };
  }
}


/// Changes the ability of users to save, forward, or copy chat content. Supported only for basic groups...
class TdToggleChatHasProtectedContent extends TdObject {
  final int chatId;
  final bool hasProtectedContent;

  TdToggleChatHasProtectedContent({
    required this.chatId,
    required this.hasProtectedContent,
  });

  @override
  String get tdType => 'toggleChatHasProtectedContent';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleChatHasProtectedContent',
      'chat_id': chatId,
      'has_protected_content': hasProtectedContent,
    };
  }
}


/// Changes the marked as unread state of a chat @chat_id Chat identifier @is_marked_as_unread New value...
class TdToggleChatIsMarkedAsUnread extends TdObject {
  final int chatId;
  final bool isMarkedAsUnread;

  TdToggleChatIsMarkedAsUnread({
    required this.chatId,
    required this.isMarkedAsUnread,
  });

  @override
  String get tdType => 'toggleChatIsMarkedAsUnread';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleChatIsMarkedAsUnread',
      'chat_id': chatId,
      'is_marked_as_unread': isMarkedAsUnread,
    };
  }
}


/// Changes the pinned state of a chat. There can be up to getOption("pinned_chat_count_max")/getOption(...
class TdToggleChatIsPinned extends TdObject {
  final TdChatList? chatList;
  final int chatId;
  final bool isPinned;

  TdToggleChatIsPinned({
    this.chatList,
    required this.chatId,
    required this.isPinned,
  });

  @override
  String get tdType => 'toggleChatIsPinned';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleChatIsPinned',
      'chat_list': chatList?.toMap(),
      'chat_id': chatId,
      'is_pinned': isPinned,
    };
  }
}


/// Changes the translatable state of a chat @chat_id Chat identifier @is_translatable New value of is_t...
class TdToggleChatIsTranslatable extends TdObject {
  final int chatId;
  final bool isTranslatable;

  TdToggleChatIsTranslatable({
    required this.chatId,
    required this.isTranslatable,
  });

  @override
  String get tdType => 'toggleChatIsTranslatable';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleChatIsTranslatable',
      'chat_id': chatId,
      'is_translatable': isTranslatable,
    };
  }
}


/// Changes the view_as_topics setting of a forum chat or Saved Messages @chat_id Chat identifier @view_...
class TdToggleChatViewAsTopics extends TdObject {
  final int chatId;
  final bool viewAsTopics;

  TdToggleChatViewAsTopics({
    required this.chatId,
    required this.viewAsTopics,
  });

  @override
  String get tdType => 'toggleChatViewAsTopics';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleChatViewAsTopics',
      'chat_id': chatId,
      'view_as_topics': viewAsTopics,
    };
  }
}


/// Allows to send unpaid messages to the given topic of the channel direct messages chat administered b...
class TdToggleDirectMessagesChatTopicCanSendUnpaidMessages extends TdObject {
  final int chatId;
  final int topicId;
  final bool canSendUnpaidMessages;
  final bool refundPayments;

  TdToggleDirectMessagesChatTopicCanSendUnpaidMessages({
    required this.chatId,
    required this.topicId,
    required this.canSendUnpaidMessages,
    required this.refundPayments,
  });

  @override
  String get tdType => 'toggleDirectMessagesChatTopicCanSendUnpaidMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleDirectMessagesChatTopicCanSendUnpaidMessages',
      'chat_id': chatId,
      'topic_id': topicId,
      'can_send_unpaid_messages': canSendUnpaidMessages,
      'refund_payments': refundPayments,
    };
  }
}


/// Changes pause state of a file in the file download list
class TdToggleDownloadIsPaused extends TdObject {
  final int fileId;
  final bool isPaused;

  TdToggleDownloadIsPaused({
    required this.fileId,
    required this.isPaused,
  });

  @override
  String get tdType => 'toggleDownloadIsPaused';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleDownloadIsPaused',
      'file_id': fileId,
      'is_paused': isPaused,
    };
  }
}


/// Toggles whether a topic is closed in a forum supergroup chat; requires can_manage_topics administrat...
class TdToggleForumTopicIsClosed extends TdObject {
  final int chatId;
  final int forumTopicId;
  final bool isClosed;

  TdToggleForumTopicIsClosed({
    required this.chatId,
    required this.forumTopicId,
    required this.isClosed,
  });

  @override
  String get tdType => 'toggleForumTopicIsClosed';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleForumTopicIsClosed',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
      'is_closed': isClosed,
    };
  }
}


/// Changes the pinned state of a topic in a forum supergroup chat or a chat with a bot with topics; req...
class TdToggleForumTopicIsPinned extends TdObject {
  final int chatId;
  final int forumTopicId;
  final bool isPinned;

  TdToggleForumTopicIsPinned({
    required this.chatId,
    required this.forumTopicId,
    required this.isPinned,
  });

  @override
  String get tdType => 'toggleForumTopicIsPinned';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleForumTopicIsPinned',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
      'is_pinned': isPinned,
    };
  }
}


/// Toggles whether a General topic is hidden in a forum supergroup chat; requires can_manage_topics adm...
class TdToggleGeneralForumTopicIsHidden extends TdObject {
  final int chatId;
  final bool isHidden;

  TdToggleGeneralForumTopicIsHidden({
    required this.chatId,
    required this.isHidden,
  });

  @override
  String get tdType => 'toggleGeneralForumTopicIsHidden';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleGeneralForumTopicIsHidden',
      'chat_id': chatId,
      'is_hidden': isHidden,
    };
  }
}


/// Toggles whether a gift is shown on the current user\'s or the channel\'s profile page; requires can_po...
class TdToggleGiftIsSaved extends TdObject {
  final String receivedGiftId;
  final bool isSaved;

  TdToggleGiftIsSaved({
    required this.receivedGiftId,
    required this.isSaved,
  });

  @override
  String get tdType => 'toggleGiftIsSaved';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleGiftIsSaved',
      'received_gift_id': receivedGiftId,
      'is_saved': isSaved,
    };
  }
}


/// Toggles whether participants of a group call can send messages there. Requires groupCall.can_toggle_...
class TdToggleGroupCallAreMessagesAllowed extends TdObject {
  final int groupCallId;
  final bool areMessagesAllowed;

  TdToggleGroupCallAreMessagesAllowed({
    required this.groupCallId,
    required this.areMessagesAllowed,
  });

  @override
  String get tdType => 'toggleGroupCallAreMessagesAllowed';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleGroupCallAreMessagesAllowed',
      'group_call_id': groupCallId,
      'are_messages_allowed': areMessagesAllowed,
    };
  }
}


/// Toggles whether current user\'s video is enabled @group_call_id Group call identifier @is_my_video_en...
class TdToggleGroupCallIsMyVideoEnabled extends TdObject {
  final int groupCallId;
  final bool isMyVideoEnabled;

  TdToggleGroupCallIsMyVideoEnabled({
    required this.groupCallId,
    required this.isMyVideoEnabled,
  });

  @override
  String get tdType => 'toggleGroupCallIsMyVideoEnabled';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleGroupCallIsMyVideoEnabled',
      'group_call_id': groupCallId,
      'is_my_video_enabled': isMyVideoEnabled,
    };
  }
}


/// Toggles whether current user\'s video is paused @group_call_id Group call identifier @is_my_video_pau...
class TdToggleGroupCallIsMyVideoPaused extends TdObject {
  final int groupCallId;
  final bool isMyVideoPaused;

  TdToggleGroupCallIsMyVideoPaused({
    required this.groupCallId,
    required this.isMyVideoPaused,
  });

  @override
  String get tdType => 'toggleGroupCallIsMyVideoPaused';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleGroupCallIsMyVideoPaused',
      'group_call_id': groupCallId,
      'is_my_video_paused': isMyVideoPaused,
    };
  }
}


/// Toggles whether a group call participant hand is rased; for video chats only
class TdToggleGroupCallParticipantIsHandRaised extends TdObject {
  final int groupCallId;
  final TdMessageSender? participantId;
  final bool isHandRaised;

  TdToggleGroupCallParticipantIsHandRaised({
    required this.groupCallId,
    this.participantId,
    required this.isHandRaised,
  });

  @override
  String get tdType => 'toggleGroupCallParticipantIsHandRaised';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleGroupCallParticipantIsHandRaised',
      'group_call_id': groupCallId,
      'participant_id': participantId?.toMap(),
      'is_hand_raised': isHandRaised,
    };
  }
}


/// Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themse...
class TdToggleGroupCallParticipantIsMuted extends TdObject {
  final int groupCallId;
  final TdMessageSender? participantId;
  final bool isMuted;

  TdToggleGroupCallParticipantIsMuted({
    required this.groupCallId,
    this.participantId,
    required this.isMuted,
  });

  @override
  String get tdType => 'toggleGroupCallParticipantIsMuted';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleGroupCallParticipantIsMuted',
      'group_call_id': groupCallId,
      'participant_id': participantId?.toMap(),
      'is_muted': isMuted,
    };
  }
}


/// Pauses or unpauses screen sharing in a joined group call; not supported in live stories @group_call_...
class TdToggleGroupCallScreenSharingIsPaused extends TdObject {
  final int groupCallId;
  final bool isPaused;

  TdToggleGroupCallScreenSharingIsPaused({
    required this.groupCallId,
    required this.isPaused,
  });

  @override
  String get tdType => 'toggleGroupCallScreenSharingIsPaused';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleGroupCallScreenSharingIsPaused',
      'group_call_id': groupCallId,
      'is_paused': isPaused,
    };
  }
}


/// Toggles whether the current user has sponsored messages enabled. The setting has no effect for users...
class TdToggleHasSponsoredMessagesEnabled extends TdObject {
  final bool hasSponsoredMessagesEnabled;

  TdToggleHasSponsoredMessagesEnabled({
    required this.hasSponsoredMessagesEnabled,
  });

  @override
  String get tdType => 'toggleHasSponsoredMessagesEnabled';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleHasSponsoredMessagesEnabled',
      'has_sponsored_messages_enabled': hasSponsoredMessagesEnabled,
    };
  }
}


/// Changes the pinned state of a Saved Messages topic. There can be up to getOption("pinned_saved_messa...
class TdToggleSavedMessagesTopicIsPinned extends TdObject {
  final int savedMessagesTopicId;
  final bool isPinned;

  TdToggleSavedMessagesTopicIsPinned({
    required this.savedMessagesTopicId,
    required this.isPinned,
  });

  @override
  String get tdType => 'toggleSavedMessagesTopicIsPinned';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSavedMessagesTopicIsPinned',
      'saved_messages_topic_id': savedMessagesTopicId,
      'is_pinned': isPinned,
    };
  }
}


/// Toggles whether a session can accept incoming calls @session_id Session identifier @can_accept_calls...
class TdToggleSessionCanAcceptCalls extends TdObject {
  final int sessionId;
  final bool canAcceptCalls;

  TdToggleSessionCanAcceptCalls({
    required this.sessionId,
    required this.canAcceptCalls,
  });

  @override
  String get tdType => 'toggleSessionCanAcceptCalls';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSessionCanAcceptCalls',
      'session_id': sessionId,
      'can_accept_calls': canAcceptCalls,
    };
  }
}


/// Toggles whether a session can accept incoming secret chats @session_id Session identifier @can_accep...
class TdToggleSessionCanAcceptSecretChats extends TdObject {
  final int sessionId;
  final bool canAcceptSecretChats;

  TdToggleSessionCanAcceptSecretChats({
    required this.sessionId,
    required this.canAcceptSecretChats,
  });

  @override
  String get tdType => 'toggleSessionCanAcceptSecretChats';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSessionCanAcceptSecretChats',
      'session_id': sessionId,
      'can_accept_secret_chats': canAcceptSecretChats,
    };
  }
}


/// Toggles whether a story is accessible after expiration. Can be called only if story.can_toggle_is_po...
class TdToggleStoryIsPostedToChatPage extends TdObject {
  final int storyPosterChatId;
  final int storyId;
  final bool isPostedToChatPage;

  TdToggleStoryIsPostedToChatPage({
    required this.storyPosterChatId,
    required this.storyId,
    required this.isPostedToChatPage,
  });

  @override
  String get tdType => 'toggleStoryIsPostedToChatPage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleStoryIsPostedToChatPage',
      'story_poster_chat_id': storyPosterChatId,
      'story_id': storyId,
      'is_posted_to_chat_page': isPostedToChatPage,
    };
  }
}


/// Toggles whether sponsored messages are shown in the channel chat; requires owner privileges in the c...
class TdToggleSupergroupCanHaveSponsoredMessages extends TdObject {
  final int supergroupId;
  final bool canHaveSponsoredMessages;

  TdToggleSupergroupCanHaveSponsoredMessages({
    required this.supergroupId,
    required this.canHaveSponsoredMessages,
  });

  @override
  String get tdType => 'toggleSupergroupCanHaveSponsoredMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupCanHaveSponsoredMessages',
      'supergroup_id': supergroupId,
      'can_have_sponsored_messages': canHaveSponsoredMessages,
    };
  }
}


/// Toggles whether aggressive anti-spam checks are enabled in the supergroup. Can be called only if sup...
class TdToggleSupergroupHasAggressiveAntiSpamEnabled extends TdObject {
  final int supergroupId;
  final bool hasAggressiveAntiSpamEnabled;

  TdToggleSupergroupHasAggressiveAntiSpamEnabled({
    required this.supergroupId,
    required this.hasAggressiveAntiSpamEnabled,
  });

  @override
  String get tdType => 'toggleSupergroupHasAggressiveAntiSpamEnabled';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupHasAggressiveAntiSpamEnabled',
      'supergroup_id': supergroupId,
      'has_aggressive_anti_spam_enabled': hasAggressiveAntiSpamEnabled,
    };
  }
}


/// Toggles whether messages are automatically translated in the channel chat; requires can_change_info ...
class TdToggleSupergroupHasAutomaticTranslation extends TdObject {
  final int supergroupId;
  final bool hasAutomaticTranslation;

  TdToggleSupergroupHasAutomaticTranslation({
    required this.supergroupId,
    required this.hasAutomaticTranslation,
  });

  @override
  String get tdType => 'toggleSupergroupHasAutomaticTranslation';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupHasAutomaticTranslation',
      'supergroup_id': supergroupId,
      'has_automatic_translation': hasAutomaticTranslation,
    };
  }
}


/// Toggles whether non-administrators can receive only administrators and bots using getSupergroupMembe...
class TdToggleSupergroupHasHiddenMembers extends TdObject {
  final int supergroupId;
  final bool hasHiddenMembers;

  TdToggleSupergroupHasHiddenMembers({
    required this.supergroupId,
    required this.hasHiddenMembers,
  });

  @override
  String get tdType => 'toggleSupergroupHasHiddenMembers';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupHasHiddenMembers',
      'supergroup_id': supergroupId,
      'has_hidden_members': hasHiddenMembers,
    };
  }
}


/// Toggles whether the message history of a supergroup is available to new members; requires can_change...
class TdToggleSupergroupIsAllHistoryAvailable extends TdObject {
  final int supergroupId;
  final bool isAllHistoryAvailable;

  TdToggleSupergroupIsAllHistoryAvailable({
    required this.supergroupId,
    required this.isAllHistoryAvailable,
  });

  @override
  String get tdType => 'toggleSupergroupIsAllHistoryAvailable';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupIsAllHistoryAvailable',
      'supergroup_id': supergroupId,
      'is_all_history_available': isAllHistoryAvailable,
    };
  }
}


/// Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup @supergroup_id...
class TdToggleSupergroupIsBroadcastGroup extends TdObject {
  final int supergroupId;

  TdToggleSupergroupIsBroadcastGroup({
    required this.supergroupId,
  });

  @override
  String get tdType => 'toggleSupergroupIsBroadcastGroup';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupIsBroadcastGroup',
      'supergroup_id': supergroupId,
    };
  }
}


/// Toggles whether the supergroup is a forum; requires owner privileges in the supergroup. Discussion s...
class TdToggleSupergroupIsForum extends TdObject {
  final int supergroupId;
  final bool isForum;
  final bool hasForumTabs;

  TdToggleSupergroupIsForum({
    required this.supergroupId,
    required this.isForum,
    required this.hasForumTabs,
  });

  @override
  String get tdType => 'toggleSupergroupIsForum';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupIsForum',
      'supergroup_id': supergroupId,
      'is_forum': isForum,
      'has_forum_tabs': hasForumTabs,
    };
  }
}


/// Toggles whether all users directly joining the supergroup need to be approved by supergroup administ...
class TdToggleSupergroupJoinByRequest extends TdObject {
  final int supergroupId;
  final bool joinByRequest;

  TdToggleSupergroupJoinByRequest({
    required this.supergroupId,
    required this.joinByRequest,
  });

  @override
  String get tdType => 'toggleSupergroupJoinByRequest';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupJoinByRequest',
      'supergroup_id': supergroupId,
      'join_by_request': joinByRequest,
    };
  }
}


/// Toggles whether joining is mandatory to send messages to a discussion supergroup; requires can_restr...
class TdToggleSupergroupJoinToSendMessages extends TdObject {
  final int supergroupId;
  final bool joinToSendMessages;

  TdToggleSupergroupJoinToSendMessages({
    required this.supergroupId,
    required this.joinToSendMessages,
  });

  @override
  String get tdType => 'toggleSupergroupJoinToSendMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupJoinToSendMessages',
      'supergroup_id': supergroupId,
      'join_to_send_messages': joinToSendMessages,
    };
  }
}


/// Toggles whether sender signature or link to the account is added to sent messages in a channel; requ...
class TdToggleSupergroupSignMessages extends TdObject {
  final int supergroupId;
  final bool signMessages;
  final bool showMessageSender;

  TdToggleSupergroupSignMessages({
    required this.supergroupId,
    required this.signMessages,
    required this.showMessageSender,
  });

  @override
  String get tdType => 'toggleSupergroupSignMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupSignMessages',
      'supergroup_id': supergroupId,
      'sign_messages': signMessages,
      'show_message_sender': showMessageSender,
    };
  }
}


/// Changes active state for a username of a supergroup or channel, requires owner privileges in the sup...
class TdToggleSupergroupUsernameIsActive extends TdObject {
  final int supergroupId;
  final String username;
  final bool isActive;

  TdToggleSupergroupUsernameIsActive({
    required this.supergroupId,
    required this.username,
    required this.isActive,
  });

  @override
  String get tdType => 'toggleSupergroupUsernameIsActive';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleSupergroupUsernameIsActive',
      'supergroup_id': supergroupId,
      'username': username,
      'is_active': isActive,
    };
  }
}


/// Changes active state for a username of the current user. The editable username can\'t be disabled. Ma...
class TdToggleUsernameIsActive extends TdObject {
  final String username;
  final bool isActive;

  TdToggleUsernameIsActive({
    required this.username,
    required this.isActive,
  });

  @override
  String get tdType => 'toggleUsernameIsActive';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleUsernameIsActive',
      'username': username,
      'is_active': isActive,
    };
  }
}


/// Toggles whether the current user will receive a notification when the video chat starts; for schedul...
class TdToggleVideoChatEnabledStartNotification extends TdObject {
  final int groupCallId;
  final bool enabledStartNotification;

  TdToggleVideoChatEnabledStartNotification({
    required this.groupCallId,
    required this.enabledStartNotification,
  });

  @override
  String get tdType => 'toggleVideoChatEnabledStartNotification';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleVideoChatEnabledStartNotification',
      'group_call_id': groupCallId,
      'enabled_start_notification': enabledStartNotification,
    };
  }
}


/// Toggles whether new participants of a video chat can be unmuted only by administrators of the video ...
class TdToggleVideoChatMuteNewParticipants extends TdObject {
  final int groupCallId;
  final bool muteNewParticipants;

  TdToggleVideoChatMuteNewParticipants({
    required this.groupCallId,
    required this.muteNewParticipants,
  });

  @override
  String get tdType => 'toggleVideoChatMuteNewParticipants';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'toggleVideoChatMuteNewParticipants',
      'group_call_id': groupCallId,
      'mute_new_participants': muteNewParticipants,
    };
  }
}


/// Transfers Telegram Stars from the business account to the business bot; for bots only
class TdTransferBusinessAccountStars extends TdObject {
  final String businessConnectionId;
  final int starCount;

  TdTransferBusinessAccountStars({
    required this.businessConnectionId,
    required this.starCount,
  });

  @override
  String get tdType => 'transferBusinessAccountStars';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'transferBusinessAccountStars',
      'business_connection_id': businessConnectionId,
      'star_count': starCount,
    };
  }
}


/// Changes the owner of a chat; requires owner privileges in the chat. Use the method canTransferOwners...
class TdTransferChatOwnership extends TdObject {
  final int chatId;
  final int userId;
  final String password;

  TdTransferChatOwnership({
    required this.chatId,
    required this.userId,
    required this.password,
  });

  @override
  String get tdType => 'transferChatOwnership';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'transferChatOwnership',
      'chat_id': chatId,
      'user_id': userId,
      'password': password,
    };
  }
}


/// Sends an upgraded gift to another user or channel chat
class TdTransferGift extends TdObject {
  final String businessConnectionId;
  final String receivedGiftId;
  final TdMessageSender? newOwnerId;
  final int starCount;

  TdTransferGift({
    required this.businessConnectionId,
    required this.receivedGiftId,
    this.newOwnerId,
    required this.starCount,
  });

  @override
  String get tdType => 'transferGift';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'transferGift',
      'business_connection_id': businessConnectionId,
      'received_gift_id': receivedGiftId,
      'new_owner_id': newOwnerId?.toMap(),
      'star_count': starCount,
    };
  }
}


/// Extracts text or caption of the given message and translates it to the given language. If the curren...
class TdTranslateMessageText extends TdObject {
  final int chatId;
  final int messageId;
  final String toLanguageCode;

  TdTranslateMessageText({
    required this.chatId,
    required this.messageId,
    required this.toLanguageCode,
  });

  @override
  String get tdType => 'translateMessageText';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'translateMessageText',
      'chat_id': chatId,
      'message_id': messageId,
      'to_language_code': toLanguageCode,
    };
  }
}


/// Translates a text to the given language. If the current user is a Telegram Premium user, then text f...
class TdTranslateText extends TdObject {
  final TdFormattedText? text;
  final String toLanguageCode;

  TdTranslateText({
    this.text,
    required this.toLanguageCode,
  });

  @override
  String get tdType => 'translateText';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'translateText',
      'text': text?.toMap(),
      'to_language_code': toLanguageCode,
    };
  }
}


/// Removes all pinned messages from a chat; requires can_pin_messages member right if the chat is a bas...
class TdUnpinAllChatMessages extends TdObject {
  final int chatId;

  TdUnpinAllChatMessages({
    required this.chatId,
  });

  @override
  String get tdType => 'unpinAllChatMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'unpinAllChatMessages',
      'chat_id': chatId,
    };
  }
}


/// Removes all pinned messages from the topic in a channel direct messages chat administered by the cur...
class TdUnpinAllDirectMessagesChatTopicMessages extends TdObject {
  final int chatId;
  final int topicId;

  TdUnpinAllDirectMessagesChatTopicMessages({
    required this.chatId,
    required this.topicId,
  });

  @override
  String get tdType => 'unpinAllDirectMessagesChatTopicMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'unpinAllDirectMessagesChatTopicMessages',
      'chat_id': chatId,
      'topic_id': topicId,
    };
  }
}


/// Removes all pinned messages from a topic in a forum supergroup chat or a chat with a bot with topics...
class TdUnpinAllForumTopicMessages extends TdObject {
  final int chatId;
  final int forumTopicId;

  TdUnpinAllForumTopicMessages({
    required this.chatId,
    required this.forumTopicId,
  });

  @override
  String get tdType => 'unpinAllForumTopicMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'unpinAllForumTopicMessages',
      'chat_id': chatId,
      'forum_topic_id': forumTopicId,
    };
  }
}


/// Removes a pinned message from a chat; requires can_pin_messages member right if the chat is a basic ...
class TdUnpinChatMessage extends TdObject {
  final int chatId;
  final int messageId;

  TdUnpinChatMessage({
    required this.chatId,
    required this.messageId,
  });

  @override
  String get tdType => 'unpinChatMessage';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'unpinChatMessage',
      'chat_id': chatId,
      'message_id': messageId,
    };
  }
}


/// Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo...
class TdUpgradeBasicGroupChatToSupergroupChat extends TdObject {
  final int chatId;

  TdUpgradeBasicGroupChatToSupergroupChat({
    required this.chatId,
  });

  @override
  String get tdType => 'upgradeBasicGroupChatToSupergroupChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'upgradeBasicGroupChatToSupergroupChat',
      'chat_id': chatId,
    };
  }
}


/// Upgrades a regular gift
class TdUpgradeGift extends TdObject {
  final String businessConnectionId;
  final String receivedGiftId;
  final bool keepOriginalDetails;
  final int starCount;

  TdUpgradeGift({
    required this.businessConnectionId,
    required this.receivedGiftId,
    required this.keepOriginalDetails,
    required this.starCount,
  });

  @override
  String get tdType => 'upgradeGift';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'upgradeGift',
      'business_connection_id': businessConnectionId,
      'received_gift_id': receivedGiftId,
      'keep_original_details': keepOriginalDetails,
      'star_count': starCount,
    };
  }
}


/// Uploads a file with a sticker; returns the uploaded file See https://core.telegram.org/animated_stic...
class TdUploadStickerFile extends TdObject {
  final int userId;
  final TdStickerFormat? stickerFormat;
  final TdInputFile? sticker;

  TdUploadStickerFile({
    required this.userId,
    this.stickerFormat,
    this.sticker,
  });

  @override
  String get tdType => 'uploadStickerFile';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'uploadStickerFile',
      'user_id': userId,
      'sticker_format': stickerFormat?.toMap(),
      'sticker': sticker?.toMap(),
    };
  }
}


/// Validates the order information provided by a user and returns the available shipping options for a ...
class TdValidateOrderInfo extends TdObject {
  final TdInputInvoice? inputInvoice;
  final TdOrderInfo? orderInfo;
  final bool allowSave;

  TdValidateOrderInfo({
    this.inputInvoice,
    this.orderInfo,
    required this.allowSave,
  });

  @override
  String get tdType => 'validateOrderInfo';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'validateOrderInfo',
      'input_invoice': inputInvoice?.toMap(),
      'order_info': orderInfo?.toMap(),
      'allow_save': allowSave,
    };
  }
}


/// Informs TDLib that messages are being viewed by the user. Sponsored messages must be marked as viewe...
class TdViewMessages extends TdObject {
  final int chatId;
  final List<int> messageIds;
  final TdMessageSource? source;
  final bool forceRead;

  TdViewMessages({
    required this.chatId,
    required this.messageIds,
    this.source,
    required this.forceRead,
  });

  @override
  String get tdType => 'viewMessages';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'viewMessages',
      'chat_id': chatId,
      'message_ids': messageIds,
      'source': source?.toMap(),
      'force_read': forceRead,
    };
  }
}


/// Informs TDLib that the user viewed detailed information about a Premium feature on the Premium featu...
class TdViewPremiumFeature extends TdObject {
  final TdPremiumFeature? feature;

  TdViewPremiumFeature({
    this.feature,
  });

  @override
  String get tdType => 'viewPremiumFeature';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'viewPremiumFeature',
      'feature': feature?.toMap(),
    };
  }
}


/// Informs TDLib that the user fully viewed a sponsored chat @sponsored_chat_unique_id Unique identifie...
class TdViewSponsoredChat extends TdObject {
  final int sponsoredChatUniqueId;

  TdViewSponsoredChat({
    required this.sponsoredChatUniqueId,
  });

  @override
  String get tdType => 'viewSponsoredChat';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'viewSponsoredChat',
      'sponsored_chat_unique_id': sponsoredChatUniqueId,
    };
  }
}


/// Informs the server that some trending sticker sets have been viewed by the user @sticker_set_ids Ide...
class TdViewTrendingStickerSets extends TdObject {
  final List<int> stickerSetIds;

  TdViewTrendingStickerSets({
    required this.stickerSetIds,
  });

  @override
  String get tdType => 'viewTrendingStickerSets';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'viewTrendingStickerSets',
      'sticker_set_ids': stickerSetIds,
    };
  }
}


/// Informs TDLib that the user viewed a video message advertisement @advertisement_unique_id Unique ide...
class TdViewVideoMessageAdvertisement extends TdObject {
  final int advertisementUniqueId;

  TdViewVideoMessageAdvertisement({
    required this.advertisementUniqueId,
  });

  @override
  String get tdType => 'viewVideoMessageAdvertisement';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'viewVideoMessageAdvertisement',
      'advertisement_unique_id': advertisementUniqueId,
    };
  }
}


/// Writes a part of a generated file. This method is intended to be used only if the application has no...
class TdWriteGeneratedFilePart extends TdObject {
  final int generationId;
  final int offset;
  final String data;

  TdWriteGeneratedFilePart({
    required this.generationId,
    required this.offset,
    required this.data,
  });

  @override
  String get tdType => 'writeGeneratedFilePart';

  @override
  Map<String, dynamic> toMap() {
    return {
      '@type': 'writeGeneratedFilePart',
      'generation_id': generationId,
      'offset': offset,
      'data': data,
    };
  }
}


