Properties with average renting
SELECT p.property_id, p.name, p.location
FROM Property WHERE (SELECT AVG(r.rating) FROM Review WHERE r.property_id = p.property_id) > 4.0;

Correlated subquery
SELECT user_id, first_name, last_name, email
FROM User WHERE (SELECT COUNT(*) FROM Booking WHERE b.user_id = u.user_id) > 3;