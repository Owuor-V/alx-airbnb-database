# SQL Joins Queries – ALX Airbnb Database

## 🎯 Objective
Master SQL joins by writing complex queries using different types of joins.

## 📂 Files
- `joins_queries.sql` – contains SQL scripts with INNER JOIN, LEFT JOIN, and FULL OUTER JOIN queries.
- `README.md` – documentation for the queries and task objectives.

## 📝 Queries

### 1. INNER JOIN – Bookings with Users
Retrieve all bookings and the respective users who made those bookings.

```sql
SELECT b.booking_id, b.property_id, b.start_date, b.end_date, 
       u.user_id, u.name AS user_name, u.email
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.user_id;
