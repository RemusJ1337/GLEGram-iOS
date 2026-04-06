// MARK: Swiftgram — Tor removed to reduce IPA size. Stub only.
import Foundation
import TorEmbeddedRunner

public enum TorEmbedded {
    /// Log lines from last Tor startup (when "Show Tor startup logs" is on). Updated on main queue.
    private static let _logLinesLock = NSLock()
    private static var _logLines: [String] = []
    public static var logLines: [String] {
        _logLinesLock.lock()
        defer { _logLinesLock.unlock() }
        return _logLines
    }

    /// Posted when a new log line is appended (object = line String). Subscribe to refresh Tor logs UI.
    public static let didAppendLogNotification = Notification.Name("TorEmbedded.didAppendLog")

    /// Tor removed to reduce IPA size. No-op.
    public static func startIfNeeded() {
        return
    }

    /// Stop Tor (e.g. when user disables "Use Tor in browser").
    public static func stop() {
        TorEmbeddedRunner.stop()
    }

    /// Whether Tor is running and circuit is established (browser can use SOCKS 9050).
    public static var isReady: Bool {
        TorEmbeddedRunner.isReady()
    }
}
