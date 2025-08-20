-- Routes (add 2 more)
INSERT INTO Routes (route_name, start_point, end_point, distance_km)
VALUES 
('City Express', 'Central Station', 'Downtown', 12.5),
('Metro Link', 'Airport', 'University', 25.8),
('Airport Shuttle', 'Airport', 'Central Station', 18.0),
('Night Owl', 'Downtown', 'Suburbia', 22.5);

-- Stations (add 4 more)
INSERT INTO Stations (station_name, location)
VALUES 
('Central Station', 'Downtown'), 
('Airport', 'North Side'), 
('University', 'East End'), 
('Downtown', 'City Center'),
('Suburbia', 'South Side'),
('East Park', 'East End'),
('West End', 'West Side'),
('City Hall', 'Downtown');

-- RouteStations (link new routes to stations)
INSERT INTO RouteStations (route_id, station_id, stop_order)
VALUES
(1, 1, 1),
(1, 4, 2),
(2, 2, 1),
(2, 3, 2),
(3, 2, 1),
(3, 1, 2),
(4, 4, 1),
(4, 5, 2);

-- Vehicles (add 2 more)
INSERT INTO Vehicles (vehicle_type, capacity, route_id)
VALUES
('Bus', 40, 1),
('Metro', 200, 2),
('Shuttle Bus', 30, 3),
('Bus', 35, 4);

-- Drivers (add 2 more)
INSERT INTO Drivers (name, license_number, assigned_vehicle_id)
VALUES
('John Doe', 'LIC1234', 1),
('Alice Smith', 'LIC5678', 2),
('Robert King', 'LIC9101', 3),
('Emily Davis', 'LIC1121', 4);

-- Schedules (add 4 more)
INSERT INTO Schedules (route_id, vehicle_id, departure_time, arrival_time)
VALUES
(1, 1, '2025-08-20 08:00:00', '2025-08-20 08:30:00'),
(2, 2, '2025-08-20 09:00:00', '2025-08-20 09:45:00'),
(3, 3, '2025-08-20 07:30:00', '2025-08-20 08:15:00'),
(4, 4, '2025-08-20 22:00:00', '2025-08-20 22:45:00'),
(1, 1, '2025-08-20 10:00:00', '2025-08-20 10:30:00'),
(2, 2, '2025-08-20 12:00:00', '2025-08-20 12:45:00');

-- Passengers (add 4 more)
INSERT INTO Passengers (name, email, phone)
VALUES
('Michael Brown','michael@example.com','1234567890'),
('Sarah Lee','sarah@example.com','0987654321'),
('David Johnson','david@example.com','5551234567'),
('Emma Wilson','emma@example.com','5559876543'),
('Liam Smith','liam@example.com','5554567890'),
('Olivia Martinez','olivia@example.com','5556789012');

-- Tickets (add 6 more)
INSERT INTO Tickets (passenger_id, schedule_id, fare, payment_status)
VALUES
(1, 1, 50.00, 'Paid'),
(2, 2, 100.00, 'Paid'),
(3, 3, 30.00, 'Paid'),
(4, 4, 45.00, 'Paid'),
(5, 5, 50.00, 'Paid'),
(6, 6, 100.00, 'Paid'),
(1, 5, 50.00, 'Paid'),
(2, 6, 100.00, 'Cancelled'),
(3, 1, 50.00, 'Paid'),
(4, 2, 100.00, 'Paid');

-- Additional Routes
INSERT INTO Routes (route_name, start_point, end_point, distance_km)
VALUES
('Green Line', 'East Park', 'West End', 15.2),
('Red Express', 'City Hall', 'University', 20.0);

-- Additional Stations
INSERT INTO Stations (station_name, location)
VALUES
('North Square', 'North Side'),
('South Terminal', 'South Side');

-- Additional RouteStations
INSERT INTO RouteStations (route_id, station_id, stop_order)
VALUES
(5, 6, 1), -- Green Line: East Park
(5, 7, 2), -- Green Line: West End
(6, 8, 1), -- Red Express: City Hall
(6, 3, 2), -- Red Express: University
(6, 2, 3); -- Red Express: Airport

