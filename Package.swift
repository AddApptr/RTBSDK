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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.9.7/GraviteRTBAppLovinMediationAdapter.zip",
            checksum: "60a875969ae347c4b177bb5a640bea98faa2bbb10aded3fe7e301c8068e5f06e"
        ),
        .binaryTarget(
            name: "RTBSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.9.7/RTBSDK.zip",
            checksum: "ca265d72eaf0af6a7e66f83d1c9513f701710f2194434aefe3718b9ceb9b2c29"
        ),
        .binaryTarget(
            name: "GraviteRTBAdMobMediationAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.9.7/GraviteRTBAdMobMediationAdapter.zip",
            checksum: "9d430c463b57c7727e0aafd84243fc67c8516993883d32f9b90a7144af00c9e0"
        ),
        .binaryTarget(
            name: "OMSDK_Addapptr",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.9.7/OMSDK_Addapptr.zip",
            checksum: "10b3a9872b048c41431d39ac0ff51395f8265e3270d088850111b1a92ebc685f"
        ),
    ]
)
