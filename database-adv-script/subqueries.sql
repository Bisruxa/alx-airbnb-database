SELECT *
FROM properties
WHERE property_id IN (
  SELECT property_id
  FROM reviews
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);

-- Correlated subquery: Find users who have made more than 3 bookings
SELECT *
FROM users u
WHERE (
  SELECT COUNT(*)
  FROM booking b
  WHERE b.user_id = u.users_id
) > 3;