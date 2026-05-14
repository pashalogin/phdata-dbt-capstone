-- Gross profit must be less than or equal to line revenue.
-- Gross profit > line_revenue would imply negative cost, which is impossible.
SELECT
    order_item_key,
    order_number,
    line_revenue,
    line_cost,
    line_gross_profit
FROM {{ ref('fct_orders') }}
WHERE line_gross_profit > line_revenue
