WITH source AS (
    SELECT * FROM {{ source('classic_models', 'employees') }}
),

renamed AS (
    SELECT
        EMPLOYEENUMBER      AS employee_number,
        LASTNAME            AS last_name,
        FIRSTNAME           AS first_name,
        EXTENSION           AS extension,
        EMAIL               AS email,
        OFFICECODE          AS office_code,
        REPORTSTO           AS reports_to_employee_number,
        JOBTITLE            AS job_title
    FROM source
)

SELECT * FROM renamed
