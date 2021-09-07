// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Labelled
import SwiftUI

public protocol LabelledPickerValue: Labelled, Hashable, Identifiable {
}

public struct LabelledPicker<Value, Suffix>: View where Value: LabelledPickerValue, Suffix: View {
    public typealias SuffixBuilder = () -> Suffix

    let label: String
    let icon: String
    let value: Binding<Value>
    let values: [Value]
    @ViewBuilder public let suffix: SuffixBuilder

    public init(_ label: String, icon: String, value: Binding<Value>, values: [Value], @ViewBuilder suffix: @escaping SuffixBuilder) {
        self.label = label
        self.icon = icon
        self.value = value
        self.values = values
        self.suffix = suffix
    }

    public init(_ label: String, icon: String, value: Binding<Value>, values: [Value]) where Suffix == Spacer {
        self.init(label, icon: icon, value: value, values: values) {
            Spacer()
        }
    }

    public init(_ label: String, icon: String, value: Binding<Value>) where Suffix == Spacer, Value: CaseIterable {
        self.init(label, icon: icon, value: value, values: Array(Value.allCases)) {
            Spacer()
        }
    }

    public var body: some View {
        LabelledLine(label, icon: icon, content: {
            Picker(selection: value) {
                ForEach(values) { value in
                    if value.labelIcon.isEmpty {
                        Text(value.labelName)
                    } else {
                        value.label
                    }
                }
            } label: {
                let value = value.wrappedValue
                if value.labelIcon.isEmpty {
                    Text(value.labelName)
                } else {
                    value.label
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
            .modifier(LabelledPickerStyle())
        }, suffix: suffix)
    }

}
