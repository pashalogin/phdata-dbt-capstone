-- All payment amounts must be positive.
-- Zero or negative amounts indicate bad source data or reversal records
-- that should be handled separately.
SELECT
    payment_key,
    customer_key,
    check_number,
    amount
FROM {{ ref('fct_payments') }}
WHERE amount <= 0
