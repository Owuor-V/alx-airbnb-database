-- Drop existing partitioned table if it exists (for re-runs)
DROP TABLE IF EXISTS bookings PARTITION BY RANGE (start_date);

-- Step 1: Create a partitioned bookings table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions (example: yearly)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_future PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);

-- Step 3: Test query performance before and after partitioning
-- Example: Fetch bookings by date range
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-05-01' AND '2024-06-30';

-- Step 4: Insert sample test data (optional for testing)
INSERT INTO bookings (user_id, property_id, start_date, end_date, status)
VALUES
    (1, 101, '2023-02-10', '2023-02-15', 'confirmed'),
    (2, 102, '2024-03-05', '2024-03-10', 'confirmed'),
    (3, 103, '2024-05-20', '2024-05-25', 'pending'),
    (4, 104, '2025-07-01', '2025-07-05', 'cancelled');
