User - attributes depend directly on user_id
Property - host_id is a foreign key that references to User, other attributes depend on property_id
Booking - It depends on booking id. total_price is valid because its specific to the booking.
Payment - Depends on payment_id. amount is booking 
Review - All attributes depend only on review id
Message - sender_id and recippient_id are direct foreign keys