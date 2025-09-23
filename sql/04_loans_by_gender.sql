SELECT
  c.gender,
  SUM(l.amount) AS loans_amount
FROM   loan     l
JOIN   account  a USING (account_id)
JOIN   disp     d USING (account_id)
JOIN   client   c USING (client_id)
WHERE  l.status IN ('A','C')
  AND  d.type = 'OWNER'
GROUP BY c.gender;

--validation
SELECT
  /* suma po płciach z poprawnym JOIN */
  (SELECT SUM(loans_amount)
   FROM (
     SELECT c.gender, SUM(l.amount) AS loans_amount
     FROM loan l
     JOIN account a USING (account_id)
     JOIN disp d USING (account_id)
     JOIN client c USING (client_id)
     WHERE l.status IN ('A','C') AND d.type='OWNER'
     GROUP BY c.gender
   ) g) AS sum_by_gender,

  (SELECT SUM(amount) FROM loan WHERE status IN ('A','C')) AS sum_src,

  (
    (SELECT SUM(loans_amount)
     FROM (
       SELECT c.gender, SUM(l.amount) AS loans_amount
       FROM loan l
       JOIN account a USING (account_id)
       JOIN disp d USING (account_id)
       JOIN client c USING (client_id)
       WHERE l.status IN ('A','C') AND d.type='OWNER'
       GROUP BY c.gender
     ) g2)
    -
    (SELECT SUM(amount) FROM loan WHERE status IN ('A','C'))
  ) AS diff;