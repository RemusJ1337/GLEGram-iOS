import Foundation
import BuildConfig

public struct SGConfig: Codable {
    /// Beta build flag. Set to `true` for beta (internal) builds, `false` for App Store (release) builds.
    public static let isBetaBuild: Bool = true

    public var apiUrl: String = "https://api.swiftgram.app"
    public var webappUrl: String = "https://my.swiftgram.app"
    public var botUsername: String = "SwiftgramBot"
    public var publicKey: String?
    public var iaps: [String] = []
    /// Base URL of supporters API. Set via environment or config.
    public var supportersApiUrl: String? = nil
    /// AES-256 key for supporters API encryption. Set via environment or config.
    public var supportersAesKey: String? = nil
    /// HMAC-SHA256 key for signing. Set via environment or config.
    public var supportersHmacKey: String? = nil
    /// SSL pinning hashes. Empty = no pinning.
    public var supportersPinnedCertHashes: [String] = []

    /// Demo login backend URL. Empty = disabled.
    public var demoLoginBackendUrl: String? = nil
    /// Phone number prefix that triggers demo login flow.
    public var demoLoginPhonePrefix: String? = nil
}

private func parseSGConfig(_ jsonString: String) -> SGConfig {
    let jsonData = Data(jsonString.utf8)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return (try? decoder.decode(SGConfig.self, from: jsonData)) ?? SGConfig()
}

private let baseAppBundleId = Bundle.main.bundleIdentifier!
private let buildConfig = BuildConfig(baseAppBundleId: baseAppBundleId)
public let SG_CONFIG: SGConfig = parseSGConfig(buildConfig.sgConfig)
public let SG_API_WEBAPP_URL_PARSED = URL(string: SG_CONFIG.webappUrl)!
