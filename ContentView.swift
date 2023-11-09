import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            menuPage()
                .tabItem() {
                    Text ("Menu")
                    Image(systemName: "menucard")
                }
            account()
                .tabItem() {
                    Text ("Account")
                    Image(systemName: "person")
                }
            pastOrders()
                .tabItem() {
                    Text ("Order History")
                    Image(systemName: "arrow.clockwise")
                    
                }
        }
    
    }
}

    struct SontentView_previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
}
