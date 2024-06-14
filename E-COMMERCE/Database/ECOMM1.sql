CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    username VARCHAR(256) UNIQUE,
    password VARCHAR(20),
    role VARCHAR(20)
);
INSERT INTO users(name, username,password,role)
VALUES ("", "shanu@gmail.com","test123","ADMIN");

SELECT * FROM users;

CREATE TABLE item_category(
	category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(30) UNIQUE
);
CREATE TABLE item(
	item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(30) NOT NULL ,
    item_category VARCHAR(30),
    item_brand VARCHAR(30),
    item_quantity INT NOT NULL,
    item_price DECIMAL(10,2) NOT NULL,
    item_description VARCHAR(256),
    item_image LONGBLOB NOT NULL
);

CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    item_information VARCHAR(256),
    order_amount DECIMAL(10,2),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
