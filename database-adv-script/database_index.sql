-- Indexes for Users table
-- Commonly queried by user_id (PK already indexed) and email (for lookups)
CREATE INDEX idx_users_email ON users(email);

-- Indexes for Bookings table
-- Frequently used in JOINs with users and properties
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Indexes for date range queries (performance optimization)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);

-- Indexes for Properties table
-- Frequently used in JOINs and filters
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_name ON properties(property_name);
