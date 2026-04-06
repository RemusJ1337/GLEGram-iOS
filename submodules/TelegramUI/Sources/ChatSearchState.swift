import Foundation
import Postbox
import TelegramCore

struct ChatSearchState: Equatable {
    let query: String
    let location: SearchMessagesLocation
    // MARK: - GLEGram
    let onlyDeleted: Bool
    // MARK: - End GLEGram
    let loadMoreState: SearchMessagesState?
}
