//
//  CourseList.swift
//  SwiftUI2.0
//
//  Created by Quốc Huy Nguyễn on 7/12/23.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    var content: some View {
        List(0..<20) { item in
            CourseRow()
        }
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
