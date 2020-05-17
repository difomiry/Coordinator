// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "Coordinator",
  products: [
    .library(
      name: "Coordinator",
      targets: ["Coordinator"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Coordinator",
      dependencies: [],
      path: "Sources"),
  ]
)
