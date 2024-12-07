import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: DomainModule.BookDetailDomain.name,
    settings: .Module.default,
    targets: [
        .interface(
            domain: .BookDetailDomain,
            dependencies: []
        ),
        .implementation(
            domain: .BookDetailDomain,
            dependencies: [
                .SPM.swinject,
                .core(target: .UserAPICore, type: .interface),
                .domain(target: .BookDetailDomain, type: .interface),
            ]
        ),
        .testing(
            domain: .BookDetailDomain,
            dependencies: [
                .domain(target: .BookDetailDomain, type: .interface),
            ]
        ),
        .tests(
            domain: .BookDetailDomain,
            dependencies: [
                .domain(target: .BookDetailDomain, type: .implementation),
                .domain(target: .BookDetailDomain, type: .testing),
            ]
        ),
    ]
)
