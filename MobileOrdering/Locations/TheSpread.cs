using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace teamD.MobileOrdering.Locations
{
    internal class TheSpread : MobileOrderDefault
    {
        enum generalOrders { SixinFourCheese, SixinHamAmerican, SixinTurkeySwiss, SixinTurkeyBaconMultigrain, SixinItalian, TwelveArticholkeRedPepperSub, SixinCapreseCiabatta,
        TwelveinCapreseCiabatta, SixinRoastBeefCheddar, TwelveBuffChickSub, TwelveHamAmerican, SixTunaSalad, TwelveChickCaesarWrap, TwelveFourCheese, TwelveSigItalianSub,
        TwelveItalian, TwelveTurkeyBaconMultigrain, SixBuffChickSub, TwelveRoastBeefCheddar, TwelveTunaSalad, TwelveTurkeySwiss, SixChickCaesarWrap, SixArtichokeRedPepSub,
        SixinSigItalianSub};

        enum sides { SignatureChips, CraveWorthyChocoChipCookie};

        Dictionary<generalOrders, float> foodPrices = new Dictionary<generalOrders, float>()
        {
            { generalOrders.SixinFourCheese, 5.79f },
            { generalOrders.SixinHamAmerican, 7.49f },
            { generalOrders.SixinTurkeySwiss, 7.49f },
            { generalOrders.SixinTurkeyBaconMultigrain, 8.59f },
            { generalOrders.SixinItalian, 7.99f },
            { generalOrders.TwelveArticholkeRedPepperSub, 16.09f },
            { generalOrders.SixinCapreseCiabatta, 8.59f },
            { generalOrders.TwelveinCapreseCiabatta, 16.09f },
            { generalOrders.SixinRoastBeefCheddar, 7.99f },
            { generalOrders.TwelveBuffChickSub, 16.09f },
            { generalOrders.TwelveHamAmerican, 14.49f },
            { generalOrders.SixTunaSalad, 7.49f },
            { generalOrders.TwelveChickCaesarWrap, 16.09f },
            { generalOrders.TwelveFourCheese, 10.79f },
            { generalOrders.TwelveSigItalianSub, 16.79f },
            { generalOrders.TwelveItalian, 14.99f },
            { generalOrders.TwelveTurkeyBaconMultigrain, 16.09f },
            { generalOrders.SixBuffChickSub, 8.59f },
            { generalOrders.TwelveRoastBeefCheddar, 14.99f },
            { generalOrders.TwelveTunaSalad, 14.49f },
            { generalOrders.TwelveTurkeySwiss, 14.49f },
            { generalOrders.SixChickCaesarWrap, 8.59f },
            { generalOrders.SixArtichokeRedPepSub, 8.59f },
            { generalOrders.SixinSigItalianSub, 9.29f }
        };
    }
}
