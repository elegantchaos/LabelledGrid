// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct LabelledLine<Content, Suffix>: View where Suffix: View, Content: View  {
    public typealias ContentBuilder = () -> Content
    public typealias SuffixBuilder = () -> Suffix

    public let label: String
    public let icon: String
    @ViewBuilder public let content: ContentBuilder
    @ViewBuilder public let suffix: SuffixBuilder

    public init(_ label: String, icon: String, content: @escaping ContentBuilder, suffix: @escaping SuffixBuilder) {
        self.label = label
        self.icon = icon
        self.content = content
        self.suffix = suffix
    }

    public init(_ label: String, icon: String, content: @escaping ContentBuilder) where Suffix == Spacer {
        self.init(label, icon: icon, content: content) {
            Spacer()
        }
    }

    public init(_ label: String, icon: String, suffix: String, content: @escaping ContentBuilder) where Suffix == Text {
        self.init(label, icon: icon, content: content) {
            Text(suffix)
        }
    }

    public var body: some View {
        Group {
            Label(label, systemImage: icon)
            content()
            suffix()
        }
    }
    
}
