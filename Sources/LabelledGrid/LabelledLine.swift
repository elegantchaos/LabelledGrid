// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

struct LabelledLine<Content, Suffix>: View where Content: View, Suffix: View {
    typealias ContentBuilder = () -> Content
    typealias SuffixBuilder = () -> Suffix

    let label: String
    let icon: String
    @ViewBuilder let content: ContentBuilder
    @ViewBuilder let suffix: SuffixBuilder?

    internal init(_ label: String, icon: String, content: @escaping ContentBuilder, suffix: SuffixBuilder? = nil) {
        self.label = label
        self.icon = icon
        self.content = content
        self.suffix = suffix
    }

    internal init(_ label: String, icon: String, suffix: String? = nil, content: @escaping ContentBuilder) {
        let sb: SuffixBuilder?
        if let suffix = suffix {
            sb = { Text(suffix) } as! SuffixBuilder
        } else {
            sb = nil
        }

        self.init(label, icon: icon, content: content, suffix: sb)
    }

    var body: some View {
        Group {
            Label(label, systemImage: icon)
            content()
            if suffix {
                Suffix()
            } else {
                Spacer()
            }
        }
    }
}
