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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.12.0-beta2/RTBSDK.zip",
            checksum: "1c7308b9f9081e20d40b8eed907691741a1f6c2181dca75daf45eafbdf7f0370"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.12.0-beta2/OMSDK_Addapptr.zip",
            checksum: "ba16bdef570f7b01f7bf4d6b561be49ecb94863f7c1bcd81738723e14ef27b33"
        ),
    ]
)
