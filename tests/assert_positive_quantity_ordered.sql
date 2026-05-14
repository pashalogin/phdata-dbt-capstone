-- All quantities ordered must be positive (> 0).
-- Zero or negative quantities indicate data entry errors in the source system.
SELECT
    order_item_key,
    order_number,
    quantity_ordered
FROM {{ ref('fct_orders') }}
WHERE quantity_ordered <= 0
