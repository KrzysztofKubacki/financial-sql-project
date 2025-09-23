SELECT
  t.*,
  ROW_NUMBER() OVER (ORDER BY t.loans_amount DESC) AS rank_by_amount,
  ROW_NUMBER() OVER (ORDER BY t.loans_count  DESC) AS rank_by_count
FROM (
  SELECT
    account_id,
    SUM(amount) AS loans_amount,
    COUNT(*)    AS loans_count,
    AVG(amount) AS loans_avg
  FROM loan
  WHERE status IN ('A','C')
  GROUP BY account_id
) AS t;
#4