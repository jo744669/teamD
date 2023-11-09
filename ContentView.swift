import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            menuPage()
                .tabItem() {
                    Text ("Menu")
                }
            account()
                .tabItem() {
                    Text ("Account")
                }
            pastOrders()
                .tabItem() {
                    Text ("Order History")
                }
        }
    
    }
}

    struct SontentView_previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
}
