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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.11.0/RTBSDK.zip",
            checksum: "26ffded963d04b74fe707d6c523ce0e904e21ef989e338fdef2dbdb83644c176"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.11.0/OMSDK_Addapptr.zip",
            checksum: "e5ef3f8b29c17a44c39a42730c6822f2803f9d7ac7b6dfcaae05eed2b9b67c44"
        ),
    ]
)
