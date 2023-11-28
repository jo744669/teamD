// CartView.swift
import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart

    var body: some View {
        NavigationView {
            List {
                ForEach(cart.items) { item in
                    Text("\(item.name) - $\(item.price)")
                }
            }
            .navigationTitle("Cart")
            .overlay(
                cart.totalItems > 0 ?
                    Badge(number: cart.totalItems)
                        .frame(width: 24, height: 24)
                        .background(Circle().fill(Color.white).offset(x: 10, y: -10))
                    : nil
            , alignment: .topTrailing)
        }
    }
}

#if DEBUG
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cart: Cart())
    }
}
#endif

