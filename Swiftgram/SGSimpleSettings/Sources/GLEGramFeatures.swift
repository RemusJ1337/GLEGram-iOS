import Foundation

/// Global feature flags for GLEGram (Swiftgram).
public enum GLEGramFeatures {
    /// Master toggle for JS plugins: without it, PluginRunner and chat hooks are disabled (less overhead and hangs).
    public static let pluginsEnabled = true
}
