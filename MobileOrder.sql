/*CREATING THE TABLES*/

/*
Users : holds all users based on their user_id including remaining balances for the various payment methods
Will be populated from the front end when a profile is created
*/
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(100), 
    last_name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    hawkcash Decimal(10, 2),
    diningdollars Decimal(10, 2),
    mealexchange int
);

/*
foods : all food options by id including name and price
*/
CREATE TABLE foods (
    food_id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2)
);

/*
food_options : 
*/
Create Table food_options (
	food_id INT,
    option_number int,
    name VARCHAR(100),
    foreign key(food_id) references foods(food_id)
);

/*
payment_types : holds different payment methods
*/
Create Table payment_types (
	payment_id INT PRIMARY KEY,
    type VARCHAR(50)
);

/*
orders: holds previous orders by user to be sorted by date
*/
CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	user_id INT,
    payment_id INT,
    order_date DATE,
    completed VARCHAR(10),
    foreign key(user_id) references users(user_id),
    foreign key(payment_id) references payment_types(payment_id)
);

/*
contain : 
*/
Create Table contain (
	order_id INT,
    food_id INT,
    foreign key(order_id) references orders(order_id),
    foreign key(food_id) references foods(food_id)
);

/*
resturants : different locations to order from
*/
Create Table restaurants (
	restaurant_id INT PRIMARY KEY,
    name VARCHAR(50),
);

/*
serve : 
*/
Create Table serve (
	restaurant_id INT,
    food_id INT,
    foreign key(restaurant_id) references restaurants(restaurant_id),
    foreign key(food_id) references foods(food_id)
);

/*
cards : holds any cards user has attached to their account
*/
Create Table cards (
	card_number INT PRIMARY KEY,
    name VARCHAR(50),
    expiration_date DATE,
    cvv INT,
    zip_code INT
);

