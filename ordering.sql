CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100), 
    first_name VARCHAR(100), 
    last_name VARCHAR(100), 
    password  VARCHAR(100)
);

CREATE TABLE wallet (
    load_id INT PRIMARY KEY,
    load_amt INT,
    balance INT, 
    points INT
);
CREATE TABLE have (
    user_id INT, 
    load_id INT,
    date DATE, 
    foreign key(user_id) references users(user_id),
    foreign key(load_id) references wallet(load_id)
);
CREATE TABLE food (
    food_id INT PRIMARY KEY,
    diet VARCHAR(50),
    name VARCHAR(50), 
    calories VARCHAR(50), 
    price DECIMAL(10,2)
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	user_id INT ,
    food_id INT,
    order_date DATE,
    foreign key(user_id) references users(user_id),
    foreign key(food_id) references food(food_id)
);

CREATE TABLE menu (
	menu_id INT PRIMARY KEY, 
    station INT
);

CREATE TABLE on (
	food_id INT, 
    menu_id INT,
    add_date DATE,
	foreign key(food_id) references food(food_id),
    foreign key(menu_id) references menu(menu_id)
);


