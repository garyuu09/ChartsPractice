//
//  LineMaskView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/06.
//

import SwiftUI
import Charts


struct MonthlyHoursOfSunshine: Identifiable {
    var date: Date
    var hoursOfSunshine: Double
    let id = UUID()

    init(month: Int, hoursOfSunshine: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
        self.hoursOfSunshine = hoursOfSunshine
    }
}


private var data: [MonthlyHoursOfSunshine] = [
    MonthlyHoursOfSunshine(month: 1, hoursOfSunshine: 74),
    MonthlyHoursOfSunshine(month: 2, hoursOfSunshine: 67),
    MonthlyHoursOfSunshine(month: 3, hoursOfSunshine: 62),
    MonthlyHoursOfSunshine(month: 4, hoursOfSunshine: 56),
    MonthlyHoursOfSunshine(month: 5, hoursOfSunshine: 49),
    MonthlyHoursOfSunshine(month: 6, hoursOfSunshine: 34),
    MonthlyHoursOfSunshine(month: 7, hoursOfSunshine: 56),
    MonthlyHoursOfSunshine(month: 8, hoursOfSunshine: 66),
    MonthlyHoursOfSunshine(month: 9, hoursOfSunshine: 70),
    MonthlyHoursOfSunshine(month: 10, hoursOfSunshine: 78),
    MonthlyHoursOfSunshine(month: 11, hoursOfSunshine: 89),
    MonthlyHoursOfSunshine(month: 12, hoursOfSunshine: 87)
]

struct LineMaskView: View {
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("Month", $0.date),
                y: .value("Hours of Sunshine", $0.hoursOfSunshine)
            )
        }
        .frame(height: 300)
        .padding()
    }
}


struct LineMaskView_Previews: PreviewProvider {
    static var previews: some View {
        LineMaskView()
    }
}
