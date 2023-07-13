//
//  CourseDetail.swift
//  SwiftUI2.0
//
//  Created by Quốc Huy Nguyễn on 7/13/23.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course = courses[0]
    var namespace: Namespace.ID
    @State var showModel: Bool = false
    var body: some View {
        content
            .ignoresSafeArea()
    }

    var content: some View {
        VStack {
            ScrollView {
                CourseItem(course: course)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                VStack {
                    ForEach(courseSections) { courseSection in
                        CourseRow(item: courseSection)
                            .sheet(isPresented: $showModel) {
                                CourseSectionDetail()
                            }
                            .onTapGesture {
                                showModel = true
                            }
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetail(namespace: namespace)
    }
}
