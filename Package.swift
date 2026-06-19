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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.10.0-beta2/RTBSDK.zip",
            checksum: "d371a008da72aa7a35030491a94a44bcc4ac1b978a36b85f3898fa88bea4e5c0"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.10.0-beta2/OMSDK_Addapptr.zip",
            checksum: "ee525373d6bb339089cce989c1257e2ad147af27600d1a36f3e4a1e6dff82d6d"
        ),
    ]
)
