// swift-tools-version:6.0
import PackageDescription

let package:Package = .init(name: "swift-rlp-example",
    platforms: [.macOS(.v15), .iOS(.v18), .tvOS(.v18), .visionOS(.v2), .watchOS(.v11)],
    products: [
        .library(name: "KrabbyPatty", type: .dynamic, targets: ["KrabbyPatty"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "KrabbyPatty",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"]),
            ]),
    ]
)

for target:PackageDescription.Target in package.targets
{
    {
        var settings:[PackageDescription.SwiftSetting] = $0 ?? []

        settings.append(.enableUpcomingFeature("ExistentialAny"))
        settings.append(.enableExperimentalFeature("StrictConcurrency"))

        $0 = settings
    } (&target.swiftSettings)
}
