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

CREATE TABLE foods (
    food_id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2)
);

Create Table food_options (
	food_id INT,
    option_number int,
    name VARCHAR(100),
    foreign key(food_id) references foods(food_id)
);

Create Table payment_types (
	payment_id INT PRIMARY KEY,
    type VARCHAR(50)
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	user_id INT,
    payment_id INT,
    order_date DATE,
    completed VARCHAR(10),
    foreign key(user_id) references users(user_id),
    foreign key(payment_id) references payment_types(payment_id)
);

Create Table contain (
	order_id INT,
    food_id INT,
    foreign key(order_id) references orders(order_id),
    foreign key(food_id) references foods(food_id)
);

Create Table resturants (
	resturant_id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(200)
);

Create Table serve (
	resturant_id INT,
    food_id INT,
    foreign key(resturant_id) references resturants(resturant_id),
    foreign key(food_id) references foods(food_id)
);

Create Table cards (
	card_number INT PRIMARY KEY,
    name VARCHAR(50),
    expiration_date DATE,
    cvv INT,
    zip_code INT
);

Create Table have (
	user_id INT,
    card_number INT,
    foreign key(user_id) references users(user_id),
    foreign key(card_number) references cards(card_number)
);