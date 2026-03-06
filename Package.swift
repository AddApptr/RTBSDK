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
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.3/GraviteRTBAppLovinMediationAdapter.zip",
            checksum: "d76629ab27d85678599ac77705cde21efa0b64879e3ae3dff748ca10ace7e4cd"
        ),
        .binaryTarget(
            name: "RTBSDK",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.3/RTBSDK.zip",
            checksum: "02932061cfaba7a83949f1f2bd65d45eb0dfedb8d974a67c40f599b4ae36131e"
        ),
        .binaryTarget(
            name: "GraviteRTBAdMobMediationAdapter",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.3/GraviteRTBAdMobMediationAdapter.zip",
            checksum: "b6158515887997a42beaa914572027e6a41603ab5d26cb80d69d788667845b88"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.9.3/OMSDK_Addapptr.zip",
            checksum: "3f80d4e8c33ee74ad565b5e62896852d8ca9db93d708efac961b61a08adb90da"
        ),
    ]
)
