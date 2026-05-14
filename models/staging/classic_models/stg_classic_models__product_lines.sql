WITH source AS (
    SELECT * FROM {{ source('classic_models', 'productlines') }}
),

renamed AS (
    SELECT
        PRODUCTLINE         AS product_line,
        TEXTDESCRIPTION     AS text_description,
        HTMLDESCRIPTION     AS html_description
    FROM source
)

SELECT * FROM renamed
