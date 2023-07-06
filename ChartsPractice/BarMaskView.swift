//
//  BarMaskView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/06.
//

import SwiftUI
import Charts

struct CountData: Identifiable {
    let name: String
    let count: Int

    var id: String { name }
}

let countData: [CountData] = [
    .init(name: "りんご", count: 130),
    .init(name: "ロボット", count: 60),
    .init(name: "窓", count: 20),
    .init(name: "花札", count: 75)
]
struct BarMaskView: View {
    var body: some View {
        Chart(countData) { element in
            // 縦方向の棒グラフ
//            BarMark(
//                x: .value("Name", element.name),
//                y: .value("Count", element.count)
//            )
            // 横方向の棒グラフ
            // x,yのcountとnameを入れ替えるだけ。
            BarMark(
                x: .value("Count", element.count),
                y: .value("Name", element.name)
            )
            .opacity(0.7) // グラフの透明化。
            .foregroundStyle(.green) // グラフの背景色指定
        }
        .padding()
        .frame(height: 400)
    }
}

struct BarMaskView_Previews: PreviewProvider {
    static var previews: some View {
        BarMaskView()
    }
}
