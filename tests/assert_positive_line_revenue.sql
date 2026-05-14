-- line_revenue must be positive — zero or negative revenue indicates
-- bad source data or a calculation error in the pipeline.
SELECT
    order_item_key,
    order_number,
    quantity_ordered,
    price_each,
    line_revenue
FROM {{ ref('fct_orders') }}
WHERE line_revenue <= 0
