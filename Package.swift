// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WPDataSource",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WPDataSource",
            targets: ["WPDataSource"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Livsy90/SwiftPresso.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "WPDataSource",
            dependencies: [
                "SwiftPresso"
            ]
        ),
        .testTarget(
            name: "WPDataSourceTests",
            dependencies: ["WPDataSource"]),
    ]
)
