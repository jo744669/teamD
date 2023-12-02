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
        PastOrderDetailsView(pastOrder: PastOrder(orderNumber: 1, orderDate: Date(), items: []))
    }
}


