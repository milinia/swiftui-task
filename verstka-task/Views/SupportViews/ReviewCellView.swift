//
//  ReviewCellView.swift
//  verstka-task
//
//  Created by Evelina on 02.02.2024.
//

import SwiftUI

struct ReviewCellView: View {
    
    private enum UIConstants {
        static let vStackSpacing: CGFloat = 6
        static let reviewDateFontSize: CGFloat = 16
        static let authorTextFontSize: CGFloat = 20
        static let hStackSpacing: CGFloat = 3
        static let viewCornerRadius: CGFloat = 16
        static let viewWidth: CGFloat = 280
        static let viewHeight: CGFloat = 180
        static let shadowRadius: CGFloat = 4
        static let shadowY: CGFloat = 1
        static let shadowX: CGFloat = 0
    }
    
    private let review: ProductReview
    
    init(review: ProductReview) {
        self.review = review
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: UIConstants.vStackSpacing) {
                Text(review.author)
                    .font(Font.system(size: UIConstants.authorTextFontSize).weight(.bold))
                Text(review.reviewDate)
                    .font(Font.system(size: UIConstants.reviewDateFontSize))
                    .foregroundColor(Color.gray)
                HStack(spacing: UIConstants.hStackSpacing) {
                    ForEach(0..<review.reviewRating, id: \.self) { i in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                    ForEach(review.reviewRating..<5, id: \.self) { i in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.gray)
                    }
                }
                Text(review.reviewComment)
                    .truncationMode(.tail)
            }
            .padding()
        }
        .cornerRadius(UIConstants.viewCornerRadius)
        .frame(width: UIConstants.viewWidth, height: UIConstants.viewHeight)
        .background(RoundedRectangle(cornerRadius: UIConstants.viewCornerRadius)
            .fill(Color(.white))
            .shadow(color: Color(UIColor.systemGray5),
                    radius: UIConstants.shadowRadius,
                    x: UIConstants.shadowX,
                    y: UIConstants.shadowY))
    }
}
