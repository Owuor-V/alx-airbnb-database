-- Aggregation with COUNT and GROUP BY:
-- Find the total number of bookings made by each user
SELECT 
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;

-- Window Function with RANK:
-- Rank properties based on the total number of bookings
SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM properties p
LEFT JOIN bookings b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name
ORDER BY property_rank;
