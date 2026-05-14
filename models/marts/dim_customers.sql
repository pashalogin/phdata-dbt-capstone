WITH customers AS (
    SELECT * FROM {{ ref('stg_classic_models__customers') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['customer_number']) }}  AS customer_key,
        customer_number,
        customer_name,
        contact_last_name,
        contact_first_name,
        phone,
        address_line_1,
        address_line_2,
        city,
        state,
        postal_code,
        country,
        credit_limit,
        sales_rep_employee_number
    FROM customers
)

SELECT * FROM final
