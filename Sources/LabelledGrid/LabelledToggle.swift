// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct LabelledToggle<Suffix>: View where Suffix: View {
    public typealias SuffixBuilder = () -> Suffix

    let label: String
    let icon: String
    let prompt: String
    let value: Binding<Bool>
    @ViewBuilder public let suffix: SuffixBuilder

    public init(_ label: String, icon: String, prompt: String = "", value: Binding<Bool>, @ViewBuilder suffix: @escaping SuffixBuilder) {
        self.label = label
        self.icon = icon
        self.prompt = prompt
        self.value = value
        self.suffix = suffix
    }

    public init(_ label: String, icon: String, prompt: String = "", value: Binding<Bool>) where Suffix == Spacer {
        self.init(label, icon: icon, prompt: prompt, value: value) {
            Spacer()
        }
    }

    public var body: some View {
        LabelledLine(label, icon: icon, content: {
            Toggle(prompt, isOn: value)
                .modifier(LabelledToggleStyle())
        }, suffix: suffix)
    }

}
