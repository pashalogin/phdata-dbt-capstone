WITH order_items AS (
    SELECT * FROM {{ ref('int_order_items') }}
),

dim_customers AS (
    SELECT customer_key, customer_number FROM {{ ref('dim_customers') }}
),

dim_products AS (
    SELECT product_key, product_code FROM {{ ref('dim_products') }}
),

dim_dates AS (
    SELECT date_key, date_day FROM {{ ref('dim_dates') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['oi.order_number', 'oi.product_code']) }} AS order_item_key,
        oi.order_number,
        oi.order_line_number,
        dc.customer_key,
        dp.product_key,
        dd_order.date_key                                               AS order_date_key,
        dd_required.date_key                                            AS required_date_key,
        dd_shipped.date_key                                             AS shipped_date_key,
        oi.order_status,
        oi.quantity_ordered,
        oi.price_each,
        oi.line_revenue,
        oi.line_cost,
        oi.line_gross_profit
    FROM order_items AS oi
    INNER JOIN dim_customers AS dc
        ON oi.customer_number = dc.customer_number
    LEFT JOIN dim_products AS dp
        ON oi.product_code = dp.product_code
    LEFT JOIN dim_dates AS dd_order
        ON oi.order_date = dd_order.date_day
    LEFT JOIN dim_dates AS dd_required
        ON oi.required_date = dd_required.date_day
    LEFT JOIN dim_dates AS dd_shipped
        ON oi.shipped_date = dd_shipped.date_day
)

SELECT * FROM final
