-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean

CREATE TABLE gifts (id serial primary KEY,gift TEXT, giver VARCHAR(40), valuee INT, previously_regifted BOOLEAN DEFAULT false);

-- 
\echo See details of the table you created
-- 
\d gifts

-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME valuee TO value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO gifts (gift, giver, value, previously_regifted) VALUES ('peach candle', 'Santa', '9', TRUE);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted) VALUES ('peach candle', 'Santa', '9', TRUE), ('cinnamon candle', 'Nick', '19', TRUE), ('soap on a rope', 'Rudolf', '29', FALSE),('potpurri', 'Elf on the Shelf', '39', TRUE),('mango candle', 'The Boss', '49', FALSE);

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--

INSERT INTO gifts (gift, giver, value, previously_regifted) VALUES ('car', 'Dad', '10000', TRUE), ('shoes', 'Mom', '119', TRUE), ('cook book', 'Sister', '99', FALSE),('giftcard', 'Uncle', '70', TRUE),('dragonfruit candle', 'Bestfriend', '50', FALSE);


--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM gifts WHERE value >= 20;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT * FROM gifts WHERE gift LIKE '%candle%';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM gifts WHERE giver = 'Santa' OR value > 30;

--
\echo Query for every gift whose giver is NOT Santa
--

SELECT * FROM gifts WHERE giver != 'Santa'

--
\echo Update the second gift to have a value of 2999
-- 

UPDATE gifts SET value = 2999 WHERE id = 2;

--
\echo Query for the updated item
--
SELECT * FROM gifts;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING value, gift;

--
\echo Query for all the columns in your gifts table one more time
--
SELECT * FROM gifts;


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(*) FROM gifts WHERE gift LIKE '%candle%';

--
\echo Get the AVEREAGE value from all the gifts
--
SELECT AVG(value) FROM gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT * FROM gifts ORDER BY value DESC LIMIT 3 OFFSET 2;
--
-- finish
--
DROP TABLE IF EXISTS gifts;
