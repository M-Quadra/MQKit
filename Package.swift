// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MQKit",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "MQKit",
            targets: ["MQKit"]
        ),
    ],
    targets: [
        .target(
            name: "MQKit",
            path: "MQKit/MQKit"
        ),
    ]
)
