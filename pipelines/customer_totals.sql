INSERT INTO {{ sink('mart', 'customer_totals', format: 'csv', strategy: 'replace') }}
select
    c.name,
    c.country,
    sum(o.amount) as total
from {{ source('crm', 'customers') }} c
join {{ source('crm', 'orders') }} o on o.customer_id = c.customer_id
group by c.name, c.country
