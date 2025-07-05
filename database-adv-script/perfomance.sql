
-- Initial query: Retrieve all bookings with user, property, and payment details for a specific user and date range
SELECT b.*, u.*, p.*, pay.*
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.user_id = 1 AND b.booking_date BETWEEN '2024-01-01' AND '2024-12-31';

EXPLAIN SELECT b.*, u.*, p.*, pay.*
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.user_id = 1 AND b.booking_date BETWEEN '2024-01-01' AND '2024-12-31';

SELECT b.booking_id, b.booking_date, u.user_id, u.name, p.property_id, p.name AS property_name, pay.amount, pay.payment_date
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.user_id = 1 AND b.booking_date BETWEEN '2024-01-01' AND '2024-12-31';

EXPLAIN SELECT b.booking_id, b.booking_date, u.user_id, u.name, p.property_id, p.name AS property_name, pay.amount, pay.payment_date
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.user_id = 1 AND b.booking_date BETWEEN '2024-01-01' AND '2024-12-31';
