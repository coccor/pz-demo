INSERT INTO {{ sink('mart', 'orders_clean', format: 'csv', strategy: 'replace') }}
select
    order_id,
    customer_id,
    amount,
    placed_on
from {{ source('crm', 'orders') }}
where amount > 0
