//
//  CoursesView.swift
//  SwiftUI2.0
//
//  Created by Quốc Huy Nguyễn on 7/12/23.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    @Namespace var namespace
    @Namespace var namespace2
    var body: some View {
        ZStack {
            content
            fullContent
        }
        .navigationTitle("Courses")
    }

    @ViewBuilder
    var content: some View {
        ScrollView {
            VStack(spacing: 0) {
//                Text("Courses")
//                    .font(.largeTitle)
//                    .bold()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 16)
//                    .padding(.top, 54)
                LazyVGrid(columns: [.init(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                Text("Latest sections")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                LazyVGrid(columns: [.init(.adaptive(minimum: 240))]) {
                    ForEach(courseSections) { item in
                        NavigationLink {
                            CourseDetail(namespace: namespace2)
                        } label: {
                            CourseRow(item: item)
                        }
                    }
                }
                .padding()
            }
        }
        .zIndex(1)
    }

    @ViewBuilder
    var fullContent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                CourseDetail(course: selectedItem!, namespace: namespace)
                CloseButton()
                    .padding(16)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isDisabled = false
                            }
                        }
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 712)
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
