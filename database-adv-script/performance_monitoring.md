# Database Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## Step 1: Monitoring Queries
We selected some of the most frequently used queries:

### Query 1 – Fetch all bookings for a user
```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, p.name AS property_name
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.user_id = 101;


EXPLAIN ANALYZE
SELECT property_id, AVG(rating) AS avg_rating
FROM reviews
GROUP BY property_id
HAVING AVG(rating) > 4.0;

EXPLAIN ANALYZE
SELECT property_id,
       COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM bookings
GROUP BY property_id;


-- Index for faster filtering on user_id
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index to speed up GROUP BY on property_id in reviews
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Index to optimize ranking queries on property_id
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
