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
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "InMobiAdapterTarget",
      targets: ["InMobiAdapterTarget", "InMobi-iOS-SDK"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "12.0.0"
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
        "https://dl.google.com/googleadmobadssdk/mediation/ios/inmobi/InMobiAdapter-10.8.6.0.zip",
      checksum: "3dcd1c6b2bc8ab0267642d3e9cc64be6f1cb8b353b64742effd56211d26d0450"
    ),
    .binaryTarget(
      name: "InMobi-iOS-SDK",
      url:
        "https://dl.inmobi.com/inmobi-sdk/IM/InMobi-iOS-SDK-10.8.6.zip",
      checksum: "ab0f05cd8aa0a7b1085a2b4f57f06ba27ae5dc310e1d9c1241011bba6ba98949"
    ),
  ]
)
