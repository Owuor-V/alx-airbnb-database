# Index Performance Analysis – ALX Airbnb Database

## 🎯 Objective
Identify and create indexes on **high-usage columns** in the User, Booking, and Property tables to improve query performance.

---

## 🔎 Step 1: Identify High-Usage Columns
Based on queries written in earlier tasks:

- **Users table**:  
  - `user_id` (already a primary key index).  
  - `email` (commonly used for lookups and authentication).  

- **Bookings table**:  
  - `user_id` (JOIN with `users`).  
  - `property_id` (JOIN with `properties`).  
  - `start_date`, `end_date` (used in filtering by date ranges).  

- **Properties table**:  
  - `property_id` (already a primary key index).  
  - `location` (used for search/filtering).  
  - `property_name` (used in search).  

---

## 🛠️ Step 2: Create Indexes
SQL commands to add indexes are written in `database_index.sql`.

Example:
```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_properties_location ON properties(location);
