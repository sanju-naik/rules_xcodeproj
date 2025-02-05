import ArgumentParser
import XCScheme

/// Provides information needed to create a scheme.
struct SchemeInfo: Equatable {
    struct ExecutionAction: Equatable {
        enum Action: String, ExpressibleByArgument {
            case build
            case test
            case run
            case profile
        }

        let title: String
        let scriptText: String
        let action: Action
        let isPreAction: Bool
        let target: Target
        let order: Int?
    }

    enum LaunchTarget: Equatable {
        case target(primary: Target, extensionHost: Target?)
        case path(String)
    }

    struct Profile: Equatable {
        let buildTargets: [Target]
        let commandLineArguments: [CommandLineArgument]
        let customWorkingDirectory: String?
        let environmentVariables: [EnvironmentVariable]
        let launchTarget: LaunchTarget?
        let useRunArgsAndEnv: Bool
        let xcodeConfiguration: String?
    }

    struct Test: Equatable {
        let buildTargets: [Target]
        let commandLineArguments: [CommandLineArgument]
        let enableAddressSanitizer: Bool
        let enableThreadSanitizer: Bool
        let enableUBSanitizer: Bool
        let environmentVariables: [EnvironmentVariable]
        let testTargets: [TestTarget]
        let useRunArgsAndEnv: Bool
        let xcodeConfiguration: String?
    }

    struct TestTarget: Equatable {
        let target: Target
        let enabled: Bool
    }

    struct Run: Equatable {
        let buildTargets: [Target]
        let commandLineArguments: [CommandLineArgument]
        let customWorkingDirectory: String?
        let enableAddressSanitizer: Bool
        let enableThreadSanitizer: Bool
        let enableUBSanitizer: Bool
        let environmentVariables: [EnvironmentVariable]
        let launchTarget: LaunchTarget?
        let transitivePreviewReferences: [BuildableReference]
        let xcodeConfiguration: String?
    }

    let name: String
    let test: Test
    let run: Run
    let profile: Profile
    let executionActions: [ExecutionAction]
}
