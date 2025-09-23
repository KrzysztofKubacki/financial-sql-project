SELECT
  d2.district_id,
  COUNT(DISTINCT c.client_id) AS customer_amount,
  SUM(l.amount)               AS loans_given_amount,
  COUNT(*)                    AS loans_given_count
FROM loan     l
JOIN account  a  USING (account_id)
JOIN disp     d  USING (account_id)
JOIN client   c  USING (client_id)
JOIN district d2 ON c.district_id = d2.district_id
WHERE l.status IN ('A','C') AND d.type='OWNER'
GROUP BY d2.district_id
ORDER BY customer_amount DESC;