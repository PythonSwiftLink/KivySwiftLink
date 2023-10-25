// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "KivySwiftLink",
	platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.

			.library(
				name: "PythonSwiftCore",
				targets: ["PythonSwiftCore"]
			),
		.library(
			name: "PySwiftObject",
			targets: ["PySwiftObject"]
		),
    ],
	dependencies: [
		.package(url: "https://github.com/PythonSwiftLink/KivyPythonCore", .upToNextMajor(from: .init(311, 0, 0))),
		//.package(path: "/Volumes/CodeSSD/XcodeGithub/KivyPythonCore")
	],
    targets: [

		.target(
			name: "PySwiftObject",
			dependencies: [
				//"PythonLib",
				"PythonSwiftCore",
			],
			resources: [
				
			],
			swiftSettings: [ .define("BEEWARE", nil)]
		),
		
		.target(
			name: "PythonSwiftCore",
			dependencies: [
				//"PythonLib",
				.product(name: "PythonCore", package: "KivyPythonCore"),
			],
			resources: [
				
			],
			swiftSettings: [ .define("BEEWARE", nil)]
		),

    ]
)
