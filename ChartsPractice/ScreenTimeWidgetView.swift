//
//  ScreenTimeWidgetView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/06.
//

import SwiftUI
import Charts

struct BarItem: Identifiable {
    let dayOfWeek: String
    let hour: Double
    let color: Color
    let category: String
    let id = UUID()
}

private let data: [BarItem] = [
    BarItem(dayOfWeek: "日", hour: 4.5, color: .blue, category: "エンターテイメント"),
    BarItem(dayOfWeek: "日", hour: 0.5, color: .cyan, category: "仕事の効率化とファイナンス"),
    BarItem(dayOfWeek: "日", hour: 0.5, color: .orange, category: "SNS"),
    BarItem(dayOfWeek: "日", hour: 0.2, color: .gray, category: "Other"),

    BarItem(dayOfWeek: "月", hour: 1.0, color: .blue, category: "エンターテイメント"),
    BarItem(dayOfWeek: "月", hour: 0.4, color: .cyan, category: "仕事の効率化とファイナンス"),
    BarItem(dayOfWeek: "月", hour: 1.9, color: .orange, category: "SNS"),
    BarItem(dayOfWeek: "月", hour: 0.5, color: .gray, category: "Other"),

    BarItem(dayOfWeek: "火", hour: 0.3,color: .blue, category: "エンターテイメント"),
    BarItem(dayOfWeek: "火", hour: 0.5, color: .cyan, category: "仕事の効率化とファイナンス"),
    BarItem(dayOfWeek: "火", hour: 2.1, color: .orange, category: "SNS"),
    BarItem(dayOfWeek: "火", hour: 1.2, color: .gray, category: "Other"),


    BarItem(dayOfWeek: "水", hour: 0.3, color: .blue, category: "エンターテイメント"),
    BarItem(dayOfWeek: "水", hour: 1.3, color: .cyan, category: "仕事の効率化とファイナンス"),
    BarItem(dayOfWeek: "水", hour: 0.2, color: .orange, category: "SNS"),
    BarItem(dayOfWeek: "水", hour: 0.5, color: .gray, category: "Other"),


    BarItem(dayOfWeek: "木", hour: 0.9, color: .blue, category: "エンターテイメント"),
    BarItem(dayOfWeek: "木", hour: 1.1, color: .cyan, category: "仕事の効率化とファイナンス"),
    BarItem(dayOfWeek: "木", hour: 1.1, color: .orange, category: "SNS"),
    BarItem(dayOfWeek: "木", hour: 0.3, color: .gray, category: "Other"),


    BarItem(dayOfWeek: "金", hour: 1.2, color: .blue, category: "エンターテイメント"),
    BarItem(dayOfWeek: "金", hour: 1.3, color: .cyan, category: "仕事の効率化とファイナンス"),
    BarItem(dayOfWeek: "金", hour: 1.7, color: .orange, category: "SNS"),
    BarItem(dayOfWeek: "金", hour: 1.3, color: .gray, category: "Other"),


    BarItem(dayOfWeek: "土", hour: 2.0, color: .blue, category: "エンターテイメント"),
    BarItem(dayOfWeek: "土", hour: 0.5, color: .cyan, category: "仕事の効率化とファイナンス"),
    BarItem(dayOfWeek: "土", hour: 1.3, color: .orange, category: "SNS"),
    BarItem(dayOfWeek: "土", hour: 0.2, color: .gray, category: "Other")
]

struct ScreenTimeWidgetView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("スクリーンタイム")) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("1日の平均")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Text("3 時間 45 分")
                            .font(.title)

                        // グラフを描画
                        Chart {
                            ForEach(data) {
                                BarMark(
                                    x: .value("Category", $0.dayOfWeek),
                                    y: .value("Profit", $0.hour)
                                )
                                .foregroundStyle($0.color)
                                .foregroundStyle(by: .value("Product Category", $0.category))
                                // 棒グラフの角を丸くする
                                .cornerRadius(3)

                                // 一週間の平均利用時間(h)
                                // TODO: 記事ネタ　RuleMark追加で平均を表す。
                                RuleMark(y: .value("平均", 3.45))
                                    .foregroundStyle(.green)
                                    // TODO: ”平均”を点線の横につけたいが以下の実装だと線上にある。
//                                    .annotation(position: .overlay, alignment: .trailing) {
//                                        Text("平均")
//                                            .font(.subheadline)
//                                            .foregroundColor(.green)
//                                    }
                                // 線のスタイルを指定。ここでは点線にしている。
                                // TODO: 記事ネタ　線のスタイルの指定方法について。
                                    .lineStyle(StrokeStyle(lineWidth: 1.5, lineCap: .butt, lineJoin: .miter, dash: [5,5,5,5], dashPhase: 0))
                            }
                        }
                        // TODO: Y軸を["0", "6時間"]の２つだけを記載したい。
//                        .chartYAxis {
//                            // presetは、軸の数値をグラフの内側にいれるか外側にするか
//                            // positionは、上下左右のどこに軸の数値を記載するかを指定する
//                            //
//                            AxisMarks(preset: .aligned, position: .trailing, values: [0, 6])
//                        }
                        .chartForegroundStyleScale([
                            "エンターテイメント": .blue, "仕事の効率化とファイナンス": .cyan, "SNS": .orange
                        ])
                    }
                    .frame(width: 300, height: 250)
                }
            }
        }
    }
}


struct ScreenTimeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTimeWidgetView()
    }
}
