//
//  СharacteristicView.swift
//  verstka-task
//
//  Created by Evelina on 01.02.2024.
//

import SwiftUI

struct СharacteristicView: View {
    
    let characteristics: ProductСharacteristic
    @Binding var isExpanded: Bool
    
    private enum UIConstants {
        static let vStackSpacing: CGFloat = 10
        static let horizontalInset: CGFloat = 15
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let textMaxWidth: CGFloat = 120
        static let textFontSize: CGFloat = 13
        static let rightTextMaxWidth: CGFloat = 140
        static let leftTextMaxWidth: CGFloat = 160
        static let dotesFontSize: CGFloat = 12
        static let doteWidth: CGFloat = 3.56
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: UIConstants.vStackSpacing) {
            characteristicRow("Производство", characteristics.productionCountry)
            characteristicRow("Энергетическая ценность, ккал/100 г",
                              "\(characteristics.kcal) ккал, \(characteristics.energyValue) кДж")
            characteristicRow("Жиры/100 г", "\(characteristics.fats) г")
            characteristicRow("Белки/100 г", "\(characteristics.protein) г")
            characteristicRow("Углеводы/100 г", "\(characteristics.carb) г")
            if isExpanded {
                characteristicRow("Темпратура хранения, макс °C", "\(characteristics.tMax)")
                characteristicRow("Срок хранения", "\(characteristics.shelfLife) суток")
            }
        }
    }
    
    private func characteristicRow(_ title: String, _ value: String) -> some View {
        HStack {
            let dotes = computeRowDotesNumber(title: title, content: value)
            if (getStringSize(string: title) > UIConstants.textMaxWidth) {
                Text(title)
                    .multilineTextAlignment(.leading)
                    .font(Font.system(size: UIConstants.textFontSize))
                    .frame(maxWidth: UIConstants.rightTextMaxWidth, alignment: .leading)
            } else {
                Text(title)
                    .font(Font.system(size: UIConstants.textFontSize))
            }
            Spacer()
            Text(dotes)
                .font(Font.system(size: UIConstants.dotesFontSize))
                .foregroundColor(.gray)
            
            if (getStringSize(string: value) > UIConstants.textMaxWidth) {
                Text(value)
                    .multilineTextAlignment(.trailing)
                    .font(Font.system(size: UIConstants.textFontSize))
                    .frame(maxWidth: UIConstants.leftTextMaxWidth, alignment: .trailing)
            } else {
                Text(value)
                    .font(Font.system(size: UIConstants.textFontSize))
            }
        }
    }
    
    private func computeRowDotesNumber(title: String, content: String) -> String {
        let avaliableWidth = UIConstants.screenWidth - 2 * UIConstants.horizontalInset - 8
        var titleWidth = getStringSize(string: title)
        var contentWidth = getStringSize(string: content)
        if titleWidth > UIConstants.textMaxWidth {
            titleWidth = UIConstants.rightTextMaxWidth
        }
        if contentWidth > UIConstants.textMaxWidth {
            contentWidth = UIConstants.leftTextMaxWidth
        }
        let dotesWidth = avaliableWidth - titleWidth - contentWidth
        let numberOfDotes = dotesWidth / UIConstants.doteWidth
        return String(repeating: ".", count: Int(numberOfDotes))
    }
    
    private func getStringSize(string: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 13.0)
        let attributes = [NSAttributedString.Key.font: font]
        let size = string.size(withAttributes: attributes)
        return size.width
    }
}
