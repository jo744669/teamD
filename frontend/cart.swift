// Cart.swift
import Foundation
import SwiftUI

class Cart: ObservableObject {
    @Published var items: [CartItem] = []

    var totalItems: Int {
        items.count
    }

    func addItem(itemName: String, itemPrice: Double) {
        let newItem = CartItem(name: itemName, price: itemPrice)
        items.append(newItem)
    }
}

