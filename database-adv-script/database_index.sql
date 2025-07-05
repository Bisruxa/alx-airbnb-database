-- Indexes for high-usage columns in User, Booking, and Property tables
-- User table: commonly used columns (example: user_id, email)
CREATE INDEX idx_user_user_id ON users(user_id);
CREATE INDEX idx_user_email ON users(email);

-- Booking table: commonly used columns (example: booking_id, user_id, property_id, booking_date)
CREATE INDEX idx_booking_booking_id ON booking(booking_id);
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_booking_date ON booking(booking_date);

-- Property table: commonly used columns (example: property_id, location, price)
CREATE INDEX idx_property_property_id ON properties(property_id);
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_price ON properties(price);

-- Example: Measure query performance before and after adding indexes
-- Before adding indexes:
-- EXPLAIN SELECT * FROM booking WHERE user_id = 5;
-- After adding indexes:
-- EXPLAIN SELECT * FROM booking WHERE user_id = 5;
