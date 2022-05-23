/* 2NF */

CREATE TABLE employees (
    id serial PRIMARY KEY,
    name varchar(64) REFERENCES positions,
    position varchar(64)
);

INSERT INTO employees(name, position, car_aviability) VALUES
('John', 'HR'),
('Jane', 'sales'),
('Jack', 'developer'),
('Andrew', 'driver');

CREATE TABLE positions (
    name varchar(64) PRIMARY KEY,
    car_aviability boolean
);

INSERT INTO positions VALUES 
('HR', false), ('developer', false), ('driver', true);


-----
/* 3NF */

CREATE TABLE employees (
    id, 
    name,
    department REFERENCES departments
    );

CREATE TABLE departments (
    name PRIMARY KEY,
    phone
);

INSERT INTO employees VALUES 
('John Doe', 'HR'),
('Jane Snow', 'sales'),
('Jack Smith', 'HR');

INSERT INTO departments VALUES 
('HR', '555-7132'),
('sales', '4576798');


/*  BCNF */

/*  
teachers,
students,
subjects

1 преподаватель ведет 1 предмет

teacher n:1 subjects
students m:n subjects

*/

CREATE TABLE students 
(id serial PRIMARY KEY);

CREATE TABLE teachers 
(id serial PRIMARY KEY,
subject varchar(32) REFERENCES subjects
);

CREATE TABLE subjects 
(
    name varchar(32) PRIMARY KEY
);

CREATE TABLE student_to_teachers ( 
student_id int REFERENCES students,
teacher_id int REFERENCES techers,
PRIMARY KEY (teacher_id, student_id)
);

INSERT INTO student_to_subjects_to_teachers VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 2);

/*   4NF */


/* 
restaurants,
delivery_services

*/

CREATE TABLE restaurants (
    id serial PRIMARY KEY
);

CREATE TABLE delivery_services (
id serial PRIMARY KEY
);

CREATE TABLE pizzas (
    name varchar(64) PRIMARY KEY
);

CREATE TABLE pizza_to_restaurant(
    pizza_name varchar(64) REFERENCES pizzas,
    restaurant_id int REFERENCES restaurants
);

INSERT INTO pizza_to_restaurant VALUES
(1,'pepperoni'),
(1, 'margarita'),
(1, '4chease'),
(1, 'sea'),
(1, 'hawaii'),
(1, 'cesare'),
(1, 'romeo'),

(2, 'pepperoni'),
(2, 'margarita'),
(2, '4chease'),
(2, 'sea'),
(2, 'homemade'),
(2, 'romeo');

/*
A -> B,
A -> C,
B и C
 */
CREATE TABLE restaurants_to_deliveries (
    restaurant_id int REFERENCES restaurants,
    delivery_id int REFERENCES delivery_services,
    PRIMARY KEY (restaurant_id, delivery_id)
);

INSERT INTO restaurants_to_deliveries VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3);