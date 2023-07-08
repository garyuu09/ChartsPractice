//
//  BarMarkView2.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/08.
//

import SwiftUI
import Charts

struct Item: Identifiable {
    let id = UUID()
    let price: Int
    let fruitName: String
}

let item:[Item] = [
    Item(price: 100, fruitName: "apple"),
    Item(price: 50, fruitName: "orange"),
    Item(price: 200, fruitName: "Banana")
]

struct BarMarkView2: View {
    var body: some View {
        Chart(item) { element in
            BarMark(
                x: .value("Fruit", element.fruitName),
                y: .value("Price", element.price)
            )
//            .foregroundStyle(by: .value("Product Category", element.fruitName))
        }
//        Chart {
//            BarMark(
//                x: .value("Fruit", "りんご"),
//                y: .value("Price", 100)
//            )
//            BarMark(
//                x: .value("fruit", "オレンジ"),
//                y: .value("Price", 50)
//            )
//            BarMark(
//                x: .value("fruit", "バナナ"),
//                y: .value("Price", 200)
//            )
//        }
        .padding()
        .frame(height: 300)
    }
}

struct BarMarkView2_Previews: PreviewProvider {
    static var previews: some View {
        BarMarkView2()
    }
}
