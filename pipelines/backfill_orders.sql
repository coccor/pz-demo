-- One slice of the windowed backfill per run (see backfill_orders in connections.yml).
INSERT INTO {{ sink('lake', 'backfill_orders', format: 'parquet', strategy: 'append', duplicates: 'accept') }}
select id, customer_id, amount, placed_at
from {{ source('raw', 'backfill_orders') }}
