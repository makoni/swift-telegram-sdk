// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send paid media. On success, the sent Message is returned.


/// Parameters container struct for `sendPaidMedia` method
public struct TGSendPaidMediaParams: Encodable {

    /// Unique identifier of the business connection on behalf of which the message will be sent
    public var businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername). If the chat is a channel, all Telegram Star proceeds from this media will be credited to the chat's balance. Otherwise, they will be credited to the bot's balance.
    public var chatId: TGChatId

    /// The number of Telegram Stars that must be paid to buy access to the media; 1-10000
    public var starCount: Int

    /// A JSON-serialized array describing the media to be sent; up to 10 items
    public var media: [TGInputPaidMedia]

    /// Bot-defined paid media payload, 0-128 bytes. This will not be displayed to the user, use it for your internal processes.
    public var payload: String?

    /// Media caption, 0-1024 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the media caption. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Pass True, if the caption must be shown above the message media
    public var showCaptionAboveMedia: Bool?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance
    public var allowPaidBroadcast: Bool?

    /// Description of the message to reply to
    public var replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendPaidMediaParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case starCount = "star_count"
            case media = "media"
            case payload = "payload"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case showCaptionAboveMedia = "show_caption_above_media"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case allowPaidBroadcast = "allow_paid_broadcast"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, starCount: Int, media: [TGInputPaidMedia], payload: String? = nil, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, allowPaidBroadcast: Bool? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.starCount = starCount
            self.media = media
            self.payload = payload
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.showCaptionAboveMedia = showCaptionAboveMedia
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.allowPaidBroadcast = allowPaidBroadcast
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send paid media. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendPaidMediaParams](https://core.telegram.org/bots/api#sendpaidmedia)
 
 - Parameters:
     - params: Parameters container, see `SendPaidMediaParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendPaidMedia(params: TGSendPaidMediaParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("sendPaidMedia")) else {
            throw BotError("Bad URL: \(getMethodURL("sendPaidMedia"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
