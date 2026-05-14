-- Shipped orders must have a shipped_date on or after the order_date.
-- A negative gap would indicate bad source data or a data pipeline error.
SELECT
    order_item_key,
    order_number,
    order_date_key,
    shipped_date_key
FROM {{ ref('fct_orders') }}
WHERE
    shipped_date_key IS NOT NULL
    AND shipped_date_key < order_date_key
