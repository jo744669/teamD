import SwiftUI
struct menuPage: View {
    @EnvironmentObject var cart: Cart
    var onBadgeUpdate: ((Int) -> Void)? // Closure for updating the badge

    let menuCategories: [String] = ["Auntie Annes", "Burgers and Fries", "Hawk Wrap", "Jamba Juice"]
    
    // A variable to keep track of the selected category
    @State private var selectedCategory: String?

    let menuItems: [String: [MenuItem]] = [
        "Auntie Annes": [
            MenuItem(name: "Classic Pretzel", price: 2.95, description: "A soft pretzel"),
            MenuItem(name: "Pretzel Dogs", price: 4.99, description: "Pretzel dogs"),
            MenuItem(name: "Mini Dogs", price: 6.59, description: "Mini Dogs"),
            MenuItem(name: "Original Nuggets Cup", price: 5.79, description: "Original Nuggets Cup"),
            MenuItem(name: "Cinnamon Nuggets Cup", price: 5.89, description: "Cinnamon Nuggets Cup"),
            MenuItem(name: "Pepperoni Nuggets Cup", price: 6.59, description: "Pepperoni Nuggets Cup"),
            MenuItem(name: "Original Nuggets Bucket", price: 26.99, description: "Original Nuggets Bucket"),
            MenuItem(name: "Cinnamon Nuggets Bucket", price: 27.99, description: "Cinnamon Nuggets Bucket"),
            MenuItem(name: "Pepperoni Nuggets Bucket", price: 32.99, description: "Pepperoni Nuggets Bucket"),
            //drinks
            MenuItem(name: "Original Lemonade", price: 3.99, description: "Original Lemonade"),
            MenuItem(name: "Lemonade Mixer", price: 4.39, description: "Lemonade Mixer"),
            // Add more Auntie Annes items as needed
        ],
        "Burgers and Fries": [
            MenuItem(name: "Nashville Spicy Chicken", price: 5.29, description: "Nashville Spicy Chicken"),
            MenuItem(name: "Grilled Chicken and Bacon", price: 7.09, description: "Grilled Chicken and Bacon"),
            MenuItem(name: "Crispy Fish Sandwich", price: 6.99, description: "Crispy Fish Sandwich"),
            MenuItem(name: "Kosher Beef Hot Dog", price: 4.29, description: "Kosher Beef Hot Dog"),
            MenuItem(name: "Burger and Cheese", price: 5.99, description: "Burger and Cheese"),
            MenuItem(name: "Bacon and Cheese Burger", price: 6.49, description: "Bacon and Cheese Burger"),
            MenuItem(name: "Avocado Pepper Jack Burger", price: 6.49, description: "Avocado Pepper Jack Burger"),
            MenuItem(name: "Double Burger and Cheese", price: 6.49, description: "Double Burger and Cheese"),
            MenuItem(name: "Chipolte Black Bean Burger and Cheese", price: 7.09, description: "Chipolte Black Bean Burger and Cheese"),
            MenuItem(name: "CYO Sandwich", price: 5.89, description: "CYO Sandwich"),
            MenuItem(name: "Grilled Cheese", price: 5.99, description: "Grilled Cheese"),
            MenuItem(name: "Beyond Burger and Cheese", price: 9.49, description: "Beyond Burger and Cheese"),
            MenuItem(name: "Patty Melt", price: 6.49, description: "Patty Melt"),
            MenuItem(name: "Philly Cheesesteak", price: 7.29, description: "Philly Cheesesteak"),
            MenuItem(name: "Chicken Tender Sandwich", price: 5.29, description: "Chicken Tender Sandwich"),
            MenuItem(name: "Three Crispy Chicken Strips", price: 4.59, description: "Three Crispy Chicken Strips"),
            MenuItem(name: "Five Crispy Chicken Strips", price: 7.29, description: "Five Crispy Chicken Strips"),
            //combos
            MenuItem(name: "Grilled Chicken and Bacon Combo", price: 10.19, description: "Grilled Chicken and Bacon Combo"),
            MenuItem(name: "Tender and Sandwich Combo", price: 8.29, description: "Tender and Sandwich Combo"),
            MenuItem(name: "Chipolte Black Bean Burger and Cheese Combo", price: 10.59, description: "Chipolte Black Bean Burger and Cheese Combo"),
            MenuItem(name: "Bacon and Cheese Burger Combo", price: 10.09, description: "Bacon and Cheese Burger Combo"),
            MenuItem(name: "Avocado Pepper Jack Burger Combo", price: 10.09, description: "Avocado Pepper Jack Burger Combo"),
            MenuItem(name: "Burger and Cheese Combo", price: 9.29, description: "Burger and Cheese Combo"),
            MenuItem(name: "Chicken Cheesesteak Combo", price: 7.29, description: "Chicken Cheesesteak Combo"),
            MenuItem(name: "Double Burger and Cheese Combo", price: 12.09, description: "Double Burger and Cheese Combo"),
            MenuItem(name: "CYO Sandwich Combo", price: 8.89, description: "CYO Sandwich Combo"),
            MenuItem(name: "Beyond Burger and Cheese Combo", price: 12.79, description: "Beyond Burger and Cheese Combo"),
            MenuItem(name: "Three Crispy Chicken Strips Combo", price: 4.59, description: "Three Crispy Chicken Strips Combo"),
            MenuItem(name: "Five Crispy Chicken Strips Combo", price: 7.29, description: "Five Crispy Chicken Strips Combo"),
            //sides
            MenuItem(name: "Motzarella Sticks", price: 6.09, description: "Motzarella Sticks"),
            MenuItem(name: "Classic Fries", price: 3.19, description: "Classic Fries"),
            MenuItem(name: "Sweet Potato Fries", price: 3.49, description: "Sweet Potato Fries"),
            MenuItem(name: "Ranch Fries", price: 2.69, description: "Ranch Fries"),
            
            // Add more Burgers and Fries items as needed
        ],
        "Hawk Wrap": [
            MenuItem(name: "Classic Wrap", price: 6.85, description: "Classic wrap"),
            MenuItem(name: "Double Classic Wrap", price: 8.85, description: "Double classic wrap"),
            MenuItem(name: "Spicy Hawk Wrap", price: 6.85, description: "Spicy Hawk Wrap"),
            MenuItem(name: "Double Spicy Wrap", price: 8.85, description: "Double Spicy Wrap"),
            MenuItem(name: "Grilled Chicken Wrap", price: 6.85, description: "Grilled Chicken Wrap"),
            MenuItem(name: "Buffalo Chicken Wrap", price: 6.85, description: "Buffalo Chicken Wrap"),
            MenuItem(name: "Chicken Caesar Wrap", price: 6.85, description: "Chicken Caesar Wrap"),
            MenuItem(name: "Vegan Hawk Wrap", price: 6.85, description: "Vegan Hawk Wrap"),
            //sides
            MenuItem(name: "Regular Fries", price: 2.35, description: "Regular Fries"),
            MenuItem(name: "Hawk Fries", price: 6.85, description: "Hawk Fries"),
            MenuItem(name: "Hawk Salad", price: 8.65, description: "Hawk Salad"),
            // Add more Hawk Wrap items as needed
        ],
        "Jamba Juice": [
            MenuItem(name: "Bold n Cold Brew", price: 4.99, description: "old Brew, Ice, Agave, Caffeine"),
            MenuItem(name: "Caribbean Passion", price: 5.99, description: "Pear, White Grape, Mango, Orange Sherbert, Strawberries, Peaches, Orange Passion Juice Blend"),
            MenuItem(name: "Gotcha Matcha", price: 7.39, description: "Matcha, Green Tea, Ice, Agave, Caffeine"),
            MenuItem(name: "Orange Dream Machine", price: 7.89, description: "Orange Juice, Orange Sherbert, Vanilla, Soy Milk, Fat-Free Vanilla Frozen Yogurt"),
            MenuItem(name: "Razzmatazz", price: 7.89, description: "Grape, Pear & Berry Juice Blend, Orange Sherbert, Strawberries, Bananas"),
            MenuItem(name: "Aloha Pineapple", price: 7.89, description: "Pineapple Juice, Pineapple Sherbert, Strawberries, Bananas, Non-Fat Greek Yogurt"),
            MenuItem(name: "Orange C Booster", price: 8.99, description: "Orange Juice, Orange Sherbert, Peaches, Bananas, Daily Vitamin & Zinc Boost"),
            MenuItem(name: "Greens N Ginger", price: 8.69, description: "Lemonade, Kale, Peaches, Mango, Ginger"),
            MenuItem(name: "Peanut Butter Choclate Love", price: 7.89, description: "Milk, Bananas, Chocolate, Peanut Butter, Moo'd Dairy Base"),
            MenuItem(name: "Strawberry Surf Rider", price: 7.89, description: "Lemonade, Lime, Sherbert, Strawberries, Peaches"),
            MenuItem(name: "Matcha Green Tea Blast", price: 8.99, description: "Soymilk, Fat-Free Vanilla Frozen Yogurt, Green Tea Matcha"),
            MenuItem(name: "Mega Mango", price: 8.69, description: "Pineapple Juice, Orange Juice, Mango, Strawberries"),
            MenuItem(name: "Apple N Greens", price: 8.69, description: "Apple, Pear, Strawberry Juice Blend, Kale, Mango, Bananas, Peaches"),
            MenuItem(name: "Peanut Butter Banana Protein Soy", price: 8.99, description: "Soymilk, Acai, Grape Juice Blend, Strawberries, Blueberries, Raspberry Sherbert, Daily Vitamin & Zinc Boost"),
            MenuItem(name: "Acai Super Antioxidant", price: 8.99, description: "Soymilk, Bananas, Peanut Butter, Whey Protein, Honey"),
            MenuItem(name: "Mango A Go Go", price: 7.89, description: "Pear, White, Grape, Mango, Orange, Passion Fruit Juice Blend, Mango Sherbert, Pineapple Sherbert"),
            MenuItem(name: "Pomegranate Paradise", price: 8.69, description: "Apple, Pear Juice Blend, Pomegranate Juice blend, Mango, Strawberries, Peaches"),
            MenuItem(name: "Strawberries Wild", price: 7.89, description: "Apple, Pear Juice Blend, Strawberry Juice Blend, Fat-Free Vanilla Frozen Yogurt, Strawberries, Bananas"),
            MenuItem(name: "Peach Perfection", price: 8.69, description: "White Grape, Pear Juice Blend, Peach Juice Blend, Mango, Peaches, Apple-Strawberry Juice Blend, Strawberries"),
            MenuItem(name: "White Gummi", price: 7.89, description: "White Grape, Peach Juice Blend, Pear Fruit Juice Blend, Pineapple Sherbert, Vanilla, Soymilk, Orange Sherbert, Raspberry Sherbert, Mangos and Lime Sherbert"),
            MenuItem(name: "Vanilla Blue Sky", price: 8.69, description: "Unsweetened Almond Milk, Vanilla, Coconut Milk, Bananas, Pineapple, Blue Spirulina Boost"),
            MenuItem(name: "Strawberry Whirl", price: 8.69, description: "Apple, Pear Juice Blend, Strawberry Juice Blend, Strawberries, Bananas"),
            MenuItem(name: "Smooth Talkin Mango", price: 8.69, description: "Oatmilk, Mango, Pineapple, Organic Agave"),
            MenuItem(name: "Peanut Butter Moo", price: 7.89, description: "Fat-Free Vanilla Frozen Yogurt, Vanilla, Soymilk, Milk, Bananas, Peanut Butter, Chocolate, Moo'd Dairy Base"),
            MenuItem(name: "Protein Berry Workout Pea", price: 8.99, description: "Vanilla, Soymilk, Pea Protein, Strawberries, Bananas"),
            MenuItem(name: "Protein Berry Workout Whey", price: 8.99, description: "Vanilla, Soymilk, Whey Protein, Strawberries, Bananas"),
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

