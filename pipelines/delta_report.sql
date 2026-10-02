-- Reads the Delta table back, so the round trip proves both directions of the connector.
INSERT INTO {{ sink('lake', 'delta_report', format: 'csv', strategy: 'replace') }}
select dt, count(*) as orders, sum(amount) as total, max(placed_at) as last_placed
from {{ source('delta', 'orders') }}
group by dt
order by dt
