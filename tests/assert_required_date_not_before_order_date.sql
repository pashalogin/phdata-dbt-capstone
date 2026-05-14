-- Required delivery date must be on or after the order date.
-- A required_date before the order_date is logically impossible.
SELECT
    order_item_key,
    order_number,
    order_date_key,
    required_date_key
FROM {{ ref('fct_orders') }}
WHERE
    required_date_key IS NOT NULL
    AND required_date_key < order_date_key
