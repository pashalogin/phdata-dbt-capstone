WITH source AS (
    SELECT * FROM {{ source('classic_models', 'products') }}
),

renamed AS (
    SELECT
        PRODUCTCODE         AS product_code,
        PRODUCTNAME         AS product_name,
        PRODUCTLINE         AS product_line,
        PRODUCTSCALE        AS product_scale,
        PRODUCTVENDOR       AS product_vendor,
        PRODUCTDESCRIPTION  AS product_description,
        QUANTITYINSTOCK     AS quantity_in_stock,
        BUYPRICE            AS buy_price,
        MSRP                AS msrp
    FROM source
)

SELECT * FROM renamed
