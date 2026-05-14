WITH source AS (
    SELECT * FROM {{ source('classic_models', 'offices') }}
),

renamed AS (
    SELECT
        OFFICECODE      AS office_code,
        CITY            AS city,
        PHONE           AS phone,
        ADDRESSLINE1    AS address_line_1,
        ADDRESSLINE2    AS address_line_2,
        STATE           AS state,
        COUNTRY         AS country,
        POSTALCODE      AS postal_code,
        TERRITORY       AS territory
    FROM source
)

SELECT * FROM renamed
