# Database Seed – Airbnb Clone

## Overview
This directory contains the SQL script for populating the Airbnb Clone database with sample data.  
The seed data reflects **real-world scenarios** with users, properties, bookings, and payments.

## Files
- **seed.sql** → Contains `INSERT` statements to populate the database with realistic data.
- **README.md** → Documentation explaining the seed data and execution instructions.

## Seed Data
1. **Users**
   - Represents both property owners and guests.
   - Includes realistic names, emails, and phone numbers.
2. **Properties**
   - Linked to owners.
   - Covers different categories: city apartments, villas, cabins.
3. **Bookings**
   - Connects guests with properties.
   - Includes various statuses (`confirmed`, `pending`).
4. **Payments**
   - Linked to bookings.
   - Demonstrates different payment methods (M-Pesa, credit card).

## How to Run
1. Ensure your database schema is already created:
   ```bash
   mysql -u your_username -p airbnb_db < ../database-script-0x01/schema.sql
