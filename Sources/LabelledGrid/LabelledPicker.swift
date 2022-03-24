// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Labelled
import LabelledKit
import SwiftUI

public protocol LabelledPickerValue: Labelled, Hashable, Identifiable {
}

public struct LabelledPicker<Value, Suffix>: View where Value: LabelledPickerValue, Suffix: View {
    public typealias SuffixBuilder = () -> Suffix

    let label: String
    let icon: String
    let currentValue: Binding<Value>
    let possibleValues: [Value]
    @ViewBuilder public let suffix: SuffixBuilder

    public init(_ label: String, icon: String, value: Binding<Value>, values: [Value], @ViewBuilder suffix: @escaping SuffixBuilder) {
        self.label = label
        self.icon = icon
        self.currentValue = value
        self.possibleValues = values
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
        return LabelledLine(label, icon: icon, content: {
            Picker(selection: currentValue) {
                ForEach(possibleValues) { value in
                    SimpleLabel(value)
                        .tag(value)
                }
            } label: {
                Label(currentValue.wrappedValue)
            }
            .modifier(LabelledPickerStyle())
        }, suffix: suffix)
    }

}
