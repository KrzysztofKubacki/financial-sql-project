SELECT
  c.client_id,
  SUM(l.amount - l.payments) AS client_balance,
  COUNT(*)                   AS loans_amount
FROM loan l
JOIN account a USING (account_id)
JOIN disp d USING (account_id)
JOIN client c USING (client_id)
WHERE l.status IN ('A','C') AND d.type='OWNER'
AND EXTRACT(YEAR FROM c.birth_date) > 1990
GROUP BY c.client_id
HAVING SUM(l.amount - l.payments) > 1000
AND COUNT(*) > 5;