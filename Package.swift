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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.11.0-beta2/RTBSDK.zip",
            checksum: "68f36d5db5e1b9215aebde94638265069818b6665237e44b51cced4f430bd771"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.11.0-beta2/OMSDK_Addapptr.zip",
            checksum: "04c3f8ea8125fbb91e7ad82c840f336a39e272e58bbba47a1ed0e4ea305c2038"
        ),
    ]
)
