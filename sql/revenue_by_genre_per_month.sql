WITH payments_with_category AS (
    SELECT
        p.payment_id,
        p.amount,
        p.payment_date,
        c.name AS category
    FROM payment p
    JOIN rental r ON p.rental_id = r.rental_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
)
SELECT
    DATE_TRUNC('month', payment_date) AS month,
    category,
    SUM(amount) AS monthly_revenue,
    COUNT(*) AS payment_count
FROM payments_with_category
GROUP BY month, category
ORDER BY month, monthly_revenue DESC;
