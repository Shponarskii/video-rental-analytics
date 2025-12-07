SELECT
    EXTRACT(DOW FROM rental_date) AS weekday,
    EXTRACT(HOUR FROM rental_date) AS hour,
    COUNT(*) AS rental_count
FROM rental
GROUP BY weekday, hour
ORDER BY weekday, hour;
