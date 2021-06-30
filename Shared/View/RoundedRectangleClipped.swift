import SwiftUI

struct RoundedRectangleClipped: ViewModifier {
    
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content.clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension View {
    func roundedRectangleClipped(cornerRadius: CGFloat = 10) -> some View {
        self.modifier(RoundedRectangleClipped(cornerRadius: cornerRadius))
    }
}
