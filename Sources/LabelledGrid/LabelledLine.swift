// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct LabelledLine<Content, Suffix>: View where Suffix: View, Content: View  {
    @EnvironmentObject var context: LabelledGridContext

    public typealias ContentBuilder = () -> Content
    public typealias SuffixBuilder = () -> Suffix

    public let label: String
    public let icon: String
    @ViewBuilder public let content: ContentBuilder
    @ViewBuilder public let suffix: SuffixBuilder

    public init(_ label: String, icon: String, @ViewBuilder content: @escaping ContentBuilder, @ViewBuilder suffix: @escaping SuffixBuilder) {
        self.label = label
        self.icon = icon
        self.content = content
        self.suffix = suffix
    }

    public init(_ label: String, icon: String, @ViewBuilder content: @escaping ContentBuilder) where Suffix == Spacer {
        self.init(label, icon: icon, content: content) {
            Spacer()
        }
    }

    public init(_ label: String, icon: String, suffix: String, @ViewBuilder content: @escaping ContentBuilder) where Suffix == Text {
        self.init(label, icon: icon, content: content) {
            Text(suffix)
        }
    }

    public var body: some View {
        let style = context.style
        Group {
            Label(label, systemImage: icon)
                .foregroundColor(style.labelColor)
                .font(style.labelFont)
            
            switch context.mode {
                case .grid:
                    content()
                    suffix()
                    
                case .stack:
                    HStack {
                        content()
                        Spacer()
                        suffix()
                    }
                    .padding(.leading)
                    .padding(.bottom)
            }
        }
    }
    
}

struct LabelledLine_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("As Stack")
            LabelledStack {
                LabelledLine("Test", icon: "tag") { Text("Hello") }
                LabelledLine("Test", icon: "tag" ) { Text("Hello") } suffix: { Image(systemName: "tag") }
            }
            .padding()

            Text("As Grid")
            LabelledGrid {
                LabelledLine("Test", icon: "tag") { Text("Hello") }
            }
            .padding()
            .labelStyle(.iconOnly)

        }
        .frame(maxWidth: .infinity)
    }
}


