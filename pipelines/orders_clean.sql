INSERT INTO {{ sink('mart', 'orders_clean', format: 'csv', strategy: 'replace') }}
select *
from {{ ref('stg_orders') }}
where amount > 0
