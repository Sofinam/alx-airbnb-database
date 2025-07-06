-- Enable profiling
SET PROFILING = 1;

-- Run your query
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  u.user_id,
  u.first_name,
  p.property_id,
  p.name AS property_name
FROM
  Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE
  b.start_date >= CURDATE() - INTERVAL 90 DAY
  AND b.status = 'confirmed';

-- Show profiling results
SHOW PROFILE FOR QUERY 1;

2. Bottlenecks
Suppose EXPLAIN shows; Booking uses Seq Scan for start_date filter
Booking.user_id or Booking.property_id joins do not use indexes.

3. Improvements
CREATE INDEX idx_booking_start_date ON "Booking" (start_date);
CREATE INDEX idx_booking_status ON "Booking" (status);