/*
hawk_wraps : holds all of the data for the hawk wraps location
*/
Create Table hawk_wraps (
    foreign key(resturand_id) references resturants(resturand_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    main_dish BOOLEAN,
    toppings BOOLEAN,
    side_dish BOOLEAN,
    drink BOOLEAN,
    sauce BOOLEAN
)

/*
jamba_juice : holds all of the data for the jamba juice location
*/
Create Table jamba_juice (
    foreign key(resturand_id) references resturants(resturand_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    smoothie BOOLEAN,
    bowl BOOLEAN,
    description VARCHAR(300),
    bowl_boost BOOLEAN
)

/*
burgers_and_fries : holds all of the data for the burgers and fries location
*/
Create Table jamba_juice (
    foreign key(resturand_id) references resturants(resturand_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    main_dish_single BOOLEAN,
    main_dish_combo BOOLEAN,
    side_dish BOOLEAN,
    drink BOOLEAN
)

/*
the_spread : holds all of the data for the spread location
*/
Create Table the_spread (
    foreign key(resturand_id) references resturants(resturand_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    main_dish BOOLEAN,
    side_dish BOOLEAN,
    drink BOOLEAN
)

/*
auntie_annes : holds all of the data for auntie annes location
*/
Create Table auntie_annes (
    foreign key(resturand_id) references resturants(resturand_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    main_dish BOOLEAN,
    sauce BOOLEAN,
    drink BOOLEAN
)

/*
have : 
*/
Create Table have (
	user_id INT,
    card_number INT,
    foreign key(user_id) references users(user_id),
    foreign key(card_number) references cards(card_number)
);

/*POPULATING THE TABLES*/

/* Populating the foods table*/

Insert into foods values(101, "prezel", 4.29);
Insert into foods values(102, "originalPrezelDogs", 4.99);
Insert into foods values(103, "miniDogs", 6.59);
Insert into foods values(104, "nuggetsCupOriginal", 5.79);
Insert into foods values(105, "nuggetsCupCinnamon", 5.89);
Insert into foods values(106, "nuggetsCupPepperoni", 6.59);
Insert into foods values(107, "nuggetsBucketOriginal", 26.99);
Insert into foods values(108, "nuggetsBucketCinnamon", 27.99);
Insert into foods values(109, "nuggetsBucketPepperoni", 32.99);
Insert into foods values(110, "caramel", 1.19);
Insert into foods values(111, "cheese", 1.19);
Insert into foods values(112, "creamCheese", 1.19);
Insert into foods values(113, "honeyMustard", 1.19);
Insert into foods values(114, "hotSalsaCheese", 1.19);
Insert into foods values(115, "marinara", 1.19);
Insert into foods values(116, "originalLemonade", 3.99);
Insert into foods values(117, "lemonadeMixer", 4.39);


Insert into foods values(201, "nashSpicyChick", 5.29);
Insert into foods values(202, "grillChickAndBacon", 7.09);
Insert into foods values(203, "crispyFishSandwich", 6.99);
Insert into foods values(204, "kosherBeefHotDog", 4.29);
Insert into foods values(205, "burgerAndCheese", 5.99);
Insert into foods values(206, "burgerBaconCheese", 6.49);
Insert into foods values(207, "burgerAvacadoPepperJack", 6.49);
Insert into foods values(208, "doubleBurgerAndCheese", 6.49);
Insert into foods values(209, "chipotleBlackBeanCheese", 7.09);
Insert into foods values(210, "cyoSandwich", 5.89);
Insert into foods values(211, "grilledCheese", 5.99);
Insert into foods values(212, "beyondAndCheeseBurger", 9.49);
Insert into foods values(213, "pattyMelt", 6.49);
Insert into foods values(214, "phillyCheesesteak", 7.29);
Insert into foods values(215, "chickenTenderSandwich", 5.29);
Insert into foods values(216, "crispyChickStripsThree", 4.59);
Insert into foods values(217, "crispyChickStripsFive", 7.29);

Insert into foods values(218, "grillChickAndBaconCombo", 10.19);
Insert into foods values(219, "tenderSandwichCombo", 8.29);
Insert into foods values(220, "chipotleBlackBeanAndCheeseCombo", 10.59);
Insert into foods values(221, "burgerBaconCheeseCombo", 10.09);
Insert into foods values(222, "burgerAvacadoPepperJackCombo", 10.09);
Insert into foods values(223, "burgerAndCheeseCombo", 9.29);
Insert into foods values(224, "chickCheesesteakCombo", 7.29);
Insert into foods values(225, "doubleBurgerCheeseCombo", 12.09);
Insert into foods values(226, "cyoSandwichCombo", 8.89);
Insert into foods values(227, "beyondAndCheeseBurgerCombo", 12.79);
Insert into foods values(228, "crispyChickStripsThreeCombo", 4.59);
Insert into foods values(229, "crispyChickStripsFiveCombo", 7.29);

Insert into foods values(230, "motzarellaSticks", 6.09);
Insert into foods values(231, "classicFries", 3.19);
Insert into foods values(232, "sweetPotatoFries", 3.49);
Insert into foods values(233, "ranchFries", 2.69);


Insert into foods values(301, "Classic", 6.85);
Insert into foods values(302, "DoubleClassic", 8.85);
Insert into foods values(303, "Spicy", 6.85);
Insert into foods values(304, "DoubleSpicy", 8.85);
Insert into foods values(305, "GrilledChick", 6.85);
Insert into foods values(306, "BuffChick", 6.85);
Insert into foods values(307, "ChickCaesar", 6.85);
Insert into foods values(308, "Vegan", 6.85);

Insert into foods values(309, "RegFries", 2.35);
Insert into foods values(310, "HawkFires", 6.85);
Insert into foods values(311, "HawkSalad", 8.65);

Insert into foods values(401, "boldNColdBrew", 7.39);
Insert into foods values(402, "caribbeanPassion", 7.89);
Insert into foods values(403, "gotchaMatcha", 7.39);
Insert into foods values(404, "orangeDreamMachine", 7.89);
Insert into foods values(405, "razzmatazz", 7.89);
Insert into foods values(406, "alohaPineapple", 7.89);
Insert into foods values(407, "orangeBooster", 8.99);
Insert into foods values(408, "greensNGinger", 8.69);
Insert into foods values(409, "pbChocolateLove", 7.89);
Insert into foods values(410, "caribbeanPassion", 7.89);
Insert into foods values(411, "strawberrySurfRider", 7.89);
Insert into foods values(412, "matchaGreenTeaBlast", 8.99);
Insert into foods values(413, "megaMango", 8.69);
Insert into foods values(414, "pbBananaProteinSoy", 8.99);
Insert into foods values(415, "acaiSuperAnioxidant", 8.99);
Insert into foods values(416, "mangoAGoGo", 7.89);
Insert into foods values(417, "pomegrantateParadise", 8.69);
Insert into foods values(418, "strawberriesWild", 7.89);
Insert into foods values(419, "peachPerfection", 8.69);
Insert into foods values(420, "whiteGummi", 7.89);
Insert into foods values(421, "vanillaBlueSky", 8.69);
Insert into foods values(422, "strawberyWhirl", 8.69);
Insert into foods values(423, "smoothTalkinMango", 8.99);
Insert into foods values(424, "peanutButterMoo", 8.69);
Insert into foods values(425, "proteinBerryWorkoutPea", 8.99);
Insert into foods values(426, "proteinBerryWorkoutWhey", 8.99);

Insert into foods values(427, "chuckyStrawberryBowl", 8.99);
Insert into foods values(428, "acaiPrimoBowl", 8.99);
Insert into foods values(429, "vanillaBlueSkyBowl", 8.99);
Insert into foods values(430, "dragonfruitDelightBowl", 8.99);


Insert into foods values(501, "SixinFourCheese", 5.79);
Insert into foods values(502, "SixinHamAmerican", 7.49);
Insert into foods values(503, "SixinTurkeySwiss", 7.49);
Insert into foods values(504, "SixinTurkeyBaconMultigrain", 8.59);
Insert into foods values(505, "SixinItalian", 7.99);
Insert into foods values(506, "TwelveArticholkeRedPepperSub", 16.09);
Insert into foods values(507, "SixinCapreseCiabatta", 8.59);
Insert into foods values(508, "TwelveinCapreseCiabatta", 16.09);
Insert into foods values(509, "SixinRoastBeefCheddar", 7.99);
Insert into foods values(510, "TwelveBuffChickSub", 16.09);
Insert into foods values(511, "TwelveHamAmerican", 14.49);
Insert into foods values(512, "SixTunaSalad", 7.49);
Insert into foods values(513, "TwelveChickCasearWrap", 16.09);
Insert into foods values(514, "TwelveFourCheese", 10.79);
Insert into foods values(515, "TwelveSigItalianSub", 16.79);
Insert into foods values(516, "TwelveItalian", 14.99);
Insert into foods values(517, "TwelveTurkeyBaconMultigrain", 16.09);
Insert into foods values(518, "SixBuffChickSub", 8.59);
Insert into foods values(519, "TwelveRoastBeefCheddar", 14.99);
Insert into foods values(520, "TwelveTunaSalad", 14.49);
Insert into foods values(521, "TwelveTurkeySwiss", 14.49);
Insert into foods values(522, "SixChickCaesarWrap", 8.59);
Insert into foods values(523, "SixArtichokeRedPepSub", 8.59);
Insert into foods values(524, "SixinSigItalianSub", 9.29);
Insert into foods values(525, "proteinBerryWorkoutPea", 8.99);
Insert into foods values(526, "proteinBerryWorkoutWhey", 8.99);

/*Populating the payment_types table*/
Insert into payment_types values(1, "HawkCash");
Insert into payment_types values(2, "DiningDollars");
Insert into payment_types values(3, "MealExchange");
Insert into payment_types values(4, "CreditorDebit");

/* Populating the restaurants table*/
Insert into restaurants values(100, "AuntieAnnes");
Insert into restaurants values(200, "BurgerAndFries");
Insert into restaurants values(300, "HawkWrap");
Insert into restaurants values(400, "JambaJuice");
Insert into restaurants values(500, "TheSpread");

/* Populating the serve table*/
Insert into serve values(100, 101);
Insert into serve values(100, 102);
Insert into serve values(100, 103);
Insert into serve values(100, 104);
Insert into serve values(100, 105);
Insert into serve values(100, 106);
Insert into serve values(100, 107);
Insert into serve values(100, 108);
Insert into serve values(100, 109);
Insert into serve values(100, 110);
Insert into serve values(100, 111);
Insert into serve values(100, 112);
Insert into serve values(100, 113);
Insert into serve values(100, 114);
Insert into serve values(100, 115);
Insert into serve values(100, 116);
Insert into serve values(100, 117);

Insert into serve values(200, 201);
Insert into serve values(200, 202);
Insert into serve values(200, 203);
Insert into serve values(200, 204);
Insert into serve values(200, 205);
Insert into serve values(200, 206);
Insert into serve values(200, 207);
Insert into serve values(200, 208);
Insert into serve values(200, 209);
Insert into serve values(200, 210);
Insert into serve values(200, 211);
Insert into serve values(200, 212);
Insert into serve values(200, 213);
Insert into serve values(200, 214);
Insert into serve values(200, 215);
Insert into serve values(200, 216);
Insert into serve values(200, 217);
Insert into serve values(200, 218);
Insert into serve values(200, 219);
Insert into serve values(200, 220);
Insert into serve values(200, 221);
Insert into serve values(200, 222);
Insert into serve values(200, 223);
Insert into serve values(200, 224);
Insert into serve values(200, 225);
Insert into serve values(200, 226);
Insert into serve values(200, 227);
Insert into serve values(200, 228);
Insert into serve values(200, 229);
Insert into serve values(200, 230);
Insert into serve values(200, 231);
Insert into serve values(200, 232);
Insert into serve values(200, 233);

Insert into serve values(300, 301);
Insert into serve values(300, 302);
Insert into serve values(300, 303);
Insert into serve values(300, 304);
Insert into serve values(300, 305);
Insert into serve values(300, 306);
Insert into serve values(300, 307);
Insert into serve values(300, 308);
Insert into serve values(300, 309);
Insert into serve values(300, 310);
Insert into serve values(300, 311);

Insert into serve values(400, 401);
Insert into serve values(400, 402);
Insert into serve values(400, 403);
Insert into serve values(400, 404);
Insert into serve values(400, 405);
Insert into serve values(400, 406);
Insert into serve values(400, 407);
Insert into serve values(400, 408);
Insert into serve values(400, 409);
Insert into serve values(400, 410);
Insert into serve values(400, 411);
Insert into serve values(400, 412);
Insert into serve values(400, 413);
Insert into serve values(400, 414);
Insert into serve values(400, 415);
Insert into serve values(400, 416);
Insert into serve values(400, 417);
Insert into serve values(400, 418);
Insert into serve values(400, 419);
Insert into serve values(400, 420);
Insert into serve values(400, 421);
Insert into serve values(400, 422);
Insert into serve values(400, 423);
Insert into serve values(400, 424);
Insert into serve values(400, 425);
Insert into serve values(400, 426);
Insert into serve values(400, 427);
Insert into serve values(400, 428);
Insert into serve values(400, 429);
Insert into serve values(400, 430);

Insert into serve values(500, 501);
Insert into serve values(500, 502);
Insert into serve values(500, 503);
Insert into serve values(500, 504);
Insert into serve values(500, 505);
Insert into serve values(500, 506);
Insert into serve values(500, 507);
Insert into serve values(500, 508);
Insert into serve values(500, 509);
Insert into serve values(500, 510);
Insert into serve values(500, 511);
Insert into serve values(500, 512);
Insert into serve values(500, 513);
Insert into serve values(500, 514);
Insert into serve values(500, 515);
Insert into serve values(500, 516);
Insert into serve values(500, 517);
Insert into serve values(500, 518);
Insert into serve values(500, 519);
Insert into serve values(500, 520);
Insert into serve values(500, 521);
Insert into serve values(500, 522);
Insert into serve values(500, 523);
Insert into serve values(500, 524);
Insert into serve values(500, 525);
Insert into serve values(500, 526);

/*
populating the hawk wraps table
*/
INSERT INTO hawk_wraps (food_id, food_name, price, main_dish, toppings, side_dish, drink, sauce)
VALUES
    (1, 'Classic', 6.85, true, false, false, false, false),
    (2, 'Double Classic', 8.85, true, false, false, false, false),
    (3, 'Spicy', 6.85, true, false, false, false, false),
    (4, 'Double Spicy', 8.85, true, false, false, false, false),
    (5, 'Grilled Chicken', 6.85, true, false, false, false, false),
    (6, 'Buffalo Chicken', 6.85, true, false, false, false, false),
    (7, 'Chicken Caesar', 6.85, true, false, false, false, false),
    (8, 'Vegan', 6.85, true, false, false, false, false),
    (9, 'Regular Fries', 2.35, false, false, true, false, false),
    (10, 'Hawk Fries', 6.85, false, false, true, false, false),
    (11, 'Hawk Salad', 8.65, false, false, true, false, false),
    (12, 'American Cheese', null, false, true, false, false, false),
    (13, 'Lettuce', null, false, true, false, fals, falsee),
    (14, 'Onion', null, false, true, false, false, false),
    (15, 'Pickles', null, false, true, false, false, false),
    (16, 'Shredded Cheese', null, false, true, false, false, false),
    (17, 'Tomato', null, false, true, false, false, false),
    (18, 'Hawk Sauce', null, false, false, false, false, true),
    (19, 'Buffalo Sauce', null, false, false, false, false, true),
    (20, 'Ranch', null, false, false, false, false, true),
    (21, 'Caesar', null, false, false, false, false, true),
    (22, 'BBQ Sauce', null, false, false, false, false, true);

/*
populating the jamba juice table
*/
INSERT INTO jamba_juice (food_id, food_name, price, smoothie, bowl, description, bowl_boost)
VALUES
    (1, 'Bold N Cold Brew', 7.39, true, false, 'Cold Brew, Ice, Agave, Caffeine', false),
    (2, 'Caribbean Passion', 7.89, true, false, 'Pear, White Grape, Mango, Orange Sherbert, Strawberries, Peaches, Orange Passion Juice Blend', false),
    (3, 'Gotcha Matcha', 7.39, true, false, 'Matcha, Green Tea, Ice, Agave, Caffeine', false),
    (4, 'Orange Dream Machine', 7.89, true, false, 'Orange Juice, Orange Sherbert, Vanilla, Soy Milk, Fat-Free Vanilla Frozen Yogurt', false),
    (5, 'Razzmatazz', 7.89, true, false, 'Grape, Pear & Berry Juice Blend, Orange Sherbert, Strawberries, Bananas', false),
    (6, 'Aloha Pineapple', 7.89, true, false, 'Pineapple Juice, Pineapple Sherbert, Strawberries, Bananas, Non-Fat Greek Yogurt', false),
    (7, 'Orange C Booster', 8.99, true, false, 'Orange Juice, Orange Sherbert, Peaches, Bananas, Daily Vitamin & Zinc Boost', false),
    (8, 'Greens N Ginger', 8.69, true, false, 'Lemonade, Kale, Peaches, Mango, Ginger', false),
    (9, 'PB Chocolate Love', 7.89, true, false, 'Milk, Bananas, Chocolate, Peanut Butter, Moo Dairy Base', false),
    (10, 'Strawberry Surf Rider', 7.89, true, false, 'Lemonade, Lime, Sherbert, Strawberries, Peaches', false);
    /*NEEDS TO BE FINISHED*/
