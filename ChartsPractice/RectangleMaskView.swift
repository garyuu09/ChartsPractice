//
//  RectangleMaskView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/06.
//

import SwiftUI
import Charts


struct MatrixEntry: Identifiable {
    var positive: String
    var negative: String
    var num: Double
    let id = UUID()
}


private var data: [MatrixEntry] = [
    MatrixEntry(positive: "+", negative: "+", num: 125),
    MatrixEntry(positive: "+", negative: "-", num: 10),
    MatrixEntry(positive: "-", negative: "-", num: 80),
    MatrixEntry(positive: "-", negative: "+", num: 1)
]

struct RectangleMaskView: View {
    var body: some View {
        Chart(data) {
            RectangleMark(
                x: .value("Positive", $0.positive),
                y: .value("Negative", $0.negative)
//                width: .ratio(1),
//                height: .ratio(1)
            )
            .foregroundStyle(by: .value("Number", $0.num))
        }
        // 凡例を非表示に設定
//        .chartLegend(.hidden)

        // Y軸のラベル位置を設定
//        .chartYAxis {
//            AxisMarks(preset: .aligned, position: .leading)
//        }
        .frame(width: 300, height: 200)
        .padding()
    }
}


struct RectangleMaskView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleMaskView()
    }
}
