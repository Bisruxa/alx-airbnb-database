# 🏡 Airbnb Database Schema

This project defines the database schema for an Airbnb-style application, designed and normalized up to **Third Normal Form (3NF)** to ensure data consistency, minimal redundancy, and scalability.

---

## 📦 Entities and Relationships

The database contains the following core entities:

### 🔹 `users`
Stores information about platform users including guests, hosts, and admins.

| Column         | Type        | Constraints                         |
|----------------|-------------|-------------------------------------|
| user_id        | UUID        | Primary Key, Indexed                |
| first_name     | VARCHAR     | Not Null                            |
| last_name      | VARCHAR     | Not Null                            |
| email          | VARCHAR     | Unique, Not Null, Indexed           |
| password_hash  | VARCHAR     | Not Null                            |
| phone_number   | VARCHAR     | Optional                            |
| role           | ENUM        | Must be one of: `guest`, `host`, `admin` |
| created_at     | TIMESTAMP   | Defaults to current timestamp       |

---

### 🔹 `properties`
Each record represents a property hosted on the platform.

| Column        | Type        | Constraints                         |
|---------------|-------------|-------------------------------------|
| property_id   | UUID        | Primary Key, Indexed                |
| host_id       | UUID        | Foreign Key → users(user_id)        |
| name          | VARCHAR     | Not Null                            |
| description   | TEXT        | Not Null                            |
| location      | VARCHAR     | Not Null                            |
| pricepernight | DECIMAL     | Not Null                            |
| created_at    | TIMESTAMP   | Defaults to current timestamp       |
| updated_at    | TIMESTAMP   | Updated automatically               |

---

### 🔹 `bookings`
Captures reservations made by guests for properties.

| Column       | Type        | Constraints                         |
|--------------|-------------|-------------------------------------|
| booking_id   | UUID        | Primary Key, Indexed                |
| property_id  | UUID        | Foreign Key → properties(property_id) |
| user_id      | UUID        | Foreign Key → users(user_id)        |
| start_date   | DATE        | Not Null                            |
| end_date     | DATE        | Not Null                            |
| total_price  | DECIMAL     | Not Null                            |
| status       | ENUM        | `pending`, `confirmed`, `canceled` |
| created_at   | TIMESTAMP   | Defaults to current timestamp       |

---

### 🔹 `payments`
Contains payment information associated with bookings.

| Column        | Type        | Constraints                         |
|---------------|-------------|-------------------------------------|
| payment_id    | UUID        | Primary Key, Indexed                |
| booking_id    | UUID        | Unique, Foreign Key → bookings(booking_id) |
| amount        | DECIMAL     | Not Null                            |
| payment_date  | TIMESTAMP   | Defaults to current timestamp       |
| payment_method| ENUM        | `credit_card`, `paypal`, `stripe`   |

---

### 🔹 `reviews`
Users can leave reviews and ratings for properties they booked.

| Column       | Type        | Constraints                         |
|--------------|-------------|-------------------------------------|
| review_id    | UUID        | Primary Key, Indexed                |
| property_id  | UUID        | Foreign Key → properties(property_id) |
| user_id      | UUID        | Foreign Key → users(user_id)        |
| rating       | INTEGER     | Must be between 1 and 5             |
| comment      | TEXT        | Not Null                            |
| created_at   | TIMESTAMP   | Defaults to current timestamp       |

---

### 🔹 `messages`
Stores private messages between users on the platform.

| Column        | Type        | Constraints                         |
|---------------|-------------|-------------------------------------|
| message_id    | UUID        | Primary Key, Indexed                |
| sender_id     | UUID        | Foreign Key → users(user_id)        |
| recipient_id  | UUID        | Foreign Key → users(user_id)        |
| message_body  | TEXT        | Not Null                            |
| sent_at       | TIMESTAMP   | Defaults to current timestamp       |

---

## 🧠 Normalization Summary

The schema has been normalized to **Third Normal Form (3NF)**:
- ✅ No repeating groups or multi-valued attributes (1NF)
- ✅ No partial dependencies on composite keys (2NF)
- ✅ No transitive dependencies between non-key attributes (3NF)

---

## ⚙️ Constraints & Indexes

- Primary keys: Indexed by default
- Foreign keys: Enforce referential integrity
- Unique constraints: On user email and booking_id in payments
- Enums: Enforce valid roles, statuses, and payment methods
- Additional indexes: For performance on frequently queried fields (e.g. `email`, `booking_id`, `property_id`)







