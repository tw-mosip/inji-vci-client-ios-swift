// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VCIClient",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9)],
    products: [
        .library(
            name: "VCIClient",
            targets: ["VCIClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/jwt-kit.git", from: "5.0.0-beta"),
        .package(url: "https://github.com/auth0/JWTDecode.swift.git", from: "2.4.1"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.9.1"),
    ],
    targets: [
        .target(
            name: "VCIClient",
            dependencies: [
            .product(name: "JWTKit", package: "jwt-kit"),
            .product(name: "JWTDecode", package: "JWTDecode.swift"),
            .product(name: "Alamofire", package: "Alamofire"),
        ]),
        .testTarget(
            name: "VCIClientTests",
            dependencies: ["VCIClient"]),
    ]
)
