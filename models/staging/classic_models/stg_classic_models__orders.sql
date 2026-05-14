WITH source AS (
    SELECT * FROM {{ source('classic_models', 'orders') }}
),

renamed AS (
    SELECT
        ORDERNUMBER     AS order_number,
        ORDERDATE       AS order_date,
        REQUIREDDATE    AS required_date,
        SHIPPEDDATE     AS shipped_date,
        STATUS          AS order_status,
        COMMENTS        AS comments,
        CUSTOMERNUMBER  AS customer_number
    FROM source
)

SELECT * FROM renamed
