WITH products AS (
    SELECT * FROM {{ ref('stg_classic_models__products') }}
),

product_lines AS (
    SELECT * FROM {{ ref('stg_classic_models__product_lines') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['p.product_code']) }}  AS product_key,
        p.product_code,
        p.product_name,
        p.product_line,
        pl.text_description                                          AS product_line_description,
        p.product_scale,
        p.product_vendor,
        p.product_description,
        p.quantity_in_stock,
        p.buy_price,
        p.msrp
    FROM products AS p
    LEFT JOIN product_lines AS pl
        ON p.product_line = pl.product_line
)

SELECT * FROM final
