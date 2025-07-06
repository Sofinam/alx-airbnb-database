INNER JOIN
SELECT * b.booking_id, b.start_date, b.end_date, b.total_price, b.status, u.user_id, u.first_name, u.last_name, u.email
FROM Bookings INNER JOIN Users
ON b.user_id = u.user_id;

LEFT JOIN
SELECT * p.property_id, p.name, p.location, r.review_id, r.rating, r.comment
FROM Property LEFT JOIN Review
ON p.property_id = r.property_id
WHERE r.rating >= 4 OR r.rating IS NULL
ORDER BY p.name ASC, r.rating DESC;

FULL OUTER JOIN
SELECT * u.user_id, u.first_name, u.last_name, b.booking_id, b.start_date, b.end_date, b.total_price
FROM FULL User OUTER JOIN Booking
ON u.user_id = b.user_id;