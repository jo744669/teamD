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