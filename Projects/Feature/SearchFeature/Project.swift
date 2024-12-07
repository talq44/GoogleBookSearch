import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: FeatureModule.SearchFeature.name,
    settings: .Module.default,
    targets: [
        .interface(
            feature: .SearchFeature,
            dependencies: []
        ),
        .implementation(
            feature: .SearchFeature,
            dependencies: [
                .SPM.snapKit,
                .SPM.fakery,
                .SPM.swinject,
                .feature(target: .SearchFeature, type: .interface),
                .domain(target: .SearchListDomain, type: .interface),
                .shared(target: .ReactiveXShared),
                .shared(target: .DesignSystem),
            ]
        ),
        .testing(
            feature: .SearchFeature,
            dependencies: [
                .feature(target: .SearchFeature, type: .interface),
            ]
        ),
        .tests(
            feature: .SearchFeature,
            dependencies: [
                .feature(target: .SearchFeature, type: .implementation),
                .feature(target: .SearchFeature, type: .testing),
            ]
        ),
        .demo(
            feature: .SearchFeature,
            dependencies: [
                .SPM.swinject,
                .feature(target: .SearchFeature, type: .implementation),
                .feature(target: .SearchFeature, type: .testing),
                .domain(target: .SearchListDomain, type: .implementation),
                .core(target: .UserAPICore, type: .implementation),
            ]
        ),
        .preview(
            feature: .SearchFeature,
            dependencies: [
                .SPM.snapKit,
                .SPM.fakery,
                .feature(target: .SearchFeature, type: .interface),
                .domain(target: .SearchListDomain, type: .interface),
                .shared(target: .ReactiveXShared),
                .shared(target: .DesignSystem),
            ]
        ),
    ]
)
