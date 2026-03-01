CREATE DATABASE HotelManagement;
USE HotelManagement;
-- Customer Table 
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(50)
);
-- Rooms Table 
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(20),
    price_per_night INT,
    status VARCHAR(20) -- Available / Booked
);


-- Bookings Table 
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);


INSERT INTO Customers VALUES
(1,'Amit Sharma','9876543210','Delhi'),
(2,'Priya Singh','8765432109','Mumbai'),
(3,'Rahul Verma','7654321098','Pune'),
(4,'Sneha Kapoor','6543210987','Delhi'),
(5,'Vikas Gupta','5432109876','Jaipur'),
(6,'Neha Mehta','4321098765','Chandigarh'),
(7,'Rohit Jain','3210987654','Lucknow'),
(8,'Pooja Arora','2109876543','Amritsar'),
(9,'Karan Malhotra','9988776655','Delhi'),
(10,'Simran Kaur','8877665544','Patiala');


INSERT INTO Rooms VALUES
(101,'Single',1500,'Available'),
(102,'Double',2500,'Booked'),
(103,'Suite',5000,'Available'),
(104,'Single',1500,'Booked'),
(105,'Double',2500,'Available');


INSERT INTO Bookings VALUES
(1,1,102,'2026-02-01','2026-02-03'),
(2,2,104,'2026-02-05','2026-02-07'),
(3,3,101,'2026-02-10','2026-02-12'),
(4,4,103,'2026-02-15','2026-02-18'),
(5,5,105,'2026-02-20','2026-02-22');


SELECT * FROM Customers;

SELECT * FROM Rooms
WHERE status = 'Available';

-- Show booking details with customer name
SELECT b.booking_id, c.name, r.room_type, b.check_in, b.check_out
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Rooms r ON b.room_id = r.room_id;


SELECT COUNT(*) AS total_bookings FROM Bookings;


SELECT * FROM Rooms
ORDER BY price_per_night DESC
LIMIT 1;









