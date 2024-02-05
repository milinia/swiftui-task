//
//  BorderedButton.swift
//  verstka-task
//
//  Created by Evelina on 01.02.2024.
//

import SwiftUI

struct BorderedButton: View {
    private enum UIConstants {
        static let buttonCornerRadius: CGFloat = 20
        static let verticalInset: CGFloat = 12
        static let buttonLabelFontSize: CGFloat = 16
        static let buttonLabelKerning: CGFloat = 0.1
        static let horizontalPadding: CGFloat = 16
        static let buttonBorderLineWidth: CGFloat = 4.5
    }
    
    private let label: String
    private let action: () -> Void
    
    init(label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
    
    var body: some View {
        Button {
                
        } label: {
            Text(label)
                .font(Font.system(size: UIConstants.buttonLabelFontSize).weight(.bold))
                .kerning(UIConstants.buttonLabelKerning)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.green)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(EdgeInsets(top: UIConstants.verticalInset,
                                    leading: 0,
                                    bottom: UIConstants.verticalInset,
                                    trailing: 0))
                .overlay(RoundedRectangle(cornerRadius: UIConstants.buttonCornerRadius)
                    .stroke(Color.green, lineWidth: UIConstants.buttonBorderLineWidth))
        }
        .background(Color.white)
        .cornerRadius(UIConstants.buttonCornerRadius)
        .padding(.horizontal, UIConstants.horizontalPadding)
    }
}
