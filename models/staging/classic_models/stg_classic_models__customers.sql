WITH source AS (
    SELECT * FROM {{ source('classic_models', 'customers') }}
),

renamed AS (
    SELECT
        CUSTOMERNUMBER      AS customer_number,
        CUSTOMERNAME        AS customer_name,
        CONTACTLASTNAME     AS contact_last_name,
        CONTACTFIRSTNAME    AS contact_first_name,
        PHONE               AS phone,
        ADDRESSLINE1        AS address_line_1,
        ADDRESSLINE2        AS address_line_2,
        CITY                AS city,
        STATE               AS state,
        POSTALCODE          AS postal_code,
        COUNTRY             AS country,
        SALESREPEMPLOYEENUMBER AS sales_rep_employee_number,
        CREDITLIMIT         AS credit_limit
    FROM source
)

SELECT * FROM renamed
