-- The date dimension must be contiguous — no missing days.
-- Compares each date_day to the previous row; any gap > 1 day is a defect.
SELECT
    date_day,
    LAG(date_day) OVER (ORDER BY date_day) AS prev_date_day,
    DATEDIFF(DAY, LAG(date_day) OVER (ORDER BY date_day), date_day) AS gap_days
FROM {{ ref('dim_dates') }}
QUALIFY DATEDIFF(DAY, LAG(date_day) OVER (ORDER BY date_day), date_day) > 1
