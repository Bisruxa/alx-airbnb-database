-- USERS
INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('Elkan', 'Alemayehu', 'elkan@example.com', 'hashed_pwd_1', '0911223344', 'guest'),
  ('Bisrat', 'Tesfaye', 'bisrat@example.com', 'hashed_pwd_2', '0911334455', 'host'),
  ('Sara', 'Mulu', 'sara@example.com', 'hashed_pwd_3', '0911445566', 'admin');

-- PROPERTIES
INSERT INTO properties (host_id, name, description, location, pricepernight)
VALUES
  (2, 'Cozy Villa', 'A peaceful villa near the lake.', 'Addis Ababa', 120.00),
  (2, 'Modern Loft', 'Modern apartment in downtown.', 'Bahir Dar', 85.50);

-- BOOKINGS
INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (1, 1, '2025-07-01', '2025-07-03', 240.00, 'confirmed'),
  (2, 1, '2025-08-10', '2025-08-12', 171.00, 'pending');

-- PAYMENTS
INSERT INTO payments (booking_id, amount, payment_date, payment_method)
VALUES
  (1, 240.00, '2025-06-15', 'credit_card');

-- REVIEWS
INSERT INTO reviews (property_id, user_id, rating, comment)
VALUES
  (1, 1, 5, 'Amazing experience! Very peaceful and clean.'),
  (2, 1, 4, 'Nice and convenient location.');

-- MESSAGES
INSERT INTO messages (sender_id, recipient_id, message_body)
VALUES
  (1, 2, 'Hello, I have a question about the property.'),
  (2, 1, 'Sure! Feel free to ask.');
