//
//  LibraryContent.swift
//  SwiftUI2.0
//
//  Created by Quốc Huy Nguyễn on 7/13/23.
//

import SwiftUI

struct LibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(CloseButton(), title: "Close Button View", category: .control)
    }
    
    @LibraryContentBuilder
    func modifiers(base: some View) -> [LibraryItem] {
        LibraryItem(base.cardStyle(color: .blue, cornerRadius: 22), title: "Card Style", category: .effect)
    }
}

extension View {
    func cardStyle(color: Color, cornerRadius: CGFloat) -> some View {
        return self
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}
