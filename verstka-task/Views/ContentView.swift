//
//  ContentView.swift
//  verstka-task
//
//  Created by Evelina on 30.01.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case main = "house"
    case catalog = "circle.grid.2x2"
    case cart = "cart"
    case profile = "person"
    
    var TabName: String {
        switch self {
        case .main:
            return "Главная"
        case .catalog:
            return "Каталог"
        case .cart:
            return "Корзина"
        case .profile:
            return "Профиль"
        }
    }
}

struct ContentView: View {
    
    @State var currentTab: Tab = .main
    
    var body: some View {
        TabView {
            ProductView()
                .tabItem {
                    Label(Tab.main.TabName, systemImage: "\(Tab.main.rawValue)")
                }
            Image(systemName: "")
                .tabItem {
                    Label(Tab.catalog.TabName, systemImage: "\(Tab.catalog.rawValue)")
                }
            Image(systemName: "")
                .tabItem {
                    Label(Tab.cart.TabName, systemImage: "\(Tab.cart.rawValue)")
                }
            Image(systemName: "")
                .tabItem {
                    Label(Tab.profile.TabName, systemImage: "\(Tab.profile.rawValue)")
                }
        }
        .accentColor(Color.green)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            UITabBar.appearance().standardAppearance = appearance
            
            let navAppearance = UINavigationBarAppearance()
            navAppearance.configureWithOpaqueBackground()
            navAppearance.backgroundColor = .white
            UINavigationBar.appearance().standardAppearance = navAppearance
            UINavigationBar.appearance().compactAppearance = navAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        }
    }
}
