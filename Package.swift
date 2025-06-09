// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "iTVApp",
    platforms: [
        .tvOS(.v17)
    ],
    products: [
        .executable(name: "iTVApp", targets: ["iTVApp"])
    ],
    targets: [
        .executableTarget(
            name: "iTVApp",
            path: "Sources/iTVApp"
        )
    ]
)
