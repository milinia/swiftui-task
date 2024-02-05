//
//  ProductStatusView.swift
//  verstka-task
//
//  Created by Evelina on 02.02.2024.
//

import SwiftUI

enum ProductStatus: String {
    case priceByCard = "Цена по карте"
    
    var color: Color {
        switch self {
        case .priceByCard:
            return Color.green
        }
    }
}

struct ProductStatusView: View {
    
    private enum UIConstants {
        static let textVerticalPadding: CGFloat = 10
        static let textHorizontalPadding: CGFloat = 22
        static let viewCornerRadius: CGFloat = 10
    }
    
    private let productStatus: ProductStatus
    
    init(productStatus: ProductStatus) {
        self.productStatus = productStatus
    }
    
    var body: some View {
        VStack {
            Text(productStatus.rawValue)
                .foregroundColor(.white)
                .padding(.vertical, UIConstants.textVerticalPadding)
                .padding(.horizontal, UIConstants.textHorizontalPadding)
        }
        .background(productStatus.color)
        .cornerRadius(UIConstants.viewCornerRadius)
    }
}
