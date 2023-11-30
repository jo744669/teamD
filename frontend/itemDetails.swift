// ItemDetails.swift
import SwiftUI

struct ItemDetails: View {
    var item: MenuItem
    @ObservedObject var cart: Cart

    var body: some View {
        VStack {
            Text(item.name)
                .font(.title)

            Text("Price: $\(item.price)")
                .foregroundColor(.gray)

            Button("Add to Cart") {
                cart.addItem(item: item)
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


