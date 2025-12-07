SELECT
    i.store_id,
    SUM(p.amount) AS revenue
FROM payment p
JOIN rental r        ON p.rental_id = r.rental_id
JOIN inventory i     ON r.inventory_id = i.inventory_id
GROUP BY i.store_id
ORDER BY i.store_id;
