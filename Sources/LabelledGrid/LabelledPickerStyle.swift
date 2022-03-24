// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct LabelledPickerStyle: ViewModifier {
    @EnvironmentObject var context: LabelledGridContext
    
    public func body(content: Content) -> some View {
        content
        #if os(tvOS)
            .pickerStyle(DefaultPickerStyle())
        #else
            .pickerStyle(.menu)
        #endif
    }
}

