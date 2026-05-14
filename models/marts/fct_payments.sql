WITH payments AS (
    SELECT * FROM {{ ref('stg_classic_models__payments') }}
),

dim_customers AS (
    SELECT customer_key, customer_number FROM {{ ref('dim_customers') }}
),

dim_dates AS (
    SELECT date_key, date_day FROM {{ ref('dim_dates') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['p.customer_number', 'p.check_number']) }} AS payment_key,
        dc.customer_key,
        dd.date_key                                                     AS payment_date_key,
        p.check_number,
        p.amount
    FROM payments AS p
    LEFT JOIN dim_customers AS dc
        ON p.customer_number = dc.customer_number
    LEFT JOIN dim_dates AS dd
        ON p.payment_date = dd.date_day
)

SELECT * FROM final
