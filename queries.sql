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
