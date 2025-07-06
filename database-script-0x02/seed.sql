-- Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('2387', 'Julia', 'Müller', 'juliamueller@gmail.com', 'hashpassword1', '256774250678', 'guest')
('9457', 'Jane', 'Mayer', 'janemayer@gmal.com', 'hashpassowrd2', '256778345698', 'host')
('6837', 'Joe', 'Bauer', 'joebauer@gmail.com', 'hashpassword3', '256704981258', 'admin')

-- Properties
INSERT INTO "Property" (property_id, host_id, name, description, location, price_per_night)
VALUES
('0012', '9983', 'Holly Kasper', 'Single appartment, 'Cologne', '100')
('8822', '8736', 'Lisa Bane', 'Studio appartment', 'Ruhr', '200')

-- Bookings
INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('0000', '2770', '2893', '22-09-2025', '25-09-2025', '300', 'pending')


-- Payments
INSERT INTO "Payment" (payment_id, booking_id, amount, payment_method)
VALUES
('5566', '0000', '300', 'paypal')

-- Reviews
INSERT INTO "Review" (review_id, property_id, user_id, rating, comment)
VALUES
('4560', '8000', '1265', '5', 'Good services')

-- Messages
INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body)
VALUES
('8112', '7334', '8337', 'Hi, does the appartment have a shared bathroom?')