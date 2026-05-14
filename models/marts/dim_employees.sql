WITH employees AS (
    SELECT * FROM {{ ref('stg_classic_models__employees') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['employee_number']) }}  AS employee_key,
        employee_number,
        last_name,
        first_name,
        last_name || ', ' || first_name                              AS full_name,
        email,
        extension,
        job_title,
        office_code,
        reports_to_employee_number
    FROM employees
)

SELECT * FROM final
