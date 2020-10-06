// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIImage-Categories",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(name: "UIImage-Categories", targets: ["UIImage-Categories"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UIImage-Categories",
            dependencies: [],
            path: ".",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("**")
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
            ]
        )
    ]
)
