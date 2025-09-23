USE financial;

SELECT *
FROM (
  SELECT
    EXTRACT(YEAR   FROM date) AS loan_year,
    QUARTER(date)             AS loan_quarter,
    EXTRACT(MONTH  FROM date) AS loan_month,
    SUM(amount)  AS loans_total,
    AVG(amount)  AS loans_avg,
    COUNT(*)     AS loans_count
  FROM loan
  GROUP BY loan_year, loan_quarter, loan_month WITH ROLLUP
) r
ORDER BY loan_year, loan_quarter, loan_month;