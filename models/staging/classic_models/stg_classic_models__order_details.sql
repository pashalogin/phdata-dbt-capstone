WITH source AS (
    SELECT * FROM {{ source('classic_models', 'orderdetails') }}
),

renamed AS (
    SELECT
        ORDERNUMBER     AS order_number,
        PRODUCTCODE     AS product_code,
        QUANTITYORDERED AS quantity_ordered,
        PRICEEACH       AS price_each,
        ORDERLINENUMBER AS order_line_number
    FROM source
)

SELECT * FROM renamed
