//
//  RatingView.swift
//  verstka-task
//
//  Created by Evelina on 01.02.2024.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Double
    let reviewNumber: Int
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
            Text(String(rating))
            Text("| \(reviewNumber) отзывов")
                .foregroundColor(Color.gray)
        }
    }
}
