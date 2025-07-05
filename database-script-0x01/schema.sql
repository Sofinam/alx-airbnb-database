

CREATE TABLE "User" (
    user_id Primary Key UUID,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NULL,
    role VARCHAR(20) ENUM (guest, host, admin) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_user_role ON "User"(role);

CREATE TABLE "Property" (
    property_id Primary Key UUID,
    host_id Foreign Key (host_id) references "User"(user_id) NOT NULL,
    name VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(200) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);
CREATE INDEX idx_property_host_id ON "Property"(host_id);
CREATE INDDEX idx_property_location ON "Property"(location)

CREATE TABLE "Booking" (
    booking_id Primary Key UUID,
    property_id Foreign Key references Property(property_id) NOT NULL,
    user_id Foreign Key references User(user_id) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) ENUM (pending, confirmed, canceled), NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);
CREATE INDEX idx_booking_user_id ON "Booking"(user_id);
CREATE INDEX idx_booking_status ON "Booking"(status);


CREATE TABLE "Payment" (
    payment_id Primary Key UUID,
    booking_id Foreign Key references Booking(booking_id) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) ENUM (credit_card, paypal, stripe) NOT NULL,
);
CREATE INDEX idx_payment_booking_id ON  "Payment"(booking_id);

CREATE TABLE "Review" (
    review_id Primary Key UUID,
    property_id Foreign Key references Property(property_id) NOT NULL,
    user_id Foreign Key references User(user_id),
    rating INTEGER CHECK: rating >= 1 AND rating <= 5 NOT NULL,
    comment TEXT NOT NULL
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);
CREATE INDEX idx_review_property_id ON "Review"(property_id);
CREATE INDEX idx_review_user_id ON "Review"(user_id);

CREATE TABLE "Message" (
    message_id Primary Key UUID,
    sender_id Foreign Key references User(user_id) NOT NULL,
    recipient_id Foreign Key references User(user_id) NOT NULL;
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);
CREATE INDEX idx_message_sender_id ON "Message"(sender_id);
CREATE INDEX idx_message_recipient_id ON "Message"(recipient_id);