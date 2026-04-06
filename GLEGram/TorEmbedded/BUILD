# Tor removed to reduce IPA size (~70 MB). Stub only; no Tor.framework.
load("@rules_cc//cc:defs.bzl", "objc_library")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

objc_library(
    name = "TorEmbeddedRunner",
    module_name = "TorEmbeddedRunner",
    srcs = ["Sources/TorEmbeddedRunner.m"],
    hdrs = ["Sources/TorEmbeddedRunner.h"],
    copts = ["-fobjc-arc"],
    visibility = ["//visibility:public"],
)

swift_library(
    name = "TorEmbedded",
    module_name = "TorEmbedded",
    srcs = ["Sources/TorEmbedded.swift"],
    deps = [":TorEmbeddedRunner"],
    visibility = ["//visibility:public"],
)
