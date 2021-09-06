// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct LabelledStack<Content>: View where Content: View {
    let labelSpacing: GridItem
    let contentSpacing: GridItem
    let suffixSpacing: GridItem
    let context: LabelledGridContext
    @ViewBuilder let content: () -> Content
    
    public init(
        labelSpacing: GridItem = GridItem(.flexible()),
        contentSpacing: GridItem = GridItem(.flexible(), alignment: .leading),
        suffixSpacing: GridItem = GridItem(.fixed(0)),
        style: LabelledGridStyle = DefaultStyle.instance,
        @ViewBuilder content: @escaping () -> Content) {
            self.labelSpacing = labelSpacing
            self.contentSpacing = contentSpacing
            self.suffixSpacing = suffixSpacing
            self.context = LabelledGridContext(mode: .stack, style: style)
            self.content = content
        }
    
    public var body: some View {
        return VStack(alignment: .leading, content: content)
            .environmentObject(context)
    }
}

