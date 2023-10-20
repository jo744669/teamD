using System;

/// <summary>
/// Class to create the default capabilities and variables for a mobile order
/// Each location can then use aspects from this class
/// </summary>
public class MobileOrderDefault
{
	public MobileOrderDefault()
	{
		//variables needed for the mobile ordering
		Enum location = { HawkWrap, AuntieAnnes, JambaJuice, TheSpread };
		Enum paymentMethod = { HawkCash, DiningDollars, MealExchange, CreditorDebit };
		Enum drinks = { MediumFountain, LargeFountain };

		Dictionary<drinks, float> drinkPrices = new Dictionary<drinks, float>();
		drinkPrices.Add(MediumFountain, 2.99);
		drinkPrices.Add(LargeFountain, 3.29);
    }
}
