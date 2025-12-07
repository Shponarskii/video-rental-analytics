WITH payments_with_store AS (
    SELECT
        p.payment_id,
        p.amount,
        p.payment_date,
        i.store_id
    FROM payment p
    JOIN rental r ON p.rental_id = r.rental_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
)
SELECT
    store_id,
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(*) AS payment_count
FROM payments_with_store
GROUP BY store_id, DATE_TRUNC('month', payment_date)
ORDER BY store_id, month;
