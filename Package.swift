// swift-tools-version: 5.7.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VCIClient",
    platforms: [
        .macOS(.v11),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "VCIClient",
            targets: ["VCIClient"]),
    ],
    targets: [
        .target(
            name: "VCIClient"),
        .testTarget(
            name: "VCIClientTests",
            dependencies: ["VCIClient"]),
    ]
)
