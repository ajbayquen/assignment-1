drop table if exists EMPLOYEES;


CREATE TABLE EMPLOYEES (
ID INT PRIMARY KEY,
NAME VARCHAR(100),
TITLE VARCHAR(100),
MANAGER_ID INT,
INDEX (MANAGER_ID),
FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(ID)
);

INSERT INTO EMPLOYEES VALUES
(1, "Steve Jobs", "CEO", NULL),
(2, "Tim Cook", "COO", 1),
(21, "Bob Mansfield", "SVP Engineering", 2),
(22, "Jeffrey Williams", "SVP Operations", 2),
(3, "Peter Oppenheimer", "CFO", 1),
(31, "Betsy Rafael", "VP Comptroller", 3),
(32, "Gary Wipfler", "VP Treasurer", 3),
(4, "Philip Schiller", "SVP - Marketing", 1),
(41, "David Moody", "VP - Mac Marketing", 4),
(42, "Ron Okamoto", "VP - Developer Relations", 4),
(43, "Greg Josviak", "VP - Iphone Marketing", 4),
(5, "Ronald Johnson", "SVP - Retail",  1),
(51, "Jeffrey McDougal", "VP - Retial", 5),
(6, "Jonathan Ive", "SVP - Industrial Desgin", 1);

SELECT M.NAME AS 'Manager', E.NAME AS 'Direct Report' 
FROM EMPLOYEES E
LEFT JOIN 
    EMPLOYEES M ON M.ID = E.MANAGER_ID
ORDER BY E.ID;



