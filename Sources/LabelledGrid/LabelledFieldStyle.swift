// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct LabelledFieldStyle: ViewModifier {
    @EnvironmentObject var context: LabelledGridContext
    
    public func body(content: Content) -> some View {
        content
            .padding(context.style.padding)
            .padding(.horizontal, context.style.hPadding)
            .background(context.style.background)
            .cornerRadius(context.style.cornerRadius)
    }
}
