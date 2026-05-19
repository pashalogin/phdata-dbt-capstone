WITH orders AS (
    SELECT * FROM {{ ref('stg_classic_models__orders') }}
),

order_details AS (
    SELECT * FROM {{ ref('stg_classic_models__order_details') }}
),

products AS (
    SELECT * FROM {{ ref('stg_classic_models__products') }}
),

joined AS (
    SELECT
        od.order_number,
        od.product_code,
        od.order_line_number,
        od.quantity_ordered,
        od.price_each,
        od.quantity_ordered * od.price_each                             AS line_revenue,
        od.quantity_ordered * p.buy_price                               AS line_cost,
        (od.quantity_ordered * od.price_each)
            - (od.quantity_ordered * p.buy_price)                       AS line_gross_profit,
        o.order_date,
        o.required_date,
        o.shipped_date,
        o.order_status,
        o.customer_number AS customer_number
    FROM order_details AS od
    INNER JOIN orders AS o
        ON od.order_number = o.order_number
    LEFT JOIN products AS p
        ON od.product_code = p.product_code
)

SELECT * FROM joined
