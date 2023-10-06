// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//var pythonLibDeps: [Target.Dependency] = [
//	"libcrypto",
//	"libpython3.10",
//	"libffi",
//	"libfreetype",
//	"libios",
//	"libjpeg",
//	"libkivy",
//	"libpillow",
//	"libpng16",
//	"libpyobjus",
//	"libSDL2_image",
//	"libSDL2_mixer",
//	"libSDL2_ttf",
//	"libSDL2",
//]

//pythonLibDeps.append("libssl")


let package = Package(
    name: "KivySwiftLink",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
//        .library(
//            name: "KPythonSwiftLink",
//            targets: ["KPythonSwiftLink", "PythonLib"]),
		.library(name: "KivyLauncher", targets: ["KivyLauncher"]),
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
		.package(url: "https://github.com/PythonSwiftLink/KivyCore", from: .init(0, 0, 0)),
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "KivyLauncher",
			dependencies: [
				"PythonSwiftCore",
				//"PythonLib",
				//.product(name: "KivyPackage", package: "KivyPackage"),
				"PySwiftObject"
			]
			//resources: [.copy("lib")]
		),
		
		.target(
			name: "PySwiftObject",
			dependencies: [
				//"PythonLib",
				//.product(name: "KivyPackage", package: "KivyPackage"),
				"PythonSwiftCore",
				//"PythonTypeAlias"
			],
			resources: [
				
			],
			swiftSettings: [ .define("BEEWARE", nil)]
		),
		
		.target(
			name: "PythonSwiftCore",
			dependencies: [
				//"PythonLib",
				.product(name: "KivyCore", package: "KivyCore", moduleAliases: ["KivyCore": "PythonLib"]),
				//"PythonTypeAlias"
			],
			resources: [
				
			],
			swiftSettings: [ .define("BEEWARE", nil)]
		),

    ]
)
