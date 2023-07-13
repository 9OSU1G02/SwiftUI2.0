//
//  CourseRow.swift
//  SwiftUI2.0
//
//  Created by Quốc Huy Nguyễn on 7/12/23.
//

import SwiftUI

struct CourseRow: View {
    var item: CourseSection = courseSections[0]
    var body: some View {
        HStack(alignment: .top) {
            Image(item.logo)
                .renderingMode(.original)
                .frame(width: 48, height: 48)
                .background(item.color)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.title)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.primary)
                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
