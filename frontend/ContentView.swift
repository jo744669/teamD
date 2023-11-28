// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var cart = Cart()

    var body: some View {
        TabView {
            menuPage()
                .tabItem {
                    Text("Menu")
                    Image(systemName: "menucard")
                }
                .onTapGesture {
                    // Handle focus change if needed
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }

            Account()
                .tabItem {
                    Text("Account")
                    Image(systemName: "person")
                }
                .onTapGesture {
                    // Handle focus change if needed
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }

            pastOrders()
                .tabItem {
                    Text("Order History")
                    Image(systemName: "arrow.clockwise")
                }

            CartView(cart: cart)
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

