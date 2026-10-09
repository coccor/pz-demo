-- One two-day window per run, up to the time the run started (see window_events in connections.yml).
INSERT INTO {{ sink('lake', 'window_events', format: 'parquet', strategy: 'append', duplicates: 'accept') }}
select event_id, order_id, status, updated_at
from {{ source('raw', 'window_events') }}
