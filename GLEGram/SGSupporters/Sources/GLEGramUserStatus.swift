import Foundation

// MARK: - GLEGram check_user response models

public struct GLEGramUserStatus: Equatable {
    public let userId: String
    public let badges: [GLEGramBadge]
    public let subscription: GLEGramSubscription?
    public let trial: GLEGramTrial?
    public let donation: GLEGramDonation?
    public let access: GLEGramAccess
    public let glegramPromo: GLEGramPromo?
    public let betaConfig: GLEGramBetaConfig?
    public let hasActiveSubscription: Bool
    public let hasActiveTrial: Bool
    public let trialAvailable: Bool

    public init(json: [String: Any]) {
        self.userId = json["userId"] as? String ?? ""
        self.badges = (json["badges"] as? [[String: Any]] ?? []).compactMap { GLEGramBadge(json: $0) }
        self.subscription = (json["subscription"] as? [String: Any]).flatMap { GLEGramSubscription(json: $0) }
        self.trial = (json["trial"] as? [String: Any]).flatMap { GLEGramTrial(json: $0) }
        self.donation = (json["donation"] as? [String: Any]).flatMap { GLEGramDonation(json: $0) }
        self.access = GLEGramAccess(json: json["access"] as? [String: Any] ?? [:])
        self.glegramPromo = (json["glegramPromo"] as? [String: Any]).flatMap { GLEGramPromo(json: $0) }
        self.betaConfig = (json["betaConfig"] as? [String: Any]).flatMap { GLEGramBetaConfig(json: $0) }
        self.hasActiveSubscription = json["hasActiveSubscription"] as? Bool ?? false
        self.hasActiveTrial = json["hasActiveTrial"] as? Bool ?? false
        self.trialAvailable = json["trialAvailable"] as? Bool ?? false
    }
}

public struct GLEGramBadge: Equatable {
    public let id: String
    public let name: String
    public let color: String
    public let displayMode: String   // "text" or "image"
    public let image: String?        // relative URL for image badges
    public let uiEnabled: Bool
    public let uiConfig: GLEGramBadgeUIConfig?

    public init?(json: [String: Any]) {
        guard let id = json["id"] as? String else { return nil }
        self.id = id
        self.name = json["name"] as? String ?? id
        self.color = json["color"] as? String ?? "#34C759"
        self.displayMode = json["displayMode"] as? String ?? "text"
        self.image = json["image"] as? String
        self.uiEnabled = json["uiEnabled"] as? Bool ?? false
        self.uiConfig = (json["uiConfig"] as? [String: Any]).flatMap { GLEGramBadgeUIConfig(json: $0) }
    }
}

public struct GLEGramBadgeUIConfig: Equatable {
    public let title: String
    public let description: String
    public let buttons: [GLEGramBadgeButton]

    public init?(json: [String: Any]) {
        self.title = json["title"] as? String ?? ""
        self.description = json["description"] as? String ?? ""
        self.buttons = (json["buttons"] as? [[String: Any]] ?? []).compactMap { GLEGramBadgeButton(json: $0) }
    }
}

public struct GLEGramBadgeButton: Equatable {
    public let label: String
    public let url: String

    public init?(json: [String: Any]) {
        guard let label = json["label"] as? String, let url = json["url"] as? String else { return nil }
        self.label = label
        self.url = url
    }
}

public struct GLEGramSubscription: Equatable {
    public let planId: String
    public let startedAt: String
    public let expiresAt: String
    public let active: Bool

    public init?(json: [String: Any]) {
        self.planId = json["planId"] as? String ?? ""
        self.startedAt = json["startedAt"] as? String ?? ""
        self.expiresAt = json["expiresAt"] as? String ?? ""
        self.active = json["active"] as? Bool ?? false
    }
}

public struct GLEGramTrial: Equatable {
    public let startedAt: String
    public let expiresAt: String
    public let active: Bool
    public let alreadyUsed: Bool

    public init?(json: [String: Any]) {
        self.startedAt = json["startedAt"] as? String ?? ""
        self.expiresAt = json["expiresAt"] as? String ?? ""
        self.active = json["active"] as? Bool ?? false
        self.alreadyUsed = json["alreadyUsed"] as? Bool ?? false
    }
}

public struct GLEGramDonation: Equatable {
    public let amount: Int
    public let lastDonatedAt: String
    public let betaAccess: Bool

    public init?(json: [String: Any]) {
        self.amount = json["amount"] as? Int ?? 0
        self.lastDonatedAt = json["lastDonatedAt"] as? String ?? ""
        self.betaAccess = json["betaAccess"] as? Bool ?? false
    }
}

public struct GLEGramAccess: Equatable {
    // Obfuscated storage: actual bits XOR'd with per-instance random salt.
    // Prevents trivial memory scanning for plain true/false values.
    private let _enc: UInt32
    private let _salt: UInt32
    /// HMAC access token (base64). Used by integrity layer to verify flags haven't been tampered.
    public let accessToken: String?

