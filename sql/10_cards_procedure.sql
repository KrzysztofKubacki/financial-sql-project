CREATE TABLE IF NOT EXISTS cards_at_expiration
(
  client_id          INT         NOT NULL,
  card_id            INT         NOT NULL,
  expiration_date    DATE        NOT NULL,
  A3                 VARCHAR(15) NOT NULL,
  generated_for_date DATE        NOT NULL
);

DELIMITER $$

DROP PROCEDURE IF EXISTS generate_cards_at_expiration_report $$
CREATE PROCEDURE generate_cards_at_expiration_report(IN p_date DATE)
BEGIN
  IF p_date IS NULL THEN
    SET p_date = CURRENT_DATE();
  END IF;

  TRUNCATE TABLE cards_at_expiration;

  INSERT INTO cards_at_expiration (client_id, card_id, expiration_date, A3, generated_for_date)
  SELECT
    c2.client_id,
    c.card_id,
    DATE_ADD(c.issued, INTERVAL 3 YEAR) AS expiration_date,
    d2.A3,
    p_date
  FROM card     c
  JOIN disp     d  USING (disp_id)
  JOIN client   c2 USING (client_id)
  JOIN district d2 USING (district_id)
  WHERE p_date BETWEEN DATE_ADD(DATE_ADD(c.issued, INTERVAL 3 YEAR), INTERVAL -7 DAY)
                   AND      DATE_ADD(c.issued, INTERVAL 3 YEAR);
END $$
DELIMITER ;

-- Test:
CALL generate_cards_at_expiration_report('2001-01-01');
SELECT * FROM cards_at_expiration LIMIT 50;
