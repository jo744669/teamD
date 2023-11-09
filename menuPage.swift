import SwiftUI

struct menuPage: View {
    var body: some View {
        NavigationStack {
            
            List {
                Section(header: Text ("Auntie Annes")){
                    Text("Pretzel")
                    Text("Pretzel dogs")
                    Text("Mini dogs")
                    Text("Nuggets cup")
                    Text("Cinnamon nuggets cup")
                    Text("Pepperoni nuggets cup")
                    Text("Nuggets bucket")
                    Text("Cinnamon nuggets bucket")
                    Text("Pepperoni nuggets bucket")
                }
                Section(header: Text ("Burgers and Fries")){
                    Text("Nashville spicy chicken")
                    Text("Grilled chicken and bacon")
                    Text("Fish sandwich")
                    Text("Kosher beef hotdog")
                    Text("Burger and cheese")
                    Text("Burger with bacon and cheese")
                    Text("Burger with avocado pepper jack")
                    Text("Double burger and cheese")
                    Text("Chipolte black bean burger and cheese")
                    Text("CYO Sandwich combo")
                    Text("CYO sandwich")
                    Text("Grilled cheese")
                    Text("Beyond cheese burger")
                    Text("Patty melt")
                    Text("Philly cheesesteak")
                    Text("Chicken tender sandwich")
                    Text("3 Crispy chicken strips")
                    Text("5 Crispy chicken strips")
                }
                Section(header: Text ("Hawk Wrap")){
                    Text("Classic")
                    Text("Double classic")
                    Text("Spicy")
                    Text("Double spicy")
                    Text("Grilled chicken wrap")
                    Text("Buffalo chicken wrap")
                    Text("Chicken caesar wrap")
                    Text("Vegan hawk wrap")
                }
                Section(header: Text ("Jamba Juice")){
                    Text("Bold n cold brew")
                    Text("Caribbean passion")
                    Text("Gotcha matcha")
                    Text("Orange dream machine")
                    Text("Razzmatazz")
                    Text("Aloha pinapple")
                    Text("Orange C booster")
                    Text("Greens N Ginger")
                    Text("Peanut butter choclate love")
                    Text("Strawberry surf rider")
                    Text("Matcha grean tea blast")
                    Text("Mega mango")
                    Text("Apples and greens")
                    Text("Peanut butter banana protein soy")
                    Text("Acai super antioxidant")
                    Text("Mango a go go")
                    Text("Pomegranate paradise")
                    Text("Strawberries wild")
                    Text("Peach perfection")
                    Text("White gummi")
                    Text("Vanilla blue sky")
                    Text("Strawberry whirl")
                    Text("Smooth talkin mango")
                    Text("Peanut butter moo")
                    Text("Protein berry workout pea")
                    Text("Protein berry workout whey")
                }
                //MISSING THE SPREAD
            }
            .navigationTitle("The Drop")
            }
        }
    }


    struct ContentView_previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
}
