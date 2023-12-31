//
//  Sidebar.swift
//  SwiftUI2.0
//
//  Created by Quốc Huy Nguyễn on 7/12/23.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
            .navigationTitle("Learn")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "person.crop.circle")
                }
            }
            #else
            content.frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            #endif
            CoursesView()
        }
    }
    var content: some View {
        List {
            NavigationLink {
                CoursesView()
            } label: {
                Label("Courses", systemImage: "book.closed")
            }
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("Livestreams", systemImage: "tv")
            Label("Certificates", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
        }
        .listStyle(.sidebar)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
            .previewDevice("iPhone 14 Pro Max")
    }
}
