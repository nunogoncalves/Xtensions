// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let target: Target = .target(name: "Xtensions")

let package = Package(
    name: "Xtensions",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v12),
        .watchOS(.v3),
        .tvOS(.v12)
    ],
    products: [.library(name: "Xtensions", targets: [target.name])],
    dependencies: [],
    targets: [
        target,
        .testTarget(
            name: "XtensionsTests",
            dependencies: [.init(stringLiteral: target.name)]
        )
    ]
)
