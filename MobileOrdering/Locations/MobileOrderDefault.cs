using System;

/// <summary>
/// Class to create the default capabilities and variables for a mobile order
/// Each location can then use aspects from this class
/// </summary>
namespace teamD.MobileOrdering.Locations
{
    internal class MobileOrderDefault
    {
        //variables needed for the mobile ordering
        public enum location { HawkWrap, AuntieAnnes, JambaJuice, TheSpread };
        public enum paymentMethod { HawkCash, DiningDollars, MealExchange, CreditorDebit };
        public enum drinks { MediumFountain, LargeFountain };
        public string comments = "none"; //to hold comments from the user

        Dictionary<drinks, float> drinkPrices = new Dictionary<drinks, float>()
        {
            { drinks.MediumFountain, 2.99f },
            { drinks.LargeFountain, 3.29f }
        };
        public location orderLocation; //reads in from front end
        //if location then refer to that file
        public float totalPrice = 0f; //variable to hold total price
        public paymentMethod paymentMethodUsed = paymentMethod.HawkCash; //variable to hold payment method
        public drinks drinkOrdered; //variable to hold drink
    }
}
