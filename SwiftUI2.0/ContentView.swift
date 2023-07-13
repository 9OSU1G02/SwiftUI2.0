//
//  ContentView.swift
//  SwiftUI2.0
//
//  Created by Quốc Huy Nguyễn on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    var body: some View {
        #if os(iOS)
        VStack {
            if horizontalSizeClass == .compact {
                TabBar()
            } else {
                Sidebar()
            }
        }
        #else
        Sidebar()
            .frame(minWidth: 1000, minHeight: 600)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
