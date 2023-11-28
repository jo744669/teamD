import SwiftUI

@main
struct SJU_Orderingapp: App {
    // Create an instance of Cart
    @StateObject private var cart = Cart()

    var body: some Scene {
        WindowGroup {
            // Set Cart as an environment object
            ContentView()
                .environmentObject(cart)
        }
    }
}



