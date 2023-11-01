using System;

/// <summary>
/// to be used for auntie annes mobile ordering
/// </summary>
namespace teamD.MobileOrdering.Locations
{
    internal class AuntieAnnes : MobileOrderDefault
    {
        enum generalOrders { pretzel, originalPretzelDogs, miniDogs, nuggetsCupOriginal, nuggetsCupCinnamon, nuggetsCupPepperoni, nuggetsBucketOriginal,
        nuggetsBucketCinnamon, nuggetsBucketPepperoni };
        enum sauces { caramel, cheese, creamCheese, honeyMustard, hotSalsaCheese, marinara };
        enum specialDrinks { originalLemonade, lemonadeMixer };

        //mapping all of the prices to their generalOrder
        Dictionary<generalOrders, float> foodPrices = new Dictionary<generalOrders, float>()
        {
            { generalOrders.pretzel, 4.295f },
            { generalOrders.originalPretzelDogs, 4.99f },
            { generalOrders.miniDogs, 6.59f },
            { generalOrders.nuggetsCupOriginal, 5.79f },
            { generalOrders.nuggetsCupCinnamon, 5.89f },
            { generalOrders.nuggetsCupPepperoni, 6.59f },
            { generalOrders.nuggetsBucketOriginal, 26.99f },
            { generalOrders.nuggetsBucketCinnamon, 27.99f },
            { generalOrders.nuggetsBucketPepperoni, 32.99f },
        };

        //map the prices to the sauces
        Dictionary<sauces, float> saucePrices = new Dictionary<sauces, float>()
        {
            { sauces.caramel, 1.19f },
            { sauces.cheese, 1.19f },
            { sauces.creamCheese, 1.19f },
            { sauces.honeyMustard, 1.19f },
            { sauces.hotSalsaCheese, 1.19f },
            { sauces.marinara, 1.19f }
        };

        //map the special drinks to prices
        Dictionary<specialDrinks, float> specialDrinkPrices = new Dictionary<specialDrinks, float>()
        {
            { specialDrinks.originalLemonade, 3.99f },
            { specialDrinks.lemonadeMixer, 4.39f }
        };
    }
}
