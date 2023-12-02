// CartView.swift
import SwiftUI

struct CartItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var quantity: Int
}

class Cart: ObservableObject {
    @Published var items: [CartItem] = []
    @Published var badgeNumber: Int = 0
    @Published var pastOrders: [PastOrder] = []

    var totalItems: Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    func addItem(item: MenuItem) {
        if let existingIndex = items.firstIndex(where: { $0.name == item.name }) {
            // Item already exists in the cart, update quantity
            items[existingIndex].quantity += 1
        } else {
            // Item is not in the cart, add a new entry
            let newItem = CartItem(name: item.name, price: item.price, quantity: 1)
            items.append(newItem)
        }

        updateBadgeNumber()
    }

    func clearCart() {
        items.removeAll()
        updateBadgeNumber()
    }

    func order() {
        // Check if the cart is not empty before placing an order
        guard !items.isEmpty else { return }

        // Create a new past order
        let order = PastOrder(
            orderNumber: pastOrders.count + 1,
            orderDate: Date(),
            items: items
        )

        // Add the order to pastOrders
        pastOrders.append(order)

        // Clear the current cart
        clearCart()
    }

    func deleteItem(at index: Int) {
        items.remove(at: index)
        updateBadgeNumber()
    }

    private func updateBadgeNumber() {
        badgeNumber = totalItems
    }
}

struct CartView: View {
    @ObservedObject var cart: Cart
    @State private var isOrderAlertPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(cart.items.indices, id: \.self) { index in
                    HStack {
                        Text("\(cart.items[index].name) - \(formattedPrice(cart.items[index].price))")
                            .padding()

                        Spacer()

                        Text("Quantity: \(cart.items[index].quantity)")
                            .foregroundColor(.gray)
                    }
                }
                .onDelete(perform: { indexSet in
                    guard let first = indexSet.first else { return }
                    cart.deleteItem(at: first)
                })
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Cart")
            .navigationBarItems(trailing: HStack {
                Button("Clear") {
                    cart.clearCart()
                }
                Button("Order") {
                    isOrderAlertPresented.toggle()
                }
                .alert(isPresented: $isOrderAlertPresented) {
                    Alert(
                        title: Text("Place Order?"),
                        message: Text("Are you sure you want to place the order?"),
                        primaryButton: .default(Text("Yes")) {
                            cart.order()
                        },
                        secondaryButton: .cancel()
                    )
                }
            })
        }
    }

    // Function to format price without extra zeros
    private func formattedPrice(_ price: Double) -> String {
        return String(format: "$%.2f", price)
    }
}

#if DEBUG
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cart: Cart())
    }
}
#endif








