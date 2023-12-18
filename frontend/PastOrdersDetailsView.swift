// PastOrderDetailsView.swift
import SwiftUI

struct PastOrderDetailsView: View {
    var pastOrder: PastOrder

    var body: some View {
        List {
            ForEach(pastOrder.items) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(item.name)")
                            .padding()

                        Text("Quantity: \(item.quantity)")
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    Text(formattedPrice(item.price))
                        .foregroundColor(.gray)
                        .padding()
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Order #\(pastOrder.orderNumber)")
    }

    // Function to format price without extra zeros
    private func formattedPrice(_ price: Double) -> String {
        return String(format: "$%.2f", price)
    }
}

struct PastOrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let cart = Cart()
        // Assuming there's an order in the pastOrders array
        if let sampleOrder = cart.pastOrders.first {
            return PastOrderDetailsView(pastOrder: sampleOrder)
        } else {
            // If pastOrders is empty, create a sample PastOrder for preview
            return PastOrderDetailsView(pastOrder: PastOrder( orderNumber: 1, orderDate: Date(), items: [], order_id: Int(Date().timeIntervalSince1970)))
        }
    }
}
