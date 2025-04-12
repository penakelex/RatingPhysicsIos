//
//  ListDataView.swift
//  RatingPhysicsIos
//
//  Created by Anna Klemeshova on 20.04.2025.
//

import SwiftUI

struct ListDataView: View {
    let header: String
    let data: [String]
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(self.header)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                
                Image(systemName: "chevron.down")
                    .padding(.trailing)
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
            }
            .frame(alignment: .leading)
            .onTapGesture {
                withAnimation(.linear(duration: 0.2)) {
                    isExpanded.toggle()
                }
            }
            
            if isExpanded {
                LazyVStack(alignment: .leading) {
                    ForEach(0..<data.count, id: \.self) { index in
                        ZStack {
                            Text("\(index + 1). ")
                                .fontWeight(.semibold)
                            + Text("\(data[index])")
                        }
                        .padding(.bottom, 0.5)
                    }
                }
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
    }
}

struct ListDataView_Previews: PreviewProvider {
    static var previews: some View {
        ListDataView(header: String(localized: "cgt_label"), data: ["10", "10", "5", "10", "3", "10", "7", "10", "10", "10", "10", "10"])
    }
}