    public var glegramTab: Bool {
        return (_enc ^ _salt) & 0x1 != 0
    }

    public var betaBuilds: Bool {
        return (_enc ^ _salt) & 0x2 != 0
    }

    public init(json: [String: Any]) {
        let tab = json["glegramTab"] as? Bool ?? false
        let beta = json["betaBuilds"] as? Bool ?? false
        let bits: UInt32 = (tab ? 1 : 0) | (beta ? 2 : 0)
        let salt = UInt32.random(in: 1...UInt32.max)
        self._enc = bits ^ salt
        self._salt = salt
        self.accessToken = json["_accessToken"] as? String
    }

    public static func == (lhs: GLEGramAccess, rhs: GLEGramAccess) -> Bool {
        return lhs.glegramTab == rhs.glegramTab && lhs.betaBuilds == rhs.betaBuilds
    }
}

public struct GLEGramPromo: Equatable {
    public let title: String
    public let subtitle: String
    public let features: [String]
    public let trialButtonText: String
    public let subscribeButtonText: String
    public let miniAppUrl: String?

    public init?(json: [String: Any]) {
        self.title = json["title"] as? String ?? ""
        self.subtitle = json["subtitle"] as? String ?? ""
        self.features = json["features"] as? [String] ?? []
        self.trialButtonText = json["trialButtonText"] as? String ?? ""
        self.subscribeButtonText = json["subscribeButtonText"] as? String ?? ""
        self.miniAppUrl = json["miniAppUrl"] as? String
    }
}

public struct GLEGramBetaConfig: Equatable {
    public let channelId: String?
    public let channelUrl: String?
    public let buildUrl: String?

    public init?(json: [String: Any]) {
        self.channelId = json["channelId"] as? String
        self.channelUrl = json["channelUrl"] as? String
        self.buildUrl = json["buildUrl"] as? String
    }
}

// MARK: - JSON serialization for cache

extension GLEGramUserStatus {
    public func toJSON() -> [String: Any] {
        var dict: [String: Any] = [
            "userId": userId,
            "badges": badges.map { $0.toJSON() },
            "hasActiveSubscription": hasActiveSubscription,
            "hasActiveTrial": hasActiveTrial,
            "trialAvailable": trialAvailable,
            "access": access.toJSON()
        ]
        if let s = subscription { dict["subscription"] = s.toJSON() }
        if let t = trial { dict["trial"] = t.toJSON() }
        if let d = donation { dict["donation"] = d.toJSON() }
        if let p = glegramPromo { dict["glegramPromo"] = p.toJSON() }
        if let b = betaConfig { dict["betaConfig"] = b.toJSON() }
        return dict
    }
}

extension GLEGramBadge {
    func toJSON() -> [String: Any] {
        var dict: [String: Any] = [
            "id": id, "name": name, "color": color,
            "displayMode": displayMode, "uiEnabled": uiEnabled
        ]
        if let img = image { dict["image"] = img }
        if let ui = uiConfig { dict["uiConfig"] = ui.toJSON() }
        return dict
    }
}

extension GLEGramBadgeUIConfig {
    func toJSON() -> [String: Any] {
        return [
            "title": title,
            "description": description,
            "buttons": buttons.map { ["label": $0.label, "url": $0.url] }
        ]
    }
}

extension GLEGramSubscription {
    func toJSON() -> [String: Any] {
        return ["planId": planId, "startedAt": startedAt, "expiresAt": expiresAt, "active": active]
    }
}

extension GLEGramTrial {
    func toJSON() -> [String: Any] {
        return ["startedAt": startedAt, "expiresAt": expiresAt, "active": active, "alreadyUsed": alreadyUsed]
    }
}

extension GLEGramDonation {
    func toJSON() -> [String: Any] {
        return ["amount": amount, "lastDonatedAt": lastDonatedAt, "betaAccess": betaAccess]
    }
}

extension GLEGramAccess {
    func toJSON() -> [String: Any] {
        var d: [String: Any] = ["glegramTab": glegramTab, "betaBuilds": betaBuilds]
        if let t = accessToken { d["_accessToken"] = t }
        return d
    }
}

extension GLEGramPromo {
    func toJSON() -> [String: Any] {
        var dict: [String: Any] = [
            "title": title, "subtitle": subtitle, "features": features,
            "trialButtonText": trialButtonText, "subscribeButtonText": subscribeButtonText
        ]
        if let url = miniAppUrl { dict["miniAppUrl"] = url }
        return dict
    }
}

extension GLEGramBetaConfig {
    func toJSON() -> [String: Any] {
        var dict: [String: Any] = [:]
        if let v = channelId { dict["channelId"] = v }
        if let v = channelUrl { dict["channelUrl"] = v }
        if let v = buildUrl { dict["buildUrl"] = v }
        return dict
    }
}
