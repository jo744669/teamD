import SwiftUI

@main
struct SJU_Orderingapp: App {
    @StateObject private var userEmailManager = UserEmailManager.shared
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(userEmailManager)
        }
    }
}




