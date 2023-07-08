//
//  RuleMaskView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/06.
//

import SwiftUI
import Charts

struct Pollen: Identifiable {
    var source: String
    var startDate: Date
    var endDate: Date
    let id = UUID()


    init(startMonth: Int, numMonths: Int, source: String) {
        self.source = source
        let calendar = Calendar.autoupdatingCurrent
        self.startDate = calendar.date(from: DateComponents(year: 2020, month: startMonth, day: 1))!
        self.endDate = calendar.date(byAdding: .month, value: numMonths, to: startDate)!
    }
}

private var data: [Pollen] = [
    Pollen(startMonth: 1, numMonths: 9, source: "Trees"),
    Pollen(startMonth: 12, numMonths: 1, source: "Trees"),
    Pollen(startMonth: 3, numMonths: 8, source: "Grass"),
    Pollen(startMonth: 4, numMonths: 8, source: "Weeds")
]

struct RuleMaskView: View {
    var body: some View {
        Chart(data) {
            RuleMark(
                xStart: .value("Start Date", $0.startDate),
                xEnd: .value("End Date", $0.endDate),
                y: .value("Pollen Source", $0.source)
            )
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}


struct RuleMaskView_Previews: PreviewProvider {
    static var previews: some View {
        RuleMaskView()
    }
}
