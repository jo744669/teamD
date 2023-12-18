import SwiftUI

class UserEmailManager: ObservableObject {
    @Published var userEmail: String?
    
    static let shared = UserEmailManager()
    
    private init() {}
}
