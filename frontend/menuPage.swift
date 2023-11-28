import SwiftUI

// Model for menu item
struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var description: String
}

struct menuPage: View {
    @StateObject private var cart = Cart()

    let menuCategories: [String] = ["Auntie Annes", "Burgers and Fries", "Hawk Wrap", "Jamba Juice"]

    let menuItems: [String: [MenuItem]] = [
        "Auntie Annes": [
            MenuItem(name: "Pretzel", price: 3.99, description: "a soft pretzel"),
            MenuItem(name: "Pretzel dogs", price: 4.99, description: "Pretzel dogs"),
            // Add more Auntie Annes items as needed
        ],
        "Burgers and Fries": [
            MenuItem(name: "Nashville spicy chicken", price: 8.99, description: "Pretzel dogs"),
            MenuItem(name: "Grilled chicken and bacon", price: 9.99, description: "Pretzel dogs"),
            // Add more Burgers and Fries items as needed
        ],
        "Hawk Wrap": [
            MenuItem(name: "Classic", price: 6.99, description: "Pretzel dogs"),
            MenuItem(name: "Double classic", price: 8.99, description: "Pretzel dogs"),
            // Add more Hawk Wrap items as needed
        ],
        "Jamba Juice": [
            MenuItem(name: "Bold n cold brew", price: 4.99, description: "Pretzel dogs"),
            MenuItem(name: "Caribbean passion", price: 5.99, description: "Pretzel dogs"),
            // Add more Jamba Juice items as needed
        ]
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(menuCategories, id: \.self) { category in
                    Section(header: Text(category)) {
                        ForEach(menuItems[category] ?? [], id: \.id) { item in
                            NavigationLink(destination: ItemDetails(item: item, cart: cart)) {
                                Text(item.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("The Drop")
            .overlay(
                cart.totalItems > 0 ?
                    Text("\(cart.totalItems)")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Circle().fill(Color.red).offset(x: 10, y: -10))
                    : nil,
                alignment: .topTrailing
            )
        }
    }
}

#if DEBUG
struct menuPage_Previews: PreviewProvider {
    static var previews: some View {
        menuPage()
    }
}
#endif

