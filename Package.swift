// swift-tools-version:5.10
import PackageDescription

let package = Package(
  name: "PopOverDatePicker",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "PopOverDatePicker",
      targets: ["PopOverDatePicker"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
        name: "PopOverDatePicker",
        dependencies: [],
        path: "Sources"
    ),
    .testTarget(
      name: "PopOverDatePickerTests",
      dependencies: ["PopOverDatePicker"]),
  ]
)
