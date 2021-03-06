// swift-tools-version:5.4

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/2021.
//  All code (c) 2021 - present day, Elegant Chaos.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import PackageDescription

let package = Package(
    name: "LabelledGrid",
    platforms: [
        .macOS(.v11), .iOS(.v14), .tvOS(.v14), .watchOS(.v6)
    ],
    products: [
        .library(
            name: "LabelledGrid",
            targets: ["LabelledGrid"]),
    ],
    dependencies: [
        .package(url: "https://github.com/elegantchaos/Labelled.git", from: "1.0.7"),
        .package(url: "https://github.com/elegantchaos/XCTestExtensions.git", from: "1.4.7")
    ],
    targets: [
        .target(
            name: "LabelledGrid",
            dependencies: [
                .product(name: "Labelled", package: "Labelled"),
                .product(name: "LabelledKit", package: "Labelled")
                         ]
                        ),
        .testTarget(
            name: "LabelledGridTests",
            dependencies: ["LabelledGrid", "XCTestExtensions"]),
    ]
)
