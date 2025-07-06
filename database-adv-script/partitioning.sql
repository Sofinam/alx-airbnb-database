Create main booking table as a participant TABLE
CREATE TABLE "Booking" (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

2. Create partitions by year
CREATE TABLE booking_2025 PARTITION OF "Booking"
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE booking_2026 PARTITION OF "Booking"
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- 3. Index on user_id and property_id to support joins
CREATE INDEX idx_booking_user_id ON "Booking"(user_id);
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);

-- 4. Example query on a date range
EXPLAIN ANALYZE
SELECT *
FROM "Booking"
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';