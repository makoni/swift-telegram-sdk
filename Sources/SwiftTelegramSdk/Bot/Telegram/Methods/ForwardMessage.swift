// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to forward messages of any kind. Service messages and messages with protected content can't be forwarded. On success, the sent Message is returned.


/// Parameters container struct for `forwardMessage` method
public struct TGForwardMessageParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
    public var fromChatId: TGChatId

    /// New start timestamp for the forwarded video in the message
    public var videoStartTimestamp: Int?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the forwarded message from forwarding and saving
    public var protectContent: Bool?

    /// Message identifier in the chat specified in from_chat_id
    public var messageId: Int

    /// Custom keys for coding/decoding `ForwardMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case fromChatId = "from_chat_id"
            case videoStartTimestamp = "video_start_timestamp"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case messageId = "message_id"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, fromChatId: TGChatId, videoStartTimestamp: Int? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, messageId: Int) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.fromChatId = fromChatId
            self.videoStartTimestamp = videoStartTimestamp
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.messageId = messageId
    }
}


public extension TGBot {

/**
 Use this method to forward messages of any kind. Service messages and messages with protected content can't be forwarded. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [ForwardMessageParams](https://core.telegram.org/bots/api#forwardmessage)
 
 - Parameters:
     - params: Parameters container, see `ForwardMessageParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func forwardMessage(params: TGForwardMessageParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("forwardMessage")) else {
            throw BotError("Bad URL: \(getMethodURL("forwardMessage"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
