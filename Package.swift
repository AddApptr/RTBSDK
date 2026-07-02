// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RTBSDK",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "RTBSDK", targets: ["RTBSDK", "RTBOMSDK"]),
    ],
    targets: [
        .target(
            name: "RTBOMSDK",
            dependencies: ["OMSDK_Addapptr"],
            path: "./Sources/RTB_OMSDK"
        ),

        // Mark: Binary Targets
        .binaryTarget(
            name: "RTBSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.10.1/RTBSDK.zip",
            checksum: "f307a1d917709eade3b88ccac3cee7442fd2dcc1cdb0f482cbb725e0f8ca9195"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.10.1/OMSDK_Addapptr.zip",
            checksum: "103b57212e169e5e5e146b909b57d53363b553b8001e4b151c91d6a9df2c1c09"
        ),
    ]
)
