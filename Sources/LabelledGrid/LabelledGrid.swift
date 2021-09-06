// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/2021.
//  All code (c) 2021 - present day, Elegant Chaos.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct LabelledGrid<Content>: View where Content: View {
    let labelSpacing: GridItem
    let contentSpacing: GridItem
    let suffixSpacing: GridItem
    @ViewBuilder let content: () -> Content
    
    public init(
        labelSpacing: GridItem = GridItem(.flexible()),
        contentSpacing: GridItem = GridItem(.flexible(), alignment: .leading),
        suffixSpacing: GridItem = GridItem(.fixed(0)),
        @ViewBuilder content: @escaping () -> Content) {
            self.labelSpacing = labelSpacing
            self.contentSpacing = contentSpacing
            self.suffixSpacing = suffixSpacing
            self.content = content
        }
    
    public var body: some View {
        let columns = [labelSpacing, contentSpacing, suffixSpacing]
        
        return LazyVGrid(columns: columns, content: content)
    }
}
