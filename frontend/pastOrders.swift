// pastOrders.swift
import SwiftUI

struct PastOrder: Identifiable {
    var id = UUID()
    var orderNumber: Int
    var orderDate: Date
    var items: [CartItem]
}

struct pastOrders: View {
    @ObservedObject var cart: Cart

    var body: some View {
        NavigationStack {
            List {
                ForEach(cart.pastOrders) { pastOrder in
                    NavigationLink(
                        destination: PastOrderDetailsView(pastOrder: pastOrder),
                        label: {
                            HStack {
                                Text("Order #\(pastOrder.orderNumber)")
                                Spacer()
                                Text("\(formattedDate(pastOrder.orderDate))")
                            }
                        }
                    )
                }
            }
            .navigationTitle("Past Orders")
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}

struct pastOrders_Previews: PreviewProvider {
    static var previews: some View {
        pastOrders(cart: Cart())
    }
}
