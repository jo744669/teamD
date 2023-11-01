using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace teamD.MobileOrdering.Locations
{
    internal class JambaJuice
    {
        //map each option to description as well
        //sweet cold whip? if gotchaMatcha, boldNColdBrew,
        enum generalOrdersSmoothies { boldNColdBrew, caribbeanPassion, gotchaMatcha, orangeDreamMachine, razzmatazz, alohaPineapple, orangeCBooster, greensNGinger,
        pbChocolateLove, strawberrySurfRider, matchaGreenTeaBlast, megaMango, appleNGreens, pbBananaProteinSoy, acaiSuperAntioxidant, mangoAGoGo, pomegranateParadise, strawberriesWild, 
        peachPerfection, whiteGummi, vanillaBlueSky, strawberryWhirl, smoothTalkinMango, peanutButterMoo, proteinBerryWorkoutPea, proteinBerryWorkoutWhey };

        enum generalOrdersBowls { chuckyStrawberryBowl, acaiPrimoBowl, vanillaBlueSkyBowl, dragonfruitDelightBowl };

        //smoothies mapped to their prices
        Dictionary<generalOrdersSmoothies, float> smoothiePrices = new Dictionary<generalOrdersSmoothies, float>
        {
            { generalOrdersSmoothies.boldNColdBrew, 7.39f },
            { generalOrdersSmoothies.caribbeanPassion, 7.89f },
            { generalOrdersSmoothies.gotchaMatcha, 7.39f },
            { generalOrdersSmoothies.orangeDreamMachine, 7.89f },
            { generalOrdersSmoothies.razzmatazz, 7.89f },
            { generalOrdersSmoothies.alohaPineapple, 7.89f },
            { generalOrdersSmoothies.orangeCBooster, 8.99f },
            { generalOrdersSmoothies.greensNGinger, 8.69f },
            { generalOrdersSmoothies.pbChocolateLove, 7.89f },
            { generalOrdersSmoothies.strawberrySurfRider, 7.89f },
            { generalOrdersSmoothies.matchaGreenTeaBlast, 8.99f },
            { generalOrdersSmoothies.megaMango, 8.69f },
            { generalOrdersSmoothies.appleNGreens, 8.69f },
            { generalOrdersSmoothies.pbBananaProteinSoy, 8.99f },
            { generalOrdersSmoothies.acaiSuperAntioxidant, 8.99f },
            { generalOrdersSmoothies.mangoAGoGo, 7.89f },
            { generalOrdersSmoothies.pomegranateParadise, 8.69f },
            { generalOrdersSmoothies.strawberriesWild, 7.89f },
            { generalOrdersSmoothies.peachPerfection, 8.69f },
            { generalOrdersSmoothies.whiteGummi, 7.89f },
            { generalOrdersSmoothies.vanillaBlueSky, 8.69f },
            { generalOrdersSmoothies.strawberryWhirl, 8.69f },
            { generalOrdersSmoothies.smoothTalkinMango, 8.69f },
            { generalOrdersSmoothies.peanutButterMoo, 7.89f },
            { generalOrdersSmoothies.proteinBerryWorkoutPea, 8.99f },
            { generalOrdersSmoothies.proteinBerryWorkoutWhey, 8.99f },
        };

        //bowls mapped to their prices
        Dictionary<generalOrdersBowls, float> bowlPrices = new Dictionary<generalOrdersBowls, float>
        {
            { generalOrdersBowls.chuckyStrawberryBowl, 8.99f },
            { generalOrdersBowls.acaiPrimoBowl, 8.99f },
            { generalOrdersBowls.vanillaBlueSkyBowl, 8.99f },
            { generalOrdersBowls.dragonfruitDelightBowl, 8.99f }
        };

        //smoothies mapped to descriptions
        Dictionary<generalOrdersSmoothies, string> smoothieDescriptions = new Dictionary<generalOrdersSmoothies, string>
        {
            { generalOrdersSmoothies.boldNColdBrew, "Cold Brew, Ice, Agave, Caffeine" },
            { generalOrdersSmoothies.caribbeanPassion, "Pear, White Grape, Mango, Orange Sherbert, Strawberries, Peaches, Orange Passion Juice Blend" },
            { generalOrdersSmoothies.gotchaMatcha, "Matcha, Green Tea, Ice, Agave, Caffeine" },
            { generalOrdersSmoothies.orangeDreamMachine, "Orange Juice, Orange Sherbert, Vanilla, Soy Milk, Fat-Free Vanilla Frozen Yogurt" },
            { generalOrdersSmoothies.razzmatazz, "Grape, Pear & Berry Juice Blend, Orange Sherbert, Strawberries, Bananas" },
            { generalOrdersSmoothies.alohaPineapple, "Pineapple Juice, Pineapple Sherbert, Strawberries, Bananas, Non-Fat Greek Yogurt" },
            { generalOrdersSmoothies.orangeCBooster, "Orange Juice, Orange Sherbert, Peaches, Bananas, Daily Vitamin & Zinc Boost" },
            { generalOrdersSmoothies.greensNGinger, "Lemonade, Kale, Peaches, Mango, Ginger" },
            { generalOrdersSmoothies.pbChocolateLove, "Milk, Bananas, Chocolate, Peanut Butter, Moo'd Dairy Base" },
            { generalOrdersSmoothies.strawberrySurfRider, "Lemonade, Lime, Sherbert, Strawberries, Peaches" },
            { generalOrdersSmoothies.matchaGreenTeaBlast, "Soymilk, Fat-Free Vanilla Frozen Yogurt, Green Tea Matcha" },
            { generalOrdersSmoothies.megaMango, "Pineapple Juice, Orange Juice, Mango, Strawberries" },
            { generalOrdersSmoothies.appleNGreens, "Apple, Pear, Strawberry Juice Blend, Kale, Mango, Bananas, Peaches" },
            { generalOrdersSmoothies.acaiSuperAntioxidant, "Soymilk, Acai, Grape Juice Blend, Strawberries, Blueberries, Raspberry Sherbert, Daily Vitamin & Zinc Boost" },
            { generalOrdersSmoothies.pbBananaProteinSoy, "Soymilk, Bananas, Peanut Butter, Whey Protein, Honey" },
            { generalOrdersSmoothies.mangoAGoGo, "Pear, White, Grape, Mango, Orange, Passion Fruit Juice Blend, Mango Sherbert, Pineapple Sherbert" },
            { generalOrdersSmoothies.pomegranateParadise, "Apple, Pear Juice Blend, Pomegranate Juice blend, Mango, Strawberries, Peaches" },
            { generalOrdersSmoothies.strawberriesWild, "Apple, Pear Juice Blend, Strawberry Juice Blend, Fat-Free Vanilla Frozen Yogurt, Strawberries, Bananas" },
            { generalOrdersSmoothies.peachPerfection, "White Grape, Pear Juice Blend, Peach Juice Blend, Mango, Peaches, Apple-Strawberry Juice Blend, Strawberries" },
            { generalOrdersSmoothies.whiteGummi, "White Grape, Peach Juice Blend, Pear Fruit Juice Blend, Pineapple Sherbert, Vanilla, Soymilk, Orange Sherbert, Raspberry Sherbert, Mangos and Lime Sherbert" },
            { generalOrdersSmoothies.vanillaBlueSky, "Unsweetened Almond Milk, Vanilla, Coconut Milk, Bananas, Pineapple, Blue Spirulina Boost" },
            { generalOrdersSmoothies.strawberryWhirl, "Apple, Pear Juice Blend, Strawberry Juice Blend, Strawberries, Bananas" },
            { generalOrdersSmoothies.smoothTalkinMango, "Oatmilk, Mango, Pineapple, Organic Agave" },
            { generalOrdersSmoothies.peanutButterMoo, "Fat-Free Vanilla Frozen Yogurt, Vanilla, Soymilk, Milk, Bananas, Peanut Butter, Chocolate, Moo'd Dairy Base" },
            { generalOrdersSmoothies.proteinBerryWorkoutPea, "Vanilla, Soymilk, Pea Protein, Strawberries, Bananas" },
            { generalOrdersSmoothies.proteinBerryWorkoutWhey, "Vanilla, Soymilk, Whey Protein, Strawberries, Bananas" }
        };

        //bowl options
        enum bowlBoosts { threeGEnergy, dailyVitaminZinc, soyProtein, wheyProtein };
        enum bowlBoosts2 { blueSpirulina, ginger, kale, matchaPowder, nonfatGreekYogurt, peanutButter };
        //if add a second boost, add .75 to total
    }
}
