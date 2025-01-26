// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "CrudRouter",
    platforms: [
       .macOS(.v13)
    ],
    products: [
        .library(name: "CrudRouter", targets: ["CrudRouter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.110.1"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.9.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.5.2"),
    ],
    targets: [
        .target(
            name: "CrudRouter",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Vapor", package: "vapor"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "CrudRouterIntegrationTests",
            dependencies: [
                .target(name: "CrudRouter"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "XCTVapor", package: "vapor"),
                .product(name: "VaporTesting", package: "vapor"),
            ],
            swiftSettings: swiftSettings
        )
    ],
    swiftLanguageModes: [.v5]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableExperimentalFeature("StrictConcurrency"),
] }
