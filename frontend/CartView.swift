// CartView.swift
import SwiftUI

struct CartItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
}

class Cart: ObservableObject {
    @Published var items: [CartItem] = []

    var totalItems: Int {
        items.count
    }

    func addItem(item: MenuItem) {
        let newItem = CartItem(name: item.name, price: item.price)
        items.append(newItem)
    }
}

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