-- Additional Vehicles
INSERT INTO Vehicles (vehicle_type, capacity, route_id)
VALUES
('Bus', 45, 5),
('Metro', 150, 6);

-- Additional Drivers
INSERT INTO Drivers (name, license_number, assigned_vehicle_id)
VALUES
('Sophia Turner', 'LIC3141', 5),
('Ethan Harris', 'LIC2718', 6);

-- Additional Schedules
INSERT INTO Schedules (route_id, vehicle_id, departure_time, arrival_time)
VALUES
(5, 5, '2025-08-20 06:30:00', '2025-08-20 07:15:00'),
(5, 5, '2025-08-20 14:00:00', '2025-08-20 14:45:00'),
(6, 6, '2025-08-20 11:00:00', '2025-08-20 11:45:00'),
(6, 6, '2025-08-20 18:00:00', '2025-08-20 18:45:00');

-- Additional Passengers
INSERT INTO Passengers (name, email, phone)
VALUES
('Noah King','noah@example.com','5551112233'),
('Ava Scott','ava@example.com','5552223344'),
('Mason Lee','mason@example.com','5553334455'),
('Isabella Clark','isabella@example.com','5554445566'),
('Lucas Wright','lucas@example.com','5555556677'),
('Mia Adams','mia@example.com','5556667788'),
('Evelyn Baker','evelyn@example.com','5557778899');

-- Additional Tickets
INSERT INTO Tickets (passenger_id, schedule_id, fare, payment_status)
VALUES
(7, 7, 40.00, 'Paid'),
(8, 8, 40.00, 'Paid'),
(9, 9, 60.00, 'Paid'),
(10, 10, 60.00, 'Refunded'),
(11, 7, 40.00, 'Paid'),
(12, 8, 40.00, 'Paid'),
(13, 9, 60.00, 'Cancelled'),
(1, 10, 50.00, 'Paid'),
(2, 7, 45.00, 'Paid'),
(3, 8, 30.00, 'Paid'),
(4, 9, 55.00, 'Paid'),
(5, 10, 50.00, 'Paid');

INSERT INTO RouteStations (route_id, station_id, stop_order)
VALUES
(3, 2, 1),
(3, 1, 2),
(4, 4, 1),
(4, 5, 2);

INSERT INTO Vehicles (vehicle_type, capacity, route_id)
VALUES
('Bus', 45, 5),
('Metro', 150, 6);

INSERT INTO Drivers (name, license_number, assigned_vehicle_id)
VALUES
('Sophia Turner', 'LIC3141', 5),
('Ethan Harris', 'LIC2718', 6);

INSERT INTO Drivers (name, license_number, assigned_vehicle_id)
VALUES
('Robert King', 'LIC9101', 3),
('Emily Davis', 'LIC1121', 4);

INSERT INTO Passengers (name, email, phone)
VALUES
('David Johnson','david@example.com','5551234567'),
('Emma Wilson','emma@example.com','5559876543'),
('Liam Smith','liam@example.com','5554567890'),
('Olivia Martinez','olivia@example.com','5556789012');

INSERT INTO Tickets (passenger_id, schedule_id, fare, payment_status)
VALUES
(3, 3, 30.00, 'Paid'),
(4, 4, 45.00, 'Paid'),
(5, 5, 50.00, 'Paid'),
(6, 6, 100.00, 'Paid'),
(1, 5, 50.00, 'Paid'),
(2, 6, 100.00, 'Cancelled'),
(3, 1, 50.00, 'Paid'),
(4, 2, 100.00, 'Paid');

INSERT INTO Schedules (route_id, vehicle_id, departure_time, arrival_time)
VALUES
(3, 3, '2025-08-20 07:30:00', '2025-08-20 08:15:00'),
(4, 4, '2025-08-20 22:00:00', '2025-08-20 22:45:00'),
(1, 1, '2025-08-20 10:00:00', '2025-08-20 10:30:00'),
(2, 2, '2025-08-20 12:00:00', '2025-08-20 12:45:00');

