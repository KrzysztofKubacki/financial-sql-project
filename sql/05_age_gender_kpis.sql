SELECT gender,
       SUM(loans_count) AS loans_count
FROM (
  SELECT
    c.gender,
    (2021 - EXTRACT(YEAR FROM c.birth_date)) AS age,
    SUM(l.amount) AS loans_amount,
    COUNT(*)      AS loans_count
  FROM loan l
  JOIN account a USING (account_id)
  JOIN disp d USING (account_id)
  JOIN client c USING (client_id)
  WHERE l.status IN ('A','C') AND d.type='OWNER'
  GROUP BY c.gender, (2021 - EXTRACT(YEAR FROM c.birth_date))
) z
GROUP BY gender;

SELECT
  z.gender,
  SUM(z.age * z.loans_count)/SUM(z.loans_count) AS avg_age_weighted
FROM (
  SELECT
    c.gender,
    (2021 - EXTRACT(YEAR FROM c.birth_date)) AS age,
    COUNT(*) AS loans_count
  FROM loan l
  JOIN account a USING (account_id)
  JOIN disp d USING (account_id)
  JOIN client c USING (client_id)
  WHERE l.status IN ('A','C') AND d.type='OWNER'
  GROUP BY c.gender, (2021 - EXTRACT(YEAR FROM c.birth_date))
) z
GROUP BY z.gender;