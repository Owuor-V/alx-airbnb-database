# Airbnb Database – Normalization to 3NF

## 📖 Overview
This document explains how the Airbnb database schema was normalized step by step, from **1st Normal Form (1NF)** to **3rd Normal Form (3NF)**.  
Normalization ensures that the database design minimizes redundancy, prevents anomalies, and maintains data integrity.

---

## 🔹 1st Normal Form (1NF)
**Requirements:**
- Each table must have a primary key.
- All attributes must be atomic (no repeating groups or multi-valued fields).
- No duplicate rows.

**Application:**
- Each entity (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) has a **primary key** (`user_id`, `property_id`, etc.).
- All attributes are atomic:
  - Example: `first_name`, `last_name` are separated (no combined `full_name` field).
  - `role` uses ENUM values (guest, host, admin), avoiding multi-valued fields.
- No repeating groups or arrays in a single column.

✅ **The schema satisfies 1NF.**

---

## 🔹 2nd Normal Form (2NF)
**Requirements:**
- Must be in 1NF.
- All non-key attributes must depend on the whole primary key (no partial dependency).

**Application:**
- Each table has a **single-column primary key** (UUIDs), not composite keys.
- Therefore, no non-key attribute depends on only part of a primary key.
- Example:
  - In `Booking`, attributes like `start_date`, `end_date`, `status`, `total_price` all depend on the entire `booking_id` (not partially on `user_id` or `property_id`).
- In `Payment`, attributes (`amount`, `payment_date`, `payment_method`) depend only on `payment_id`.

✅ **The schema satisfies 2NF.**

---

## 🔹 3rd Normal Form (3NF)
**Requirements:**
- Must be in 2NF.
- No transitive dependencies (non-key attributes depending on other non-key attributes).

**Application:**
- In `User`, attributes (`first_name`, `last_name`, `email`, `role`) depend only on `user_id`, not on each other.
- In `Property`, `location` and `pricepernight` depend only on `property_id`, not on `host_id`.
- In `Booking`, `total_price` depends directly on `booking_id` (not indirectly through `Property.pricepernight`).
- In `Review`, `rating` and `comment` depend only on `review_id`, not on `user_id` or `property_id`.
- In `Message`, `message_body` depends only on `message_id`, not on `sender_id` or `recipient_id`.

✅ **The schema satisfies 3NF.**

---

## 📝 Conclusion
After reviewing and applying normalization principles:
- The Airbnb database schema is already designed to meet **Third Normal Form (3NF)**.
- There are no repeating groups, partial dependencies, or transitive dependencies.
- The schema is optimized for scalability, data integrity, and minimal redundancy.

---
