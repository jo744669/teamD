import SwiftUI

struct ItemDetails: View {
    var item: MenuItem
    @ObservedObject var cart: Cart

    var body: some View {
        VStack {
            Text(item.name)
                .font(.title)

            Text("Price: $\(item.price)")
                .foregroundColor(.gray)

            Button("Add to Cart") {
                cart.addItem(itemName: item.name, itemPrice: item.price)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle(item.name)
    }
}

#if DEBUG
struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(item: MenuItem(name: "Sample Item", price: 9.99, description: "A delicious item"), cart: Cart())
    }
}
#endif

