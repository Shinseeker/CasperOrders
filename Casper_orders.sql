DROP TABLE IF EXISTS orderid;
DROP TABLE IF EXISTS dateordered;
DROP TABLE IF EXISTS datereturned;
DROP TABLE IF EXISTS orderstatus;
DROP TABLE IF EXISTS orders ;

CREATE TABLE orders(
  orderid varchar(4) PRIMARY KEY,
  dateordered varchar(30) NOT NULL,
  datereturned varchar(30) NOT NULL,
  orderstatus varchar(30) NOT NULL,
  orders varchar(30) NOT NULL
  );

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/takehome.csv' 
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Select statement to see if the data is in there.

select * 
from orders;

-- the total of num, max orders, and min orders of the table orders.
SELECT
COUNT(orders) as Numorders,
MAX(orders) AS Maxorders,
MIN(orders) AS Minorders
FROM orders;

-- The Monthly order for September 2014 is 288 while the monthly return is 87

SELECT
SUM(dateordered) as Monthlyorders,
SUM(datereturned) as Monthlyhreturns
FROM orders
WHERE dateordered BETWEEN '9/1/2014' and '9/30/2014';

-- The monthly order for october 2014 is 300  and the monthly return is 58.

SELECT
SUM(dateordered) as Monthoder,
SUM(datereturned) as Monthreturns
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/orders&returns2.xls'
FROM orders
WHERE dateordered BETWEEN '10/1/2014' and '10/30/2014';



