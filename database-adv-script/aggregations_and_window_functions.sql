Total number of bookings made by every user
SELECT u.user_id, u.first_name, u.last_name COUNT (b.booking_id) AS total_bookings
FROM User LEFT JOIN Booking ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name ORDER BY total_bookings DESC;

Rank properties by total number
SELECT property_id, total_bookings, RANK() OVER (ORDER BY total_bookings DESC) AS property_rank
FROM (SELECT p.property_id, COUNT(b.booking_id) AS total_bookings FROM Property LEFT JOIN Booking ON p.property_id GROUP BY p.property_id) AS booking_counts;
