// PastOrderDetailsView.swift
import SwiftUI

struct PastOrderDetailsView: View {
    var pastOrder: PastOrder

    var body: some View {
        List {
            ForEach(pastOrder.items) { item in
                Text("\(item.name) - $\(item.price)")
                    .padding()
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Order #\(pastOrder.orderNumber)")
    }
}

struct PastOrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PastOrderDetailsView(pastOrder: PastOrder(orderNumber: 1, orderDate: Date(), items: []))
    }
}
