## Partition Performance Note

Partitioning the Booking table by start_date significantly improved query performance for date-based searches. The database engine now scans only relevant partitions, reducing query time and resource usage.
