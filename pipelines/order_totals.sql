INSERT INTO {{ sink('lake', 'order_totals', strategy: 'replace', format: 'csv') }}
select customer_id, sum(no_such_column) as total
from {{ ref('stg_orders') }}
group by customer_id
