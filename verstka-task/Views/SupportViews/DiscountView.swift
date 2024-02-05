//
//  DiscountView.swift
//  verstka-task
//
//  Created by Evelina on 02.02.2024.
//

import SwiftUI

struct DiscountView: View {
    
    private enum UIConstants {
        static let shapeWidth: CGFloat = 80
        static let shapeHeight: CGFloat = 50
        static let shapeYOffset: CGFloat = 5
        static let shapeXOffset: CGFloat = 0
        static let discountTextFontSize: CGFloat = 25
    }
    
    private let discountPercent: Int
    
    init(discountPercent: Int) {
        self.discountPercent = discountPercent
    }
    
    var body: some View {
        ZStack {
            DiscountShape()
                .fill(.red)
                .frame(width: UIConstants.shapeWidth,
                       height: UIConstants.shapeHeight)
                .offset(x: UIConstants.shapeXOffset,
                        y: UIConstants.shapeYOffset)
            Text("-\(discountPercent)%")
                .font(Font.system(size: UIConstants.discountTextFontSize).weight(.bold))
                .foregroundColor(Color.white)
        }
    }
}

struct DiscountShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY - 15))
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - 20),
                              control1: CGPoint(x: rect.minX + 10, y: rect.maxY - 10),
                              control2: CGPoint(x: rect.maxX - 10, y: rect.maxY - 5))
        path.addLine(to: CGPoint(x: rect.maxX - 5, y: rect.minY - 10))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.minY),
                      control1: CGPoint(x: rect.midX, y: rect.minY + 2),
                      control2: CGPoint(x: rect.midX - 15, y: rect.minY + 2))
        path.closeSubpath()
        return path
    }
}

