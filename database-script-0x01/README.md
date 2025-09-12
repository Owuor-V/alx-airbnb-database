# Database Schema – Airbnb Clone

## Overview
This directory contains the SQL script for creating the database schema of the Airbnb Clone project.  
It defines entities, relationships, constraints, and indexes to support efficient queries and ensure data integrity.

## Files
- **schema.sql** → Contains `CREATE TABLE` statements for all core entities (users, properties, bookings, payments).
- **README.md** → Documentation explaining schema design and execution instructions.

## Entities
1. **Users**
   - Stores user details (guests & property owners).
   - Unique email constraint ensures no duplicate accounts.
2. **Properties**
   - Each property is linked to a user (owner).
3. **Bookings**
   - Tracks reservations made by guests for properties.
   - Includes status field for booking lifecycle.
4. **Payments**
   - Linked to bookings, tracks payment details and methods.

## Constraints & Indexes
- **Primary keys** for entity uniqueness.
- **Foreign keys** to enforce relationships.
- **Unique keys** on emails.
- **Indexes** for faster lookup on owner_id and guest_id.

## How to Run
1. Open a MySQL client (or PostgreSQL, depending on project requirements).
2. Run the script:
   ```bash
   mysql -u your_username -p airbnb_db < schema.sql
