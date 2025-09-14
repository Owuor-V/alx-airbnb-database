# Partitioning Performance Report

## Objective
The `bookings` table was becoming very large, leading to slow queries.  
We implemented **table partitioning** on the `start_date` column to optimize performance for queries filtering by date ranges.

---

## Implementation
- Partitioned `bookings` table **by RANGE** on `start_date`.
- Created partitions:
  - `bookings_2023` → 2023 bookings
  - `bookings_2024` → 2024 bookings
  - `bookings_future` → 2025 and beyond

---

## Performance Testing
### Query Tested
```sql
SELECT * 
FROM bookings 
WHERE start_date BETWEEN '2024-05-01' AND '2024-06-30';
