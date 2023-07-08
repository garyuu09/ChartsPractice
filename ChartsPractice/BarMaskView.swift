//
//  BarMaskView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/06.
//

import SwiftUI
import Charts

struct StatusData: Identifiable {
    let name: String
    let parameter: Int
    var id: String { name }
}

let statusData: [StatusData] = [
    .init(name: "Attack", parameter: 130),
    .init(name: "Defense", parameter: 60),
    .init(name: "HP", parameter: 155),
    .init(name: "MP", parameter: 80)
]
struct BarMaskView: View {
    var body: some View {
        Chart(statusData) { element in
            // 縦方向の棒グラフ
//            BarMark(
//                x: .value("Count", element.count),
//                y: .value("Name", element.name)
//            )
            // 横方向の棒グラフ
            // x,yのcountとnameを入れ替えるだけ。
            BarMark(
                x: .value("Status", element.parameter),
                y: .value("Name", element.name)
            )
            .opacity(0.7) // グラフの透明化。
            .foregroundStyle(.green) // グラフの背景色指定
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

struct BarMaskView_Previews: PreviewProvider {
    static var previews: some View {
        BarMaskView()
    }
}
