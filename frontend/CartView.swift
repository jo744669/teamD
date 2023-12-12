//CartView.swift
import SwiftUI

struct CartItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var price: Double
    var quantity: Int
}

class Cart: ObservableObject {
    @Published var items: [CartItem] = []
    @Published var badgeNumber: Int = 0
    @Published var pastOrders: [PastOrder] = []
    @Published var orderNumber: Int = 1
    

    var totalItems: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    var userEmail: String?

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
        orderNumber = Int.random(in: 1...1000)

        // Create a new PastOrder
        let order = PastOrder(
            orderNumber: orderNumber,
            orderDate: Date(),
            items: items,
            order_id: orderNumber
        )
        // Print order details
        print("Order Details: \(order)")

        // Add the order to pastOrders
        pastOrders.append(order)

        // Clear the current cart
        clearCart()

        // Send the order to the server
        sendOrderToServer(order: order)
    }

    func deleteItem(at index: Int) {
        items.remove(at: index)
        updateBadgeNumber()
    }

    private func updateBadgeNumber() {
        badgeNumber = totalItems
    }

    private func sendOrderToServer(order: PastOrder) {
        guard let url = URL(string: "http://localhost:3000/placeOrder") else {
            print("Invalid server URL")
            return
        }
        // Check if user email is available
        guard let userEmail = userEmail else {
            print("User email is missing")
            return
                }
        

        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Manually create the JSON payload
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateString = dateFormatter.string(from: order.orderDate)

        var jsonPayload: [String: Any] = [
            "email": userEmail,
            "orderNumber": order.orderNumber,
            "orderDate": dateString,
            "items": order.items.map { ["name": $0.name, "price": $0.price, "quantity": $0.quantity] }
        ]

        // Add order_id only if it's not 0
        if order.order_id != 0 {
            jsonPayload["order_id"] = order.order_id
        }

        do {
            // Encode the JSON payload
            let jsonData = try JSONSerialization.data(withJSONObject: jsonPayload)
            request.httpBody = jsonData
        } catch {
            print("Error encoding order as JSON: \(error)")
            return
        }

        // Make the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending order to server: \(error)")
                return
            }

            // Debugging: Print the response from the server
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Response from server: \(responseString)")
            }
        }.resume()
    }





}

struct CartView: View {
    @ObservedObject var cart: Cart
    @State private var isOrderAlertPresented = false
    var userLoggedInEmail: String?
    

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
                            // Check if userLoggedInEmail is available
                            if let userEmail = userLoggedInEmail {
                                // Use userEmail when sending the order
                                cart.userEmail = userEmail
                                cart.order()
                            } else {
                                // Handle the case where userLoggedInEmail is nil
                                print("User email is missing")
                            }
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










