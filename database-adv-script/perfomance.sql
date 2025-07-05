-- Initial query: Retrieve all bookings with user, property, and payment details
SELECT b.*, u.*, p.*, pay.*
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id;

-- Analyze performance using EXPLAIN
EXPLAIN SELECT b.*, u.*, p.*, pay.*
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id;

-- Refactored query (example: only select necessary columns, use indexes)
SELECT b.booking_id, b.booking_date, u.user_id, u.name, p.property_id, p.name AS property_name, pay.amount, pay.payment_date
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id;

-- Analyze performance of refactored query
EXPLAIN SELECT b.booking_id, b.booking_date, u.user_id, u.name, p.property_id, p.name AS property_name, pay.amount, pay.payment_date
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id;
