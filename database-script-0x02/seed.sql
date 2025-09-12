-- Users
INSERT INTO users (full_name, email, phone_number) VALUES
('Alice Johnson', 'alice@example.com', '+254700123456'),
('Brian Ochieng', 'brian@example.com', '+254701987654'),
('Clara Smith', 'clara@example.com', '+254702456789'),
('David Kimani', 'david@example.com', '+254703321654');

-- Properties
INSERT INTO properties (owner_id, title, description, location, price_per_night) VALUES
(1, 'Cozy 2-Bedroom Apartment', 'A modern apartment in Nairobi CBD', 'Nairobi, Kenya', 50.00),
(2, 'Beachfront Villa', 'Spacious villa with ocean view', 'Mombasa, Kenya', 120.00),
(3, 'Mountain Cabin', 'Rustic cabin ideal for getaways', 'Mt. Kenya, Kenya', 75.00);

-- Bookings
INSERT INTO bookings (property_id, guest_id, check_in, check_out, total_amount, status) VALUES
(1, 2, '2025-09-20', '2025-09-25', 250.00, 'confirmed'),
(2, 3, '2025-10-01', '2025-10-05', 480.00, 'pending'),
(3, 4, '2025-11-15', '2025-11-18', 225.00, 'confirmed');

-- Payments
INSERT INTO payments (booking_id, amount, method) VALUES
(1, 250.00, 'mpesa'),
(3, 225.00, 'credit_card');
