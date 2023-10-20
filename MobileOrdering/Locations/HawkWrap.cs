using System;
using Systems.Collections.Generic.Dictionary;

/// <summary>
/// to be used for hawk wrap mobile ordering
/// </summary>
public class HawkWrap
{
	public HawkWrap : MobileOrderDefault()
	{
		var currentLocation = location.HawkWrap;
		string comments; //comments added from the user
		Enum generalOrders = {Classic, DoubleClassic, Spicy, DoubleSpicy, GrilledChick, BuffChick, ChickCaesar, Vegan }; //options to pick to order
        Enum sides = { RegFries, HawkFries, HawkSalad }; //side options
        Enum toppings = { AmericanCheese, Lettuce, Onion, Pickles, ShreddedCheese, Tomato };
        Enum sauces = { HawkSauce, Buffalo, Ranch, Caesar, BBQ };
        boolean sauceOnTheSide = false; //if want sauce on the side
        boolean customize; //like to customize?

        //mapping all of the prices to their generalOrder
        Dictionary<generalOrders, float> foodPrices = new Dictionary<generalOrders, float>();
		foodPrices.Add(Classic, 6.85);
        foodPrices.Add(DoubleClassic, 8.85);
        foodPrices.Add(Spicy, 6.85);
        foodPrices.Add(DoubleSpicy, 8.85);
        foodPrices.Add(GrilledChick, 6.85);
        foodPrices.Add(BuffChick, 6.85);
        foodPrices.Add(ChickCaesar, 6.85);
        foodPrices.Add(Vegan, 6.85);

        Dictionay<sides, float> sidePrices = new Dictionary<sides, float>();
        sidePrices.Add(RegFries, 2.35);
        sidePrices.Add(HawkFries, 6.65);
        sidePrices.Add(HawkSalad, 8.65);

		//define customize toppings option
		//read in order from front end
		//if customize - read in what they want from frontend
        //read in sauce option and if they want it on the side
		//allow to add comment - read in from front end
	}
}
