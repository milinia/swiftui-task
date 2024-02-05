//
//  CountryView.swift
//  verstka-task
//
//  Created by Evelina on 01.02.2024.
//

import SwiftUI

struct CountryView: View {
    
    private enum UIConstants {
        static let hStackSpacing: CGFloat = 16
        static let countryTextFontSize: CGFloat = 16
        static let countryImageRadius: CGFloat = 20
    }
    
    private let country: String
    private let image: Image
    
    init(country: String, image: Image) {
        self.country = country
        self.image = image
    }
    
    var body: some View {
        HStack(spacing: UIConstants.hStackSpacing) {
            image
                .resizable()
                .frame(width: UIConstants.countryImageRadius,
                       height: UIConstants.countryImageRadius)
                .foregroundColor(.white)
                .clipShape(Circle())
            Text(country)
                .font(Font.system(size: UIConstants.countryTextFontSize))
        }
    }
}
