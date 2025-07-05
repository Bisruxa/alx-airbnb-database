
SELECT b.user_id, COUNT(*) AS total_bookings
FROM booking b
GROUP BY b.user_id;

SELECT property_id, COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS property_rank
FROM booking
GROUP BY property_id;