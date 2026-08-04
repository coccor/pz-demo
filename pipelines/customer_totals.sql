INSERT INTO {{ sink('mart', 'customer_totals', format: 'csv', strategy: 'replace') }}
select
    c.name,
    c.country,
    sum(o.amount) as total
from {{ ref('stg_orders') }} o
join {{ source('crm', 'customers') }} c on c.customer_id = o.customer_id
group by c.name, c.country
