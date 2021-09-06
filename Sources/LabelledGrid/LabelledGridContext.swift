// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

protocol StyleContext {
    associatedtype textFieldStyle: ViewModifier
}

class LabelledGridContext: ObservableObject {
    enum Mode {
        case grid
        case stack
    }
    
    let mode: Mode
    let style: LabelledGridStyle

    init(mode: Mode, style: LabelledGridStyle = DefaultStyle()) {
        self.mode = mode
        self.style = style
    }
}
