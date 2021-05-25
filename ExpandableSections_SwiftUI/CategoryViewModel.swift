//
//  CategoryViewModel.swift
//  ExpandableSections_SwiftUI
//
//  Created by Josh R on 5/24/21.
//

import Combine
import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categories = [Category]()

    init() {
        categories = [
            Category(name: "Bills", subcategories: [
                Category(name: "Internet"),
                Category(name: "Electric"),
                Category(name: "Gas"),
            ]),
            Category(name: "Car", subcategories: [
                Category(name: "Gas"),
                Category(name: "Payment"),
                Category(name: "Maintenance"),
            ]),
            Category(name: "Food", subcategories: [
                Category(name: "Eating Out"),
                Category(name: "Groceries"),
                Category(name: "Coffee"),
            ]),
        ].sorted(by: { $0.name < $1.name })
    }

    //SF Symbols
    let icons: [String: String] = [
        "Bills": "list.dash",
        "Internet": "wifi",
        "Electric": "bolt.fill",
        "Gas": "flame.fill",
        "Car": "car.2.fill",
        "Payment": "creditcard.circle.fill",
        "Maintenance": "wrench.fill",
        "Food": "capsule.fill",
        "Eating Out": "mouth.fill",
        "Groceries": "cart.fill",
        "Coffee": "heart.fill",
        "NEW": "plus.square.fill"
    ]
}
