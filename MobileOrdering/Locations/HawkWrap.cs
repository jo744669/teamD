using System;

/// <summary>
/// to be used for hawk wrap mobile ordering
/// </summary>
public class HawkWrap : MobileOrderDefault
{
    public HawkWrap()
    {
        var currentLocation = location.HawkWrap;
        string comments = ""; //comments added from the user
        enum generalOrders { Classic, DoubleClassic, Spicy, DoubleSpicy, GrilledChick, BuffChick, ChickCaesar, Vegan }; //options to pick to order
        enum sides { RegFries, HawkFries, HawkSalad }; //side options
        enum toppings { AmericanCheese, Lettuce, Onion, Pickles, ShreddedCheese, Tomato };
        enum sauces { HawkSauce, Buffalo, Ranch, Caesar, BBQ };
        bool sauceOnTheSide = false; //if want sauce on the side
        bool customize; //like to customize?

        //mapping all of the prices to their generalOrder
        Dictionary<generalOrders, float> foodPrices = new Dictionary<generalOrders, float>()
        {
            { generalOrders.Classic, 6.85f },
            { generalOrders.DoubleClassic, 8.85f },
            { generalOrders.Spicy, 6.85f },
            { generalOrders.DoubleSpicy, 8.85f },
            { generalOrders.GrilledChick, 6.85f },
            { generalOrders.BuffChick, 6.85f },
            { generalOrders.ChickCaesar, 6.85f },
            { generalOrders.Vegan, 6.85f }
        };

        Dictionary<sides, float> sidePrices = new Dictionary<sides, float>()
        {
            { sides.RegFries, 2.35f },
            { sides.HawkFries, 6.85f },
            { sides.HawkSalad, 8.65f }
        };

        //define customize toppings option
        //read in order from front end
        //if customize - read in what they want from frontend
        //read in sauce option and if they want it on the side
        //allow to add comment - read in from front end
    }
}
