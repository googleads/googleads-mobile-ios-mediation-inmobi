// swift-tools-version:5.3

// Copyright 2025 Google LLC.
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
      targets: ["InMobiAdapterTarget", "InMobi-iOS-SDK"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
    )
  ],
  targets: [
    .target(
      name: "InMobiAdapterTarget",
      dependencies: [
        .target(name: "InMobiAdapter"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "InMobiAdapterTarget"
    ),
    .binaryTarget(
      name: "InMobiAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/inmobi/InMobiAdapter-11.2.0.1.zip",
      checksum: "081dc9237ed0ff3cb8003dc7ee89adcb881da5dad5b2f4fc715a86dbb47d6328"
    ),
    .binaryTarget(
      name: "InMobi-iOS-SDK",
      url:
        "https://dl.inmobi.com/inmobi-sdk/IM/InMobi-iOS-SDK-11.2.0.zip",
      checksum: "6013c4f6d5bb170f9a4931512e1f9623b5b3ed3a5ed59a442c6c234665af4e89"
    ),
  ]
)
