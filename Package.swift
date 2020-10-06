// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIImage_Categories",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(name: "UIImage_Categories", targets: ["UIImage_Categories"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UIImage_Categories",
            dependencies: [],
            path: "Source",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
            ]
        )
    ]
)
