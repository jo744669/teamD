import SwiftUI
struct menuPage: View {
    @EnvironmentObject var cart: Cart
    var onBadgeUpdate: ((Int) -> Void)? // Closure for updating the badge

    let menuCategories: [String] = ["Auntie Annes", "Burgers and Fries", "Hawk Wrap", "Jamba Juice"]
    
    // A variable to keep track of the selected category
    @State private var selectedCategory: String?

    let menuItems: [String: [MenuItem]] = [
        "Auntie Annes": [
            MenuItem(name: "Classic Pretzel", price: 3.99, description: "A soft pretzel"),
            MenuItem(name: "Pretzel Dogs", price: 4.99, description: "Pretzel dogs"),
            // Add more Auntie Annes items as needed
        ],
        "Burgers and Fries": [
            MenuItem(name: "Nashville Spicy Chicken", price: 8.99, description: "Spicy chicken burger"),
            MenuItem(name: "Grilled Chicken and Bacon", price: 9.99, description: "Chicken and bacon burger"),
            // Add more Burgers and Fries items as needed
        ],
        "Hawk Wrap": [
            MenuItem(name: "Classic Wrap", price: 6.99, description: "Classic wrap"),
            MenuItem(name: "Double Classic Wrap", price: 8.99, description: "Double classic wrap"),
            // Add more Hawk Wrap items as needed
        ],
        "Jamba Juice": [
            MenuItem(name: "Bold n Cold Brew", price: 4.99, description: "Bold cold brew coffee"),
            MenuItem(name: "Caribbean Passion", price: 5.99, description: "Fruit smoothie"),
            // Add more Jamba Juice items as needed
        ]
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(menuCategories, id: \.self) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        Text(category)
                    }
                    .padding()
                    
                    // Display items only if the category is selected
                    if let selectedCategory = selectedCategory, selectedCategory == category {
                        ForEach(menuItems[category] ?? [], id: \.id) { item in
                            NavigationLink(destination: ItemDetails(item: item, cart: cart)) {
                                Text(item.name)
                                    .onTapGesture {
                                        addToCart(item: item)
                                    }

                                // Format and display the price with two decimal places
                                Text(String(format: "$%.2f", item.price))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("The Drop")
        }
    }

    private func addToCart(item: MenuItem) {
        cart.addItem(item: item)
        // Update the badge using the provided closure
        onBadgeUpdate?(cart.totalItems)
    }
}

