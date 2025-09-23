SELECT status, COUNT(*) AS cnt
FROM loan
GROUP BY status
ORDER BY status;