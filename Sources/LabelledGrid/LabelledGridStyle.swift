// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 06/09/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public protocol LabelledGridStyle {
    var labelColor: Color { get }
    var labelFont: Font { get }
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
    public var labelColor: Color { Color.primary.opacity(0.8) }
    public var labelFont: Font { Font.body }

    public init() {
    }
}
