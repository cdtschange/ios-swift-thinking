//
//  KeypathsBootcamp.swift
//  SwiftThinking
//
//  Created by 毛蔚 on 2023/12/3.
//

import SwiftUI

struct MyDataModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let count: Int
    let date: Date
}

extension Array {
    mutating func sortByKeyPath<T: Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) {
        self.sort { item1, item2 in
            let value1 = item1[keyPath: keyPath]
            let value2 = item2[keyPath: keyPath]
            return ascending ? value1 < value2 : value1 > value2
        }
    }
    
    func sortedByKeyPath<T: Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        self.sorted { item1, item2 in
            let value1 = item1[keyPath: keyPath]
            let value2 = item2[keyPath: keyPath]
            return ascending ? value1 < value2 : value1 > value2
        }
    }
}

struct KeypathsBootcamp: View {
    
//    @Environment(\.dismiss) var dismiss
    @AppStorage("user_count") var userCount: Int = 0
    @State private var dataArray: [MyDataModel] = []
    
    var body: some View {
        List {
            ForEach(dataArray) { item in
                VStack(alignment: .leading) {
                    Text(item.id)
                    Text(item.title)
                    Text("\(item.count)")
                    Text(item.date.description)
                }
                .font(.headline)
            }
        }
            .onAppear {
                let array = [
                    MyDataModel(title: "Three", count: 3, date: .distantFuture),
                    MyDataModel(title: "One", count: 1, date: .now),
                    MyDataModel(title: "Two", count: 2, date: .distantPast),
                ]
                
//                let newArray = array.sorted { item1, item2 in
//                    item1[keyPath: \.count] < item2[keyPath: \.count]
//                }
                dataArray = array.sortedByKeyPath(\.count, ascending: false)
            }
    }
}

#Preview {
    KeypathsBootcamp()
}
