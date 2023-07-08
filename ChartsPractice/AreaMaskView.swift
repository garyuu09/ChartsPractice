//
//  AreaMaskView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/06.
//

import SwiftUI
import Charts


let cheeseburgerCost: [Food] = [
    .init(name: "Cheeseburger", price: 0.15, year: 1960),
    .init(name: "Cheeseburger", price: 0.20, year: 1970),
    .init(name: "Cheeseburger", price: 0.25, year: 1980),
    .init(name: "Cheeseburger", price: 0.30, year: 1990),
    .init(name: "Cheeseburger", price: 0.70, year: 2000),
    .init(name: "Cheeseburger", price: 0.80, year: 2010),
    .init(name: "Cheeseburger", price: 1.10, year: 2020)
]


struct Food: Identifiable {
    let name: String
    let price: Double
    let date: Date
    let id = UUID()

    init(name: String, price: Double, year: Int) {
        self.name = name
        self.price = price
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: year))!
    }
}

struct AreaMaskView: View {
    var body: some View {
        Chart(cheeseburgerCost) {
            AreaMark(
                x: .value("Date", $0.date),
                y: .value("Price", $0.price)
            )
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

struct AreaMaskView_Previews: PreviewProvider {
    static var previews: some View {
        AreaMaskView()
    }
}
