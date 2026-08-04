select
    order_id,
    customer_id,
    amount,
    placed_on
from {{ source('crm', 'orders') }}
