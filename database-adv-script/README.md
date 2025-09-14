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
# SQL Subqueries – ALX Airbnb Database

## 🎯 Objective
Practice writing both **correlated** and **non-correlated subqueries**.

## 📂 Files
- `subqueries.sql` – contains SQL scripts with subquery examples.
- `README.md` – documentation of the queries and objectives.

---

## 📝 Queries

### 1. Non-correlated Subquery – Properties with Average Rating > 4.0
Find all properties where the average rating is greater than 4.0.  

```sql
SELECT property_id, property_name, location
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
