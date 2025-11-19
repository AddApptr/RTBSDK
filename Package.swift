// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RTBSDK",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "RTBSPM", targets: ["RTBSDK", "RTBOMSDK"]),
        .library(name: "RTB_GraviteRTBAppLovinMediationAdapter", targets: ["RTB_GraviteRTBAppLovinMediationAdapter"]),
        .library(name: "RTB_GraviteRTBAdMobMediationAdapter", targets: ["RTB_GraviteRTBAdMobMediationAdapter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: Version(13, 4, 0)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: Version(12, 13, 0))
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
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.0/GraviteRTBAppLovinMediationAdapter.zip",
            checksum: "119fee07a1f9f65253d03653d9a53b59327067b97e644422c6194db801bdc4f1"
        ),
        .binaryTarget(
            name: "RTBSDK",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.0/RTBSDK.zip",
            checksum: "57e1bbd9239e63e63f9433c8f5c6ed0f9833e03ae4e7b0b7eb829755d1fe0686"
        ),
        .binaryTarget(
            name: "GraviteRTBAdMobMediationAdapter",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.0/GraviteRTBAdMobMediationAdapter.zip",
            checksum: "01bb33934c767f8491c09f1e2f6ae6461861cbff3fa32669afcf600fa8d3c226"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.0/OMSDK_Addapptr.zip",
            checksum: "76530e10b5fbc3fd83362f6b8e041d02aaa3b9d6f83004de1c12dbe4e8d31687"
        ),
    ]
)
