// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public protocol LabelledGridStyle {
    var padding: CGFloat { get }
    var hPadding: CGFloat { get }
    var background: Color { get }
    var cornerRadius: CGFloat { get }
}

public struct DefaultStyle: LabelledGridStyle {
    public static let instance = DefaultStyle()

    public let padding: CGFloat = 4
    public let hPadding: CGFloat = 16
    public let background = Color(.systemGray6)
    public let cornerRadius: CGFloat = 8

    public init() {
    }
}
