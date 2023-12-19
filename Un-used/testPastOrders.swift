import SwiftUI



struct PastOrder: Identifiable, Codable {
    var id = UUID()
    var orderNumber: Int
    var orderDate: Date
    var items: [CartItem]
    var order_id: Int

    // CodingKeys to handle encoding and decoding of Date
    enum CodingKeys: String, CodingKey {
        case id, orderNumber, orderDate, items, order_id
    }
    init(orderNumber: Int, orderDate: Date, items: [CartItem], order_id: Int) {
            self.orderNumber = orderNumber
            self.orderDate = orderDate
            self.items = items
            self.order_id = order_id
        }

    // Custom initializer to handle decoding of Date
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        orderNumber = try container.decode(Int.self, forKey: .orderNumber)
        items = try container.decode([CartItem].self, forKey: .items)

        // Decode date using a custom formatter
        let dateString = try container.decode(String.self, forKey: .orderDate)
        if let date = DateFormatter.iso8601.date(from: dateString) {
            orderDate = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .orderDate, in: container, debugDescription: "Date string does not match expected format")
        }
        order_id = 0
    }

    // Custom method to handle encoding of Date
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(orderNumber, forKey: .orderNumber)
        try container.encode(items, forKey: .items)

        // Encode date using a custom formatter
        let dateString = DateFormatter.iso8601.string(from: orderDate)
        try container.encode(dateString, forKey: .orderDate)
    }
}

extension DateFormatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
}

struct PastOrdersView: View {
    @ObservedObject var cart: Cart
    @State private var userOrders: [PastOrder] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(userOrders) { pastOrder in
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
            .onAppear {
                sendRequest()
            }
            .navigationTitle("Past Orders")
        }
    }

    private func sendRequest() {
        guard let url = URL(string: "http://localhost:3000/getUserOrders") else { return }

        let userId = "123" //need to dynamically change
        let parameters: [String: Any] = ["userId": userId]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        } 
        catch {
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601)

                let userOrders = try decoder.decode([PastOrder].self, from: data)
                
                DispatchQueue.main.async {
                    self.userOrders = userOrders
                }
            }
            catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
    }

    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}

struct PastOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        PastOrdersView(cart: Cart())
    }
}
