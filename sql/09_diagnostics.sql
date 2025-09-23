
SELECT c.client_id, COUNT(*) AS cnt
FROM loan l
JOIN disp d USING (account_id)
JOIN client c USING (client_id)
WHERE l.status IN ('A','C') AND d.type='OWNER'
GROUP BY c.client_id
ORDER BY cnt DESC
LIMIT 10;


SELECT EXTRACT(YEAR FROM birth_date) AS y, COUNT(*) AS cnt
FROM client
GROUP BY y
ORDER BY y;
