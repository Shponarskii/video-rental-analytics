WITH customer_base AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        c.active,
        c.create_date
    FROM customer c
),

rental_stats AS (
    SELECT
        r.customer_id,
        COUNT(*) AS rental_count,
        MIN(r.rental_date) AS first_rental_date,
        MAX(r.rental_date) AS last_rental_date
    FROM rental r
    GROUP BY r.customer_id
),

payment_stats AS (
    SELECT
        p.customer_id,
        SUM(p.amount) AS total_revenue,
        COUNT(*) AS payment_count,
        AVG(p.amount) AS avg_payment_amount
    FROM payment p
    GROUP BY p.customer_id
),

merged AS (
    SELECT
        cb.customer_id,
        cb.first_name,
        cb.last_name,
        cb.email,
        cb.active,
        cb.create_date,
        COALESCE(rs.rental_count, 0) AS rental_count,
        rs.first_rental_date,
        rs.last_rental_date,
        COALESCE(ps.total_revenue, 0) AS total_revenue,
        COALESCE(ps.payment_count, 0) AS payment_count,
        COALESCE(ps.avg_payment_amount, 0) AS avg_payment_amount
    FROM customer_base cb
    LEFT JOIN rental_stats rs ON cb.customer_id = rs.customer_id
    LEFT JOIN payment_stats ps ON cb.customer_id = ps.customer_id
),

segmented AS (
    SELECT
        *,
        CASE
            WHEN total_revenue >= 150 THEN 'A — High value'
            WHEN total_revenue BETWEEN 50 AND 149 THEN 'B — Medium value'
            ELSE 'C — Low value'
        END AS ltv_segment
    FROM merged
)

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    active,
    create_date,
    rental_count,
    first_rental_date,
    last_rental_date,
    total_revenue,
    payment_count,
    avg_payment_amount,
    ltv_segment
FROM segmented
ORDER BY total_revenue DESC;
