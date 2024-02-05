//
//  ProductAmountView.swift
//  verstka-task
//
//  Created by Evelina on 03.02.2024.
//

import SwiftUI

enum ProductMeasure: String {
    case kg = "кг"
    case piece = "шт"
    
    var increment: Double {
        switch self {
        case .kg:
            return 0.1
        case .piece:
            return 1
        }
    }
}

struct ProductAmountView: View {
    
    private enum UIConstants {
        static let viewWidth: CGFloat = 180
        static let viewCornerRadius: CGFloat = 25
        static let productAmountTextFontSize: CGFloat = 16
        static let productPriceTextFontSize: CGFloat = 14
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 6
    }
    
    private let price: Double
    private let measure: ProductMeasure
    @State private var productAmount: Double = 1
    @State private var productPrice: Double
    
    
    init(productPrice: Double, measure: ProductMeasure) {
        self.price = productPrice
        self.measure = measure
        self.productPrice = productPrice
    }
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    decreaseAmount()
                } label: {
                    Image(systemName: "minus")
                        .foregroundColor(.white)
                }
                Spacer()
                VStack(alignment: .center) {
                    switch measure {
                    case .kg:
                        Text(String(format: "%.1f ", productAmount) + measure.rawValue)
                            .font(Font.system(size: UIConstants.productAmountTextFontSize).weight(.bold))
                            .foregroundColor(.white)
                    case .piece:
                        Text(String(Int(productAmount)) + " " + measure.rawValue)
                            .font(Font.system(size: UIConstants.productAmountTextFontSize).weight(.bold))
                            .foregroundColor(.white)
                    }
                    Text(String(format: "%.1f ₽", productPrice))
                        .font(Font.system(size: UIConstants.productPriceTextFontSize).weight(.regular))
                        .foregroundColor(.white)
                }
                Spacer()
                Button {
                    increaseAmount()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, UIConstants.horizontalPadding)
            .padding(.vertical, UIConstants.verticalPadding)
            .background(Color.green)
        }
        .frame(width: UIConstants.viewWidth)
        .cornerRadius(UIConstants.viewCornerRadius)
        .onChange(of: measure) { newValue in
            productAmount = newValue.increment
            productPrice = price
        }
    }
    
    private func increaseAmount() {
        productAmount += measure.increment
        productPrice = productAmount * price
    }
    
    private func decreaseAmount() {
        if (productAmount != measure.increment) {
            productAmount -= measure.increment
            productPrice = Double(productAmount) * price
        }
    }
}
