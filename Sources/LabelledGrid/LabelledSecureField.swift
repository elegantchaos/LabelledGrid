// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 07/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct LabelledSecureField<Suffix>: View where Suffix: View {
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
            SecureField(placeholder, text: text)
                .modifier(LabelledFieldStyle())
        }, suffix: suffix)
    }
}

struct LabelledSecureField_Previews: PreviewProvider {
    class Context: ObservableObject {
        @Published var text = "blah"
    }

    struct CustomStyle: LabelledGridStyle {
        let padding: CGFloat = 0
        let hPadding: CGFloat = 0
        let background = Color(.red)
        let cornerRadius: CGFloat = 0
        let labelFont = Font.headline
        let labelColor = Color.blue
    }
    
    static var previews: some View {
        LabelledStack {
            LabelledSecureField("Test", icon: "tag", placeholder: "placeholder", text: .constant("Test"))
        }
        .padding()
        
        LabelledGrid {
            LabelledSecureField("Test", icon: "tag", placeholder: "placeholder", text: .constant("Test"))
        }
        .padding()

        LabelledGrid(style: CustomStyle()) {
            LabelledSecureField("Test", icon: "tag", placeholder: "placeholder", text: .constant("Test"))
        }
        .padding()

    }
}

