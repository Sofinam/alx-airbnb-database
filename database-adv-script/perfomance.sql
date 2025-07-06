1. Query that retrieves all bookings along with the user details

SELECT b.booking_id, b.start_date, b.end_date, b.status, u.user_id, u.first_name, u.last_name, u.email, p.property_id, p.name, p.location, pay.payment_id, pay.amount, pay.payment_method
FROM Booking INNER JOIN User ON b.user_id = u.user_id
INNER JOIN Property ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
WHERE b.start_date >= CURRENT_DATE - INTERVAL '90 days' AND b.status = 'confirmed';

2. EXPLAIN query performance

SELECT b.booking_id, b.start_date, b.end_date, b.status, u.user_id, u.first_name, u.last_name, u.email, p.property_id, p.name, p.location, pay.payment_id, pay.amount, pay.payment_method
FROM Booking 
INNER JOIN User ON b.user_id = u.user_id
INNER JOIN Property ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
WHERE b.start_date >= CURRENT_DATE - INTERVAL '90 days' AND b.status = 'confirmed';



