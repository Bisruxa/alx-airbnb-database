## Performance Monitoring

To monitor query performance, SQL commands such as `SHOW PROFILE` and `EXPLAIN ANALYZE` were used on frequently executed queries (e.g., booking lookups by user or date).

### Bottlenecks Identified
- Full table scans on the booking table for date range queries.
- Slow joins between booking and users tables due to missing indexes.

### Changes Implemented
- Added indexes on booking(user_id), booking(start_date), and users(user_id).
- Partitioned the booking table by start_date to improve date-based query performance.

### Improvements
- Query execution time for date-based searches and user lookups was significantly reduced.
- The database now uses indexes and partitions, minimizing full table scans and improving overall efficiency.
