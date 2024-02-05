//
//  ProductView.swift
//  verstka-task
//
//  Created by Evelina on 02.02.2024.
//

import SwiftUI

struct ProductView: View {
    
    @State private var picked = 0
    @State private var isCharacteristicViewExpanded: Bool = false
    
    private enum UIConstants {
        static let vStackSpacing: CGFloat = 18
        static let productTitleFontSize: CGFloat = 30
        static let titlesTextFontSize: CGFloat = 18
        static let regularTextFontSize: CGFloat = 16
        static let reviewTextFontSize: CGFloat = 24
        static let productPriceTextFontSize: CGFloat = 32
        static let horizontalInset: CGFloat = 10
        static let productStatusViewScaleEffect: CGFloat = 0.8
        static let discountViewScaleEffect: CGFloat = 0.6
        static let priceMeasureViewScaleEffect: CGFloat = 0.8
        static let smallTextFontSize: CGFloat = 14
        static let imageHeight: CGFloat = 300
    }
    
    //MARK: static data
    let measure = ["шт", "кг"]
    let data = Product(rating: 4.1, reviewsNumber: 19, name: "Добавка \"Липа\" к чаю 200 г",
                       originCountry: "Испания, Риоха", originCountryFlag: Image("flagImage"), productImage: Image("productImage"),
                       description: "Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов.",
                       characteristics: ProductСharacteristic(productionCountry: "Россия, Краснодарский край",
                                                              kcal: 25,
                                                              energyValue: 105,
                                                              fats: 0.1,
                                                              protein: 1.3,
                                                              carb: 3.3,
                                                              tMax: 25,
                                                              shelfLife: 730),
                       reviews: [ProductReview(author: "Александр В.",
                                               reviewDate: "7 мая 2021",
                                               reviewRating: 4,
                                               reviewComment: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                                 ProductReview(author: "Александр В.",
                                                         reviewDate: "7 мая 2021",
                                                         reviewRating: 4,
                                                         reviewComment: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                                 ProductReview(author: "Александр В.",
                                                         reviewDate: "7 мая 2021",
                                                         reviewRating: 4,
                                                         reviewComment: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                                 ProductReview(author: "Александр В.",
                                                         reviewDate: "7 мая 2021",
                                                         reviewRating: 4,
                                                         reviewComment: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!")
                       ],
                       price: 55.9,
                       discount: 5,
                       oldPrice: 199.0)
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: UIConstants.vStackSpacing) {
                        ZStack(alignment: .topLeading) {
                            data.productImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width - UIConstants.horizontalInset * 2, height: UIConstants.imageHeight)
                            ProductStatusView(productStatus: .priceByCard)
                                .scaleEffect(UIConstants.productStatusViewScaleEffect)
                        }
                        HStack {
                            RatingView(rating: data.rating, reviewNumber: data.reviewsNumber)
                            Spacer()
                            DiscountView(discountPercent: data.discount)
                                .scaleEffect(UIConstants.discountViewScaleEffect)
                        }
                        Text(data.name)
                            .font(Font.system(size: UIConstants.productTitleFontSize).weight(.bold))
                        CountryView(country: data.originCountry, image: data.originCountryFlag)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Описание")
                                .font(Font.system(size: UIConstants.titlesTextFontSize).bold())
                            Text(data.description)
                                .font(Font.system(size: UIConstants.regularTextFontSize))
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Основые характеристики")
                                .font(Font.system(size: UIConstants.titlesTextFontSize).bold())
                            СharacteristicView(characteristics: data.characteristics, isExpanded: $isCharacteristicViewExpanded)
                        }
                        Button {
                            withAnimation {
                                isCharacteristicViewExpanded.toggle()
                            }
                        } label: {
                            Text(isCharacteristicViewExpanded ? "Свернуть" : "Все характеристики")
                                .font(Font.system(size: UIConstants.regularTextFontSize).weight(.heavy))
                                .foregroundColor(Color.green)
                        }
                        Spacer(minLength: 2)
                        VStack {
                            HStack {
                                Text("Отзывы")
                                    .font(Font.system(size: UIConstants.reviewTextFontSize).weight(.heavy))
                                Spacer()
                                Button {
                                   
                                } label: {
                                    Text("Все \(data.reviewsNumber)")
                                        .font(Font.system(size: UIConstants.regularTextFontSize).weight(.heavy))
                                        .foregroundColor(Color.green)
                                }
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 25) {
                                    ForEach(data.reviews, id: \.self) { review in
                                        ReviewCellView(review: review)
                                    }
                                }
                                .padding()
                            }
                            BorderedButton(label: "Оставить отзыв", action: {})
                        }
                    }
                }
                .padding(.horizontal, UIConstants.horizontalInset)
                VStack(alignment: .leading, spacing: 20) {
                    Picker("", selection: $picked) {
                        Text("\(measure[0])").tag(0)
                        Text("\(measure[1])").tag(1)
                    }
                    .pickerStyle(.segmented)
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            HStack {
                                Text(String(describing: data.price))
                                    .font(Font.system(size: UIConstants.productPriceTextFontSize).weight(.heavy))
                                PriceMeasureView(measure: measure[picked])
                                    .scaleEffect(UIConstants.priceMeasureViewScaleEffect)
                            }
                            Text(String(data.oldPrice))
                                .font(Font.system(size: UIConstants.smallTextFontSize))
                                .foregroundColor(.gray)
                                .strikethrough(true, color: .gray)
                        }
                        Spacer()
                        ProductAmountView(productPrice: data.price, measure: ProductMeasure(rawValue: measure[picked]) ?? ProductMeasure.piece)
                    }
                }
                .padding(.horizontal, UIConstants.horizontalInset + 10)
                .padding(.bottom, 6)
            }
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "list.bullet.rectangle")
                        .font(.system(size: UIConstants.smallTextFontSize, weight: .bold))
                        .foregroundColor(Color.green)
                }

                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: UIConstants.smallTextFontSize, weight: .bold))
                        .foregroundColor(Color.green)
                }

                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.system(size: UIConstants.smallTextFontSize, weight: .bold))
                        .foregroundColor(Color.green)
                }
            }
        }
    }
}
