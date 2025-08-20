USE transport_db;

-- Routes Table
CREATE TABLE Routes (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    route_name VARCHAR(100),
    start_point VARCHAR(100),
    end_point VARCHAR(100),
    distance_km DECIMAL(6,2)
);

-- Stations Table
CREATE TABLE Stations (
    station_id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(100),
    location VARCHAR(100)
);

-- RouteStations (Many-to-Many)
CREATE TABLE RouteStations (
    route_id INT,
    station_id INT,
    stop_order INT,
    PRIMARY KEY(route_id, station_id),
    FOREIGN KEY(route_id) REFERENCES Routes(route_id),
    FOREIGN KEY(station_id) REFERENCES Stations(station_id)
);

-- Vehicles Table
CREATE TABLE Vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_type ENUM('Bus','Metro','Tram'),
    capacity INT,
    route_id INT,
    FOREIGN KEY(route_id) REFERENCES Routes(route_id)
);

-- Drivers Table
CREATE TABLE Drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    license_number VARCHAR(50) UNIQUE,
    assigned_vehicle_id INT,
    FOREIGN KEY(assigned_vehicle_id) REFERENCES Vehicles(vehicle_id)
);

-- Schedules Table
CREATE TABLE Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    route_id INT,
    vehicle_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    FOREIGN KEY(route_id) REFERENCES Routes(route_id),
    FOREIGN KEY(vehicle_id) REFERENCES Vehicles(vehicle_id)
);

-- Passengers Table
CREATE TABLE Passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Tickets Table
CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    schedule_id INT,
    fare DECIMAL(8,2),
    purchase_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_status ENUM('Paid','Cancelled','Refunded'),
    FOREIGN KEY(passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY(schedule_id) REFERENCES Schedules(schedule_id)
);


SELECT r.route_name, COUNT(t.ticket_id) AS total_tickets
FROM Tickets t
JOIN Schedules s ON t.schedule_id = s.schedule_id
JOIN Routes r ON s.route_id = r.route_id
WHERE t.payment_status = 'Paid'
GROUP BY r.route_name
ORDER BY total_tickets DESC;

SELECT r.route_name, SUM(t.fare) AS total_revenue
FROM Tickets t
JOIN Schedules s ON t.schedule_id = s.schedule_id
JOIN Routes r ON s.route_id = r.route_id
WHERE t.payment_status = 'Paid'
GROUP BY r.route_name;

SELECT p.name, COUNT(t.ticket_id) AS trips
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
WHERE t.payment_status = 'Paid'
GROUP BY p.name
HAVING trips > 1;

SELECT v.vehicle_id, v.capacity,
       COUNT(t.ticket_id) AS booked_seats,
       ROUND((COUNT(t.ticket_id)/v.capacity)*100,2) AS occupancy_rate
FROM Vehicles v
JOIN Schedules s ON v.vehicle_id = s.vehicle_id
LEFT JOIN Tickets t ON s.schedule_id = t.schedule_id AND t.payment_status = 'Paid'
GROUP BY v.vehicle_id, v.capacity;
