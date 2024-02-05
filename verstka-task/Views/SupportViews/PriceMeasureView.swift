//
//  PriceMeasureView.swift
//  verstka-task
//
//  Created by Evelina on 03.02.2024.
//

import SwiftUI

struct PriceMeasureView: View {
    
    private enum UIConstants {
        static let textFontSize: CGFloat = 15
        static let lineFrameWidth: CGFloat = 17
        static let lineFrameHeight: CGFloat = 17
        static let lineWidth: CGFloat = 2
        static let currencyTextXOffset: CGFloat = -6
        static let currencyTextYOffset: CGFloat = -10
        static let measureTextXOffset: CGFloat = 8
        static let measureTextYOffset: CGFloat = 10
    }
    
    private let measure: String
    
    init(measure: String) {
        self.measure = measure
    }
    
    var body: some View {
        ZStack {
            Text("₽")
                .font(Font.system(size: UIConstants.textFontSize).weight(.bold))
                .offset(x: UIConstants.currencyTextXOffset, y: UIConstants.currencyTextYOffset)
            DiagonalLine()
                .stroke(.black, style: StrokeStyle(lineWidth: UIConstants.lineWidth))
                .frame(width: UIConstants.lineFrameWidth, height: UIConstants.lineFrameHeight)
            Text(measure)
                .font(Font.system(size: UIConstants.textFontSize).weight(.bold))
                .offset(x: UIConstants.measureTextXOffset, y: UIConstants.measureTextYOffset)
        }
    }
}

struct DiagonalLine: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        return path
    }
}

