-- Initial query: retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- Analyze performance
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- Refactored query for better performance:
-- 1. Select only necessary fields instead of all
-- 2. Ensure indexes exist on foreign keys (user_id, property_id, booking_id)
-- 3. Avoid redundant joins if payments are not always required
SELECT 
    b.booking_id,
    b.booking_date,
    u.username,
    p.property_name,
    COALESCE(pay.amount, 0) AS payment_amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
