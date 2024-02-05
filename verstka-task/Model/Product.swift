//
//  Product.swift
//  verstka-task
//
//  Created by Evelina on 31.01.2024.
//

import SwiftUI

struct Product {
    let rating: Double
    let reviewsNumber: Int
    let name: String
    let originCountry: String
    let originCountryFlag: Image
    let productImage: Image
    let description: String
    let characteristics: ProductСharacteristic
    let reviews: [ProductReview]
    let price: Double
    let discount: Int
    let oldPrice: Double
}

struct ProductСharacteristic {
    let productionCountry: String
    let kcal: Int
    let energyValue: Int
    let fats: Double
    let protein: Double
    let carb: Double
    let tMax: Int
    let shelfLife: Int
}

struct ProductReview: Hashable {
    let author: String
    let reviewDate: String
    let reviewRating: Int
    let reviewComment: String
}
