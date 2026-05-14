WITH source AS (
    SELECT * FROM {{ source('classic_models', 'payments') }}
),

renamed AS (
    SELECT
        CUSTOMERNUMBER  AS customer_number,
        CHECKNUMBER     AS check_number,
        PAYMENTDATE     AS payment_date,
        AMOUNT          AS amount
    FROM source
)

SELECT * FROM renamed
