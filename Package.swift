// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RTBSDK",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "RTBSDK", targets: ["RTBSDK", "RTBOMSDK"]),
        .library(name: "RTB_GraviteRTBAppLovinMediationAdapter", targets: ["RTB_GraviteRTBAppLovinMediationAdapter"]),
        .library(name: "RTB_GraviteRTBAdMobMediationAdapter", targets: ["RTB_GraviteRTBAdMobMediationAdapter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: Version(13, 5, 1)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: Version(12, 14, 0))
    ],
    targets: [
        .target(name:"RTBOMSDK",
                dependencies: ["OMSDK_Addapptr"],
                path: "./Sources/RTB_OMSDK"),
        // GraviteRTBAppLovinMediationAdapter target
        .target(name:"RTB_GraviteRTBAppLovinMediationAdapter",
                dependencies: [
                    .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                    "RTBSDK",
                    "RTBOMSDK",
                    "GraviteRTBAppLovinMediationAdapter",
                ],
                path: "./Sources/GraviteRTBAppLovinMediationAdapter"),

        // GraviteRTBAdMobMediationAdapter target
        .target(name:"RTB_GraviteRTBAdMobMediationAdapter",
                dependencies: [
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "RTBSDK",
                    "RTBOMSDK",
                    "GraviteRTBAdMobMediationAdapter"
                ],
                path: "./Sources/GraviteRTBAdMobMediationAdapter"),

        // Mark: Binary Targets
        .binaryTarget(
            name: "GraviteRTBAppLovinMediationAdapter",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.4/GraviteRTBAppLovinMediationAdapter.zip",
            checksum: "c88b4a8b1a690fb0c522bb1cf295303e7f816c6eb12d5241e26c9d9de0c70533"
        ),
        .binaryTarget(
            name: "RTBSDK",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.4/RTBSDK.zip",
            checksum: "96b8862241455dd8fd213d5f163eb45f1513614171a64fa56929e1a137feb599"
        ),
        .binaryTarget(
            name: "GraviteRTBAdMobMediationAdapter",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.4/GraviteRTBAdMobMediationAdapter.zip",
            checksum: "3fc77440efeaf6072e06c71524e974c56ff0097d0d9497129e4ad825ddc06575"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.4/OMSDK_Addapptr.zip",
            checksum: "427eec243cdb57e528649258bab704d8a534cef149769d3888a41840ed08b6c9"
        ),
    ]
)
