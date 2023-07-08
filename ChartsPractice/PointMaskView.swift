//
//  PointMaskView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/06.
//

import SwiftUI
import Charts


struct Insect: Identifiable {
    let name: String
    let family: String
    let wingLength: Double
    let wingWidth: Double
    let weight: Double
    let id = UUID()
}


private var data: [Insect] = [
    Insect(name: "Hepialidae", family: "Lepidoptera", wingLength: 32, wingWidth: 32, weight: 22),
    Insect(name: "Danaidae", family: "Lepidoptera", wingLength: 49, wingWidth: 40, weight: 24),
    Insect(name: "Riodinidae", family: "Lepidoptera", wingLength: 41, wingWidth: 35, weight: 18),
    Insect(name: "Hepialidae", family: "Diptera", wingLength: 15, wingWidth: 35, weight: 22),
    Insect(name: "Danaidae", family: "Diptera", wingLength: 20, wingWidth: 25, weight: 24),
    Insect(name: "Riodinidae", family: "Diptera", wingLength: 22, wingWidth: 30, weight: 18),
    Insect(name: "Hepialidae", family: "Hymenoptera", wingLength: 63, wingWidth: 45, weight: 22),
    Insect(name: "Danaidae", family: "Hymenoptera", wingLength: 67, wingWidth: 48, weight: 24),
    Insect(name: "Riodinidae", family: "Hymenoptera", wingLength: 56, wingWidth: 42, weight: 18),
    // ...
]

struct PointMaskView: View {
    var body: some View {
        Chart(data) {
            PointMark(
                x: .value("Wing Length", $0.wingLength),
                y: .value("Wing Width", $0.wingWidth)
            )
            .foregroundStyle(by: .value("Family", $0.family))
        }
        .frame(width: 300, height: 200)
    }
}

struct PointMaskView_Previews: PreviewProvider {
    static var previews: some View {
        PointMaskView()
    }
}
