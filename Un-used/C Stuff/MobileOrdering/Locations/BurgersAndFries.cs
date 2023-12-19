using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace teamD.MobileOrdering.Locations
{
    internal class BurgersAndFries
    {
        //defining enums with everything you can order separated by general orders, combos, and sides
        enum generalOrdersSingle { nashSpicyChick, grillChickAndBacon, crispyFishSandwich, kosherBeefHotDog, burgerAndCheese, burgerBaconCheese, 
             burgerAvocadoPepperJack, doubleBurgerAndCheese, chipotleBlackBeanCheese, cyoSandwich, grilledCheese, beyondAndCheeseBurger, pattyMelt, 
             phillyCheesesteak, chickTenderSandwich, crispyChickStripsThree, crispyChickStripsFive};

        enum generalOrdersCombos { grillChickAndBaconCombo, tenderSandwichCombo, chipotleBlackBeanAndCheeseCombo, burgerBaconCheeseCombo, burgerAvocadoPepperJackCombo, 
             burgerCheeseCombo, chickCheesesteakCombo, doubleBurgerCheeseCombo, cyoSandwhichCombo, beyondAndCheeseBurgerCombo, chickCrispyStripsThreeCombo,
             crispyChickStripsFiveCombo};

        enum sides { motzarellaSticks, classicFries, sweetPotatoFries, ranchFries };

        bool customize; //when true, allows user to customize


        Dictionary<generalOrdersSingle, float> singleOptionPrices = new Dictionary<generalOrdersSingle, float>()
        {
            { generalOrdersSingle.nashSpicyChick, 5.29f },
            { generalOrdersSingle.grillChickAndBacon, 7.09f },
            { generalOrdersSingle.crispyFishSandwich, 6.99f },
            { generalOrdersSingle.kosherBeefHotDog, 4.29f },
            { generalOrdersSingle.burgerAndCheese, 5.99f },
            { generalOrdersSingle.burgerBaconCheese, 6.49f },
            { generalOrdersSingle.burgerAvocadoPepperJack, 6.49f },
            { generalOrdersSingle.doubleBurgerAndCheese, 6.49f },
            { generalOrdersSingle.chipotleBlackBeanCheese, 7.09f },
            { generalOrdersSingle.cyoSandwich, 5.89f },
            { generalOrdersSingle.grilledCheese, 5.99f },
            { generalOrdersSingle.beyondAndCheeseBurger, 9.49f },
            { generalOrdersSingle.pattyMelt, 6.49f },
            { generalOrdersSingle.phillyCheesesteak, 7.29f },
            { generalOrdersSingle.chickTenderSandwich, 5.29f },
            { generalOrdersSingle.crispyChickStripsThree, 4.59f },
            { generalOrdersSingle.crispyChickStripsFive, 7.29f }
        };

        Dictionary<generalOrdersCombos, float> comboOptionPrices = new Dictionary<generalOrdersCombos, float>
        {
            { generalOrdersCombos.grillChickAndBaconCombo, 10.19f },
            { generalOrdersCombos.tenderSandwichCombo, 8.29f },
            { generalOrdersCombos.chipotleBlackBeanAndCheeseCombo, 10.59f },
            { generalOrdersCombos.burgerBaconCheeseCombo, 10.09f },
            { generalOrdersCombos.burgerAvocadoPepperJackCombo, 10.09f },
            { generalOrdersCombos.burgerCheeseCombo, 9.29f },
            { generalOrdersCombos.chickCheesesteakCombo, 7.29f },
            { generalOrdersCombos.doubleBurgerCheeseCombo, 12.09f },
            { generalOrdersCombos.cyoSandwhichCombo, 8.89f },
            { generalOrdersCombos.beyondAndCheeseBurgerCombo, 12.79f },
            { generalOrdersCombos.chickCrispyStripsThreeCombo, 4.59f },
            { generalOrdersCombos.crispyChickStripsFiveCombo, 7.29f }
        };

        Dictionary<sides, float> sidesPrices = new Dictionary<sides, float>
        {
            { sides.motzarellaSticks, 6.09f },
            { sides.classicFries, 3.19f },
            { sides.sweetPotatoFries, 3.49f },
            { sides.ranchFries, 2.69f }
        };
    }
}
