// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct LabelledField<Suffix>: View where Suffix: View {
    public typealias SuffixBuilder = () -> Suffix

    let label: String
    let icon: String
    let placeholder: String
    let text: Binding<String>
    @ViewBuilder public let suffix: SuffixBuilder

    public init(_ label: String, icon: String, placeholder: String, text: Binding<String>, @ViewBuilder suffix: @escaping SuffixBuilder) {
        self.label = label
        self.icon = icon
        self.placeholder = placeholder
        self.text = text
        self.suffix = suffix
    }

    public init(_ label: String, icon: String, placeholder: String, text: Binding<String>) where Suffix == Spacer {
        self.init(label, icon: icon, placeholder: placeholder, text: text) {
            Spacer()
        }
    }

    public var body: some View {
        LabelledLine(label, icon: icon, content: {
            TextField(placeholder, text: text)
                .modifier(LabelledFieldStyle())
        }, suffix: suffix)
    }
}

struct LabelledField_Previews: PreviewProvider {
    class Context: ObservableObject {
        @Published var text = "blah"
    }

    struct CustomStyle: LabelledGridStyle {
        let padding: CGFloat = 0
        let hPadding: CGFloat = 0
        let background = Color(.red)
        let cornerRadius: CGFloat = 0
    }
    
    static var previews: some View {
        LabelledStack {
            LabelledField("Test", icon: "tag", placeholder: "placeholder", text: .constant("Test"))
        }
        .padding()
        
        LabelledGrid {
            LabelledField("Test", icon: "tag", placeholder: "placeholder", text: .constant("Test"))
        }
        .padding()

        LabelledGrid(style: CustomStyle()) {
            LabelledField("Test", icon: "tag", placeholder: "placeholder", text: .constant("Test"))
        }
        .padding()

    }
}

