-- Merge into a Delta table through the external deltalake connector.
INSERT INTO {{ sink('delta', 'orders', strategy: 'merge', keys: ['id', 'dt'], partition_by: 'dt') }}
select id, dt, placed_at, amount
from {{ source('raw', 'delta_orders') }}
