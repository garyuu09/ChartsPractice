//
//  ScreenTimeWidgetView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/06.
//

import SwiftUI
import Charts

struct ProfitByCategory: Identifiable {
    let department: String
    let profit: Double
    let productCategory: String
    let id = UUID()
}

private let data: [ProfitByCategory] = [
    ProfitByCategory(department: "Production", profit: 4000, productCategory: "Gizmos"),
    ProfitByCategory(department: "Production", profit: 5000, productCategory: "Gadgets"),
    ProfitByCategory(department: "Production", profit: 6000, productCategory: "Widgets"),
    ProfitByCategory(department: "Marketing", profit: 2000, productCategory: "Gizmos"),
    ProfitByCategory(department: "Marketing", profit: 1000, productCategory: "Gadgets"),
    ProfitByCategory(department: "Marketing", profit: 5000, productCategory: "Widgets"),
    ProfitByCategory(department: "Finance", profit: 2000, productCategory: "Gizmos"),
    ProfitByCategory(department: "Finance", profit: 3000, productCategory: "Gadgets"),
    ProfitByCategory(department: "Finance", profit: 5000, productCategory: "Widgets")
]

struct ScreenTimeWidgetView: View {
    var body: some View {
        Chart(data) {
            BarMark(
                x: .value("Category", $0.department),
                y: .value("Profit", $0.profit)
            )
            .foregroundStyle(by: .value("Product Category", $0.productCategory))
        }
    }
}


struct ScreenTimeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTimeWidgetView()
    }
}
