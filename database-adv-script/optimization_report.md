Refactoring
1. Ensure Booking.user_id, Booking.property_id and payment_id have indexes.
2. If payment is 1:1 with Booking, INNER JOIN is better than LEFT JOIN
3. If only recent boookings are needed, filter with WHERE and INDEX on created_at