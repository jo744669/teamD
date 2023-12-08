// ItemDetails.swift
import SwiftUI

struct ItemDetails: View {
    var item: MenuItem
    @ObservedObject var cart: Cart
    @State private var quantity: Int = 1

    var body: some View {
        VStack {
            Text(item.name)
                .font(.title)

            Text("Price: \(String(format: "$%.2f", item.price))")
                .foregroundColor(.gray)

            Stepper(value: $quantity, in: 1...10) {
                Text("Quantity: \(quantity)")
            }
            .padding()

            Button("Add to Cart (\(String(format: "$%.2f", item.price * Double(quantity))))") {
                for _ in 1...quantity {
                    cart.addItem(item: item)
                }
                print("Item added to cart: \(item.name)")
                print("Cart items: \(cart.items)")
            }
            .environmentObject(cart)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle(item.name)
    }
}
