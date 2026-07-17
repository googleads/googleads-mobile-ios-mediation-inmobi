// swift-tools-version:5.6

// Copyright 2026 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "InMobiAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "InMobiAdapterTarget",
      targets: ["InMobiAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/InMobi/InMobiSDK-Swift-Package.git",
      exact: "11.4.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
    ),
  ],
  targets: [
    .target(
      name: "InMobiAdapterTarget",
      dependencies: [
        .target(name: "InMobiAdapter"),
        .product(name: "InMobiSDK", package: "InMobiSDK-Swift-Package"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "InMobiAdapterTarget"
    ),
    .binaryTarget(
      name: "InMobiAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/inmobi/InMobiAdapter-11.4.0.0.zip",
      checksum: "3454d8bb92fc75c2eb5391d461c693b2b02ef4a5c9b645e6297d0fa7cc0e9af2"
    ),
  ]
)
