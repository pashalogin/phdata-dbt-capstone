WITH offices AS (
    SELECT * FROM {{ ref('stg_classic_models__offices') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['office_code']) }}  AS office_key,
        office_code,
        city,
        phone,
        address_line_1,
        address_line_2,
        state,
        country,
        postal_code,
        territory
    FROM offices
)

SELECT * FROM final
