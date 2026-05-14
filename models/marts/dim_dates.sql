WITH date_spine AS (
    SELECT
        DATEADD(DAY, SEQ4(), '2000-01-01'::DATE) AS date_day
    FROM TABLE(GENERATOR(ROWCOUNT => 10958))  -- 30 years: 2000-01-01 through 2029-12-31
),

final AS (
    SELECT
        TO_CHAR(date_day, 'YYYYMMDD')::INT                              AS date_key,
        date_day,
        DAYOFWEEK(date_day)                                             AS day_of_week_number,
        DAYNAME(date_day)                                               AS day_of_week_name,
        DAY(date_day)                                                   AS day_of_month,
        DAYOFYEAR(date_day)                                             AS day_of_year,
        WEEKOFYEAR(date_day)                                            AS week_of_year,
        MONTH(date_day)                                                 AS month_number,
        MONTHNAME(date_day)                                             AS month_name,
        QUARTER(date_day)                                               AS quarter_number,
        'Q' || QUARTER(date_day) || ' ' || YEAR(date_day)              AS quarter_label,
        YEAR(date_day)                                                  AS year_number,
        CASE WHEN DAYOFWEEK(date_day) IN (0, 6) THEN true ELSE false END AS is_weekend
    FROM date_spine
)

SELECT * FROM final
