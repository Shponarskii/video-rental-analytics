SELECT
    DATE_TRUNC('month', r.rental_date) AS month,
    COUNT(*) AS rental_count
FROM rental r
GROUP BY 1
ORDER BY 1;