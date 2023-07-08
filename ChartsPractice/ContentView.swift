//
//  ContentView.swift
//  ChartsPractice
//
//  Created by Ryuga on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                AreaMaskView()
                LineMaskView()
                PointMaskView()
                RectangleMaskView()
                RuleMaskView()
                BarMaskView()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
