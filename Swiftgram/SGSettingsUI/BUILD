load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

filegroup(
    name = "SGUIAssets",
    srcs = glob(["Images.xcassets/**"]),
    visibility = ["//visibility:public"],
)

swift_library(
    name = "SGSettingsUI",
    module_name = "SGSettingsUI",
    srcs = glob([
		"Sources/**/*.swift",
    ]),
    copts = [
        "-warnings-as-errors",
    ],
    deps = [
        "//Swiftgram/SGItemListUI:SGItemListUI",
        "//Swiftgram/SGLogging:SGLogging",
        "//Swiftgram/SGSimpleSettings:SGSimpleSettings",
        "//Swiftgram/SGStrings:SGStrings",
#        "//Swiftgram/SGAPI:SGAPI",
        "//Swiftgram/SGAPIToken:SGAPIToken",
        "//Swiftgram/SGSwiftUI:SGSwiftUI",
        # MARK: GLEGram
        "//GLEGram/SGDeletedMessages:SGDeletedMessages",
        "//GLEGram/SGFakeLocation:SGFakeLocation",
        "//GLEGram/SGSupporters:SGSupporters",
        "//GLEGram/DoubleBottom:DoubleBottom",
        "//GLEGram/ChatPassword:ChatPassword",
        "//GLEGram/VoiceMorpher:VoiceMorpher",
        # MARK: End GLEGram
        "//submodules/SSignalKit/SwiftSignalKit:SwiftSignalKit",
        "//submodules/AsyncDisplayKit:AsyncDisplayKit",
        "//submodules/Display:Display",
        "//submodules/Postbox:Postbox",
        "//submodules/TelegramCore:TelegramCore",
        "//submodules/MtProtoKit:MtProtoKit",
        "//submodules/TelegramPresentationData:TelegramPresentationData",
        "//submodules/TelegramUIPreferences:TelegramUIPreferences",
        "//submodules/ItemListUI:ItemListUI",
        "//submodules/PresentationDataUtils:PresentationDataUtils",
        "//submodules/OverlayStatusController:OverlayStatusController",
        "//submodules/AccountContext:AccountContext",
        "//submodules/AppBundle:AppBundle",
        "//submodules/TelegramUI/Components/Settings/PeerNameColorScreen",
        "//submodules/UndoUI:UndoUI",
        "//submodules/LegacyUI:LegacyUI",
        "//submodules/LocalizedPeerData:LocalizedPeerData",
        "//submodules/SettingsUI:SettingsUI",
    ],
    visibility = [
        "//visibility:public",
    ],
)
