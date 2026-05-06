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
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git" , "13.4.0"..<"13.6.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", "13.3.0"..<"13.4.0")
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
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.6/GraviteRTBAppLovinMediationAdapter.zip",
            checksum: "7b81fd1e69654f5f91345262aa4eb9e7673f53caa856d199f8b64efbd6002d62"
        ),
        .binaryTarget(
            name: "RTBSDK",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.6/RTBSDK.zip",
            checksum: "0f263bd70c4bc5cf5af5492c47a56848ca2cf7b580f50a9e86f95c1942f91017"
        ),
        .binaryTarget(
            name: "GraviteRTBAdMobMediationAdapter",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.6/GraviteRTBAdMobMediationAdapter.zip",
            checksum: "61c627d7be3d48290842303f9af726a91a92223314bb8e88124311ac5629cf0c"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.6/OMSDK_Addapptr.zip",
            checksum: "888065d1328a405ad2ebdb040a5c1d8d8da6fd89e5ba94b2b6fc72f1baf4a3ac"
        ),
    ]
)
