/*CREATING THE TABLES*/

/*
Users : holds all users based on their user_id including remaining balances for the various payment methods
Will be populated from the front end when a profile is created
*/
CREATE TABLE users (
    email VARCHAR(100) PRIMARY KEY,
    password VARCHAR(100)
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
orders: holds previous orders by user to be sorted by date
*/
CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	email VARCHAR(100) unique,
    order_date DATE,
    UNIQUE(order_id),
    foreign key(email) references users(email)
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
    name VARCHAR(50)
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
	email VARCHAR(100),
	card_number INT,
    expiration_date DATE,
    cvv INT,
    UNIQUE(card_number),
    foreign key(email) references users(email)
);

/*
hawk_wraps : holds all of the data for the hawk wraps location
*/
Create Table hawk_wraps (
    foreign key(restaurant_id) references restaurants(restaurant_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    main_dish BOOLEAN,
    toppings BOOLEAN,
    side_dish BOOLEAN,
    drink BOOLEAN,
    sauce BOOLEAN
);

/*
jamba_juice : holds all of the data for the jamba juice location
*/
Create Table jamba_juice (
    foreign key(restaurant_id) references restaurants(restaurant_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    smoothie BOOLEAN,
    bowl BOOLEAN,
    description VARCHAR(300),
    bowl_boost BOOLEAN
);

/*
burgers_and_fries : holds all of the data for the burgers and fries location
*/
Create Table burgers_and_fries (
    foreign key(restaurant_id) references restaurants(restaurant_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    main_dish_single BOOLEAN,
    main_dish_combo BOOLEAN,
    side_dish BOOLEAN,
    drink BOOLEAN
);

/*
the_spread : holds all of the data for the spread location
*/
Create Table the_spread (
    foreign key(restaurant_id) references restaurants(restaurant_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    main_dish BOOLEAN,
    side_dish BOOLEAN,
    drink BOOLEAN
);

/*
auntie_annes : holds all of the data for auntie annes location
*/
Create Table auntie_annes (
    foreign key(restaurant_id) references restaurants(restaurant_id),
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    price DECIMAL(10,2),
    main_dish BOOLEAN,
    sauce BOOLEAN,
    drink BOOLEAN
);

/*POPULATING THE TABLES*/

/* Populating the foods table*/

Insert into foods values(1, "Medium Fountain Drink", 2.99);
Insert into foods values(2, "Large Fountain Drink", 3.29);

Insert into foods values(101, "Prezel", 4.29);
Insert into foods values(102, "Original Prezel Dogs", 4.99);
Insert into foods values(103, "Mini Dogs", 6.59);
Insert into foods values(104, "Nuggets Cup - Original", 5.79);
Insert into foods values(105, "Nuggets Cup - Cinnamon Sugar", 5.89);
Insert into foods values(106, "Nuggets Cup - Pepperoni", 6.59);
Insert into foods values(107, "Nuggets Bucket - Original", 26.99);
Insert into foods values(108, "Nuggets Bucket - Cinnamon", 27.99);
Insert into foods values(109, "Nuggets Bucket - Pepperoni", 32.99);
Insert into foods values(110, "Caramel", 1.19);
Insert into foods values(111, "Cheese", 1.19);
Insert into foods values(112, "Cream Cheese", 1.19);
Insert into foods values(113, "HoneyMustard", 1.19);
Insert into foods values(114, "Hot Salsa Cheese", 1.19);
Insert into foods values(115, "Marinara", 1.19);
insert into foods values(116, "Original Lemonade", 3.99);
insert into foods values(117, "Lemonade Mixer", 4.39);

Insert into foods values(201, "Nash Spicy Chicken", 5.29);
Insert into foods values(202, "Grilled Chicken and Bacon", 7.09);
Insert into foods values(203, "Crispy Fish Sandwich", 6.99);
Insert into foods values(204, "Kosher Beef Hot Dog", 4.29);
Insert into foods values(205, "Burger with Cheese", 5.99);
Insert into foods values(206, "Burger with Bacon and Cheese", 6.49);
Insert into foods values(207, "Burger with Avacado and PepperJack", 6.49);
Insert into foods values(208, "Double Burger with Cheese", 6.49);
Insert into foods values(209, "Chipotle Black Bean and Cheese", 7.09);
Insert into foods values(210, "CYO Sandwich", 5.89);
Insert into foods values(211, "Grilled Cheese", 5.99);
Insert into foods values(212, "Beyond and Cheese Burger", 9.49);
Insert into foods values(213, "Patty Melt", 6.49);
Insert into foods values(214, "Philly Cheesesteak", 7.29);
Insert into foods values(215, "Chicken Tender Sandwich", 5.29);
Insert into foods values(216, "Crispy Chicken Strips (3)", 4.59);
Insert into foods values(217, "Crispy Chicken Strips (5)", 7.29);

Insert into foods values(218, "Grilled Chicken And Bacon Combo", 10.19);
Insert into foods values(219, "Tender Sandwich Combo", 8.29);
Insert into foods values(220, "Chipotle Black Bean and Cheese Combo", 10.59);
Insert into foods values(221, "Burger with Bacon and Cheese Combo", 10.09);
Insert into foods values(222, "Burger with Avacado and Pepper Jack Combo", 10.09);
Insert into foods values(223, "Burger with Cheese Combo", 9.29);
Insert into foods values(224, "Chicken Cheesesteak Combo", 7.29);
Insert into foods values(225, "Double Burger with Cheese Combo", 12.09);
Insert into foods values(226, "CYO Sandwich Combo", 8.89);
Insert into foods values(227, "Beyond and Cheese Burger Combo", 12.79);
Insert into foods values(228, "Crispy Chicken Strips (3) Combo", 4.59);
Insert into foods values(229, "Crispy Chicken Strips (3) Combo", 7.29);

Insert into foods values(230, "Motzarella Sticks", 6.09);
Insert into foods values(231, "Classic Fries", 3.19);
Insert into foods values(232, "Sweet Potato Fries", 3.49);
Insert into foods values(233, "Ranch Fries", 2.69);


Insert into foods values(301, "Classic", 6.85);
Insert into foods values(302, "Double Classic", 8.85);
Insert into foods values(303, "Spicy", 6.85);
Insert into foods values(304, "Double Spicy", 8.85);
Insert into foods values(305, "Grilled Chicken", 6.85);
Insert into foods values(306, "Buffalo Chicken", 6.85);
Insert into foods values(307, "Chicken Caesar", 6.85);
Insert into foods values(308, "Vegan", 6.85);

Insert into foods values(309, "Regular Fries", 2.35);
Insert into foods values(310, "Hawk Fires", 6.85);
Insert into foods values(311, "Hawk Salad", 8.65);

Insert into foods values(401, "Bold N Cold Brew", 7.39);
Insert into foods values(402, "Caribbean Passion", 7.89);
Insert into foods values(403, "Gotcha Matcha", 7.39);
Insert into foods values(404, "Orange Dream Machine", 7.89);
Insert into foods values(405, "Razzmatazz", 7.89);
Insert into foods values(406, "Aloha Pineapple", 7.89);
Insert into foods values(407, "Orange Booster", 8.99);
Insert into foods values(408, "Greens N Ginger", 8.69);
Insert into foods values(409, "PB Chocolate Love", 7.89);
Insert into foods values(410, "Strawberry Surf Rider", 7.89);
Insert into foods values(411, "Matcha Green Tea Blast", 8.99);
Insert into foods values(412, "Mega Mango", 8.69);
Insert into foods values(413, "Apple N Greens", 8.69);
Insert into foods values(414, "PB Banana Protein Soy", 8.99);
Insert into foods values(415, "Acai Super Anioxidant", 8.99);
Insert into foods values(416, "Mango-A-Go-Go", 7.89);
Insert into foods values(417, "Pomegrantate Paradise", 8.69);
Insert into foods values(418, "Strawberries Wild", 7.89);
Insert into foods values(419, "Peach Perfection", 8.69);
Insert into foods values(420, "White Gummi", 7.89);
Insert into foods values(421, "Vanilla Blue Sky", 8.69);
Insert into foods values(422, "Strawbery Whirl", 8.69);
Insert into foods values(423, "Smooth Talkin Mango", 8.99);
Insert into foods values(424, "Peanut Butter Moo", 8.69);
Insert into foods values(425, "Protein Berry Workout Pea", 8.99);
Insert into foods values(426, "Protein Berry Workout Whey", 8.99);

Insert into foods values(427, "Chucky Strawberry Bowl", 8.99);
Insert into foods values(428, "Acai Primo Bowl", 8.99);
Insert into foods values(429, "Vanilla Blue Sky Bowl", 8.99);
Insert into foods values(430, "Dragonfruit Delight Bowl", 8.99);


Insert into foods values(501, "6in Four Cheese", 5.79);
Insert into foods values(502, "6in Ham + American", 7.49);
Insert into foods values(503, "6in Turkey + Swiss", 7.49);
Insert into foods values(504, "6in Turkey + Bacon on Multigrain", 8.59);
Insert into foods values(505, "6in Italian", 7.99);
Insert into foods values(506, "12in Articholke Red Pepper Sub", 16.09);
Insert into foods values(507, "6in Caprese Ciabatta", 8.59);
Insert into foods values(508, "12in Caprese Ciabatta", 16.09);
Insert into foods values(509, "6in Roast Beef + Cheddar", 7.99);
Insert into foods values(510, "12in Buffalo Chicken Sub", 16.09);
Insert into foods values(511, "12in Ham + American", 14.49);
Insert into foods values(512, "6in Tuna Salad", 7.49);
Insert into foods values(513, "12in Chicken Casear Wrap", 16.09);
Insert into foods values(514, "12in Four Cheese", 10.79);
Insert into foods values(515, "12in Signature Italian Sub", 16.79);
Insert into foods values(516, "12in Italian", 14.99);
Insert into foods values(517, "12in Turkey + Bacon on Multigrain", 16.09);
Insert into foods values(518, "6in Buffalo Chicken Sub", 8.59);
Insert into foods values(519, "12in Roast Beef + Cheddar", 14.99);
Insert into foods values(520, "12in Tuna Salad", 14.49);
Insert into foods values(521, "12in Turkey + Swiss", 14.49);
Insert into foods values(522, "6in Chicken Caesar Wrap", 8.59);
Insert into foods values(523, "6in Artichoke Red Pepper Sub", 8.59);
Insert into foods values(524, "6in Signature Italian Sub", 9.29);
Insert into foods values(525, "Signature Chips", 0);
Insert into foods values(526, "Crave Worthy Chocalate Chip Cookie", 0);

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
    (10, 'Strawberry Surf Rider', 7.89, true, false, 'Lemonade, Lime, Sherbert, Strawberries, Peaches', false),
    (11, 'Matcha Green Tea Blast', 8.99, true, false, '"Soymilk, Fat-Free Vanilla Frozen Yogurt, Green Tea Matcha', false),
    (12, 'Mega Mango', 8.69, true, false, 'Pineapple Juice, Orange Juice, Mango, Strawberries', false),
    (13, 'Apple N Greens', 8.69, true, false, 'Apple, Pear, Strawberry Juice Blend, Kale, Mango, Bananas, Peaches', false),
    (14, 'PB Banana Protein Soy', 8.99, true, false, 'Soymilk, Bananas, Peanut Butter, Whey Protein, Honey', false),
    (15, 'Acai Super Antioxidant', 8.99, true, false, 'Soymilk, Acai, Grape Juice Blend, Strawberries, Blueberries, Raspberry Sherbert, Daily Vitamin & Zinc Boost', false),
    (16, 'Mango-A-Go-Go', 7.89, true, false, 'Pear, White, Grape, Mango, Orange, Passion Fruit Juice Blend, Mango Sherbert, Pineapple Sherbert', false),
    (17, 'Pomegranate Paradise', 8.69, true, false, 'Apple, Pear Juice Blend, Pomegranate Juice blend, Mango, Strawberries, Peaches', false),
    (18, 'Strawberries Wild', 7.89, true, false, 'Apple, Pear Juice Blend, Strawberry Juice Blend, Fat-Free Vanilla Frozen Yogurt, Strawberries, Bananas', false),
    (19, 'Peach Perfection', 8.69, true, false, 'White Grape, Pear Juice Blend, Peach Juice Blend, Mango, Peaches, Apple-Strawberry Juice Blend, Strawberries', false),
    (20, 'White Gummi', 7.89, true, false, 'White Grape, Peach Juice Blend, Pear Fruit Juice Blend, Pineapple Sherbert, Vanilla, Soymilk, Orange Sherbert, Raspberry Sherbert, Mangos and Lime Sherbert', false),
    (21, 'Vanilla Blue Sky', 8.69, true, false, 'Unsweetened Almond Milk, Vanilla, Coconut Milk, Bananas, Pineapple, Blue Spirulina Boost', false),
    (22, 'Strawberry Whirl', 8.69, true, false, 'Apple, Pear Juice Blend, Strawberry Juice Blend, Strawberries, Bananas', false),
    (23, 'Smooth Talkin Mango', 8.69, true, false, 'Oatmilk, Mango, Pineapple, Organic Agave', false),
    (24, 'Peanut Butter Moo', 7.89, true, false, 'Fat-Free Vanilla Frozen Yogurt, Vanilla, Soymilk, Milk, Bananas, Peanut Butter, Chocolate, Moo Dairy Base', false),
    (25, 'Protein Berry Workout Pea', 8.99, true, false, 'Vanilla, Soymilk, Pea Protein, Strawberries, Bananas', false),
    (26, 'Protein Berry Workout Whey', 8.99, true, false, 'Vanilla, Soymilk, Whey Protein, Strawberries, Bananas', false),
    (27, 'Chucky Strawberry Bowl', 8.99, false, true, 'No description available', false),
    (28, 'Acai Primo Bowl', 8.99, false, true, 'No description available', false),
    (29, 'Vanilla Blue Sky Bowl', 8.99, false, true, 'No description available', false),
    (30, 'Dragonfruit Delight Bowl', 8.99, false, true, 'No description available', false),
    (31, 'Three G Energy', 0, false, false, 'No description available', true),
    (32, 'Daily Vitamin Zinc', 0, false, false, 'No description available', true),
    (33, 'Soy Protein', 0, false, false, 'No description available', true),
    (34, 'Whey Protein', 0, false, false, 'No description available', true),
    (35, 'Blue Spirulina', 0.75, false, false, 'No description available', true),
    (36, 'Ginger', 0.75, false, false, 'No description available', true),
    (37, 'Kale', 0.75, false, false, 'No description available', true),
    (38, 'Matcha Powder', 0.75, false, false, 'No description available', true),
    (39, 'NonFat Greek Yogurt', 0.75, false, false, 'No description available', true),
    (40, 'Peanut Butter', false, false, 'No description available', true);

/*
populating the burgers and fries table
*/
INSERT INTO burgers_and_fries (food_id, food_name, price, main_dish_single, main_dish_combo, side_dish, drink)
VALUES
    (1, "Nash Spicy Chicken", 5.29, true, false, false, false),
    (2, "Grilled Chicken and Bacon", 7.09, true, false, false, false),
    (3, "Crispy Fish Sandwich", 6.99, true, false, false, false),
    (4, "Kosher Beef Hot Dog", 4.29, true, false, false, false),
    (5, "Burger with Cheese", 5.99, true, false, false, false),
    (6, "Burger with Bacon and Cheese", 6.49, true, false, false, false),
    (7, "Burger with Avocado and Pepper Jack", 6.49, true, false, false, false),
    (8, "Double Burger with Cheese", 6.49, true, false, false, false),
    (9, "Chipotle Black Bean and Cheese", 7.09, true, false, false, false),
    (10, "CYO Sandwich", 5.89, true, false, false, false),
    (11, "Grilled Cheese", 5.99, true, false, false, false),
    (12, "Beyond and Cheese Burger", 9.49, true, false, false, false),
    (13, "Patty Melt", 6.49, true, false, false, false),
    (14, "Philly Cheesesteak", 7.29, true, false, false, false),
    (15, "Chicken Tender Sandwich", 5.29, true, false, false, false),
    (16, "Crispy Chicken Strips (3)", 4.59, true, false, false, false),
    (17, "Crispy Chicken Strips (5)", 7.29, true, false, false, false),
    (18, "Grilled Chicken and Bacon", 10.19, false, true, false, false),
    (19, "Tender Sandwich", 8.29, false, true, false, false),
    (20, "Chipotle Black Bean and Cheese", 10.59, false, true, false, false),
    (21, "Burger with Bacon and Cheese", 10.09, false, true, false, false),
    (22, "Burger with Avocado and Pepper Jack", 10.09, false, true, false, false),
    (23, "Burger with Cheese", 9.29, false, true, false, false),
    (24, "Chicken Cheesesteak", 7.29, false, true, false, false),
    (25, "Double Burger with Cheese", 12.09, false, true, false, false),
    (26, "CYO Sandwich", 8.89, false, true, false, false),
    (27, "Beyond and Cheese Burger", 12.79, false, true, false, false),
    (28, "Crispy Chicken Strips (3)", 4.59, false, true, false, false),
    (29, "Crispy Chicken Strips (5)", 7.29, false, true, false, false),
    (30, "Motzarella Sticks", 6.09, false, false, true, false),
    (31, "Classic Fries", 3.19, false, false, true, false),
    (32, "Sweet Potato Fries", 3.49, false, false, true, false),
    (33, "Ranch Fries", 2.69, false, false, true, false),
    (34, "Medium Fountain Drink", 2.99, false, false, false, true),
    (35, "Large Fountain Drink", 3.29, false, false, false, true);

/*
populating the spread table
*/

INSERT INTO the_spread (food_id, food_name, price, main_dish, side_dish, drink)
VALUES
    (1, "6in Four Cheese", 5.79, true, false, false),
    (2, "6in Ham + American", 7.49, true, false, false),
    (3, "6in Trukey + Swiss", 7.49, true, false, false),
    (4, "6in Turkey + Baco on Multigrain", 8.59, true, false, false),
    (5, "6in Italian", 7.99, true, false, false),
    (6, "12in Artichoke Red Pepper Sub", 16.09, true, false, false),
    (7, "6in Caprese Ciabatta", 8.59, true, false, false),
    (8, "12in Caprese Ciabatta", 16.09, true, false, false),
    (9, "6in Roast Beef + Cheddar", 7.99, true, false, false),
    (10, "12in Buffalo Chicken Sub", 16.09, true, false, false),
    (11, "12in Ham + American", 14.49, true, false, false),
    (12, "6in Tuna Salad", 7.49, true, false, false),
    (13, "12in Chicken Caesar Wrap", 16.09, true, false, false),
    (14, "12in Four Cheese", 10.79, true, false, false),
    (15, "12in Signature Italian Sub", 16.79, true, false, false),
    (16, "12in Italian", 14.99, true, false, false),
    (17, "12in Turkey + Bacon on Multigrain", 16.09, true, false, false),
    (18, "6in Buffalo Chicken Sub", 8.59, true, false, false),
    (19, "12in Roast Beef + Cheddar", 14.99, true, false, false),
    (20, "12in Tuna Salad", 14.49, true, false, false),
    (21, "12in Turkey + Swiss", 14.49, true, false, false),
    (22, "6in Chicken Caesar Wrap", 8.59, true, false, false),
    (23, "6in Artichoke + Red Pepper Sub", 8.59, true, false, false),
    (24, "6in Signature Italian Sub", 9.29, true, false, false),
    (25, "Signature Chips", 0, false, true, false),
    (26, "Crave Worthy Chocolate Chip Cookie", 0, false, true, false),
    (27, "Medium Fountin Drink", 2.99, false, false, true),
    (28, "Large Fountain Drink", 3.29, false, false, true);

/*
populating the auntie annes table
*/
INSERT INTO auntie_annes (food_id, food_name, price, main_dish, sauce, drink)
VALUES
    (1, "Pretzel", 4.29, true, false, false),
    (2, "Original Pretzel Dogs", 4.99, true, false, false),
    (3, "Mini Dogs", 6.59, true, false, false),
    (4, "Nuggest Cup - Original", 5.79, true, false, false),
    (5, "Nuggets Cup - Cinnamon Sugar", 5.89, true, false, false),
    (6, "Nuggets Cup - Pepperoni", 6.59, true, false, false),
    (7, "Nuggets Bucket - Original", 26.99, true, false, false),
    (8, "Nuggets Bucket - Cinnamon Sugar", 27.99, true, false, false),
    (9, "Nuggets Bucket - Pepperoni", 32.99, true, false, false),
    (10, "Caramel", 1.19, false, true, false),
    (11, "Cheese", 1.19, false, true, false),
    (12, "Honey Mustard", 1.19, false, true, false),
    (13, "Hot Salsa Cheese", 1.19, false, true, false),
    (14, "Marinara", 1.19, false, true, false),
    (15, "Medium Fountain Drink", 2.99, false, false, true),
    (16, "Large Fountain Drink", 3.29, false, false, true),
    (17, "Original Lemonade", 3.99, false, false, true),
    (18, "Lemonade Mixer", 4.39, false, false, true);
