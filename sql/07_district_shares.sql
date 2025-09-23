SELECT
  t.*,
  t.loans_given_amount / SUM(t.loans_given_amount) OVER () AS amount_share
FROM (
  SELECT
    d2.district_id,
    SUM(l.amount) AS loans_given_amount
  FROM loan l
  JOIN account  a  USING (account_id)
  JOIN disp     d  USING (account_id)
  JOIN client   c  USING (client_id)
  JOIN district d2 ON c.district_id = d2.district_id
  WHERE l.status IN ('A','C') AND d.type='OWNER'
  GROUP BY d2.district_id
) t
ORDER BY amount_share DESC;