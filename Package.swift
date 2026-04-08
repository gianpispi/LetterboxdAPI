// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "LetterboxdAPI",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "LetterboxdAPI",
      targets: ["LetterboxdAPI"]
    ),
  ],
  targets: [
    .target(name: "LetterboxdAPI"),
    .testTarget(
      name: "LetterboxdAPITests",
      dependencies: ["LetterboxdAPI"]
    ),
  ]
)
