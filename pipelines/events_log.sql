-- The WHERE clause is the incremental declaration: the first run lands every row, later runs only rows
-- newer than the stored watermark. Append plus a replayable read is at-least-once, so the duplicates
-- are accepted explicitly (pz refuses the pairing otherwise, PZ0214).
INSERT INTO {{ sink('lake', 'events_log', format: 'parquet', strategy: 'append', duplicates: 'accept') }}
select
    order_id,
    customer_id,
    amount,
    status,
    updated_at
from {{ source('raw', 'events') }}
where updated_at > {{ watermark('raw', 'events') }}
