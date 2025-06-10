/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-rm-insert.sql

--Student ID:34274723
--Student Name:Jichao Liang

/* Comments for your marker:




*/

-- Task 2 Load the COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- COMPETITOR
-- =======================================

-- Monash students/staff (comp_unistatus = 'Y')
INSERT INTO competitor VALUES (1, 'John', 'Smith', 'M', TO_DATE('15/MAR/1995','DD/MON/YYYY'), 'john.smith@monash.edu', 'Y', '0410000001');
INSERT INTO competitor VALUES (2, 'Sarah', 'Johnson', 'F', TO_DATE('22/JUL/1994','DD/MON/YYYY'), 'sarah.johnson@monash.edu', 'Y', '0410000002');
INSERT INTO competitor VALUES (3, 'Michael', 'Brown', 'M', TO_DATE('03/NOV/1996','DD/MON/YYYY'), 'michael.brown@monash.edu', 'Y', '0410000003');
INSERT INTO competitor VALUES (4, 'Emily', 'Davis', 'F', TO_DATE('18/FEB/1993','DD/MON/YYYY'), 'emily.davis@monash.edu', 'Y', '0410000004');
INSERT INTO competitor VALUES (5, 'David', 'Wilson', 'M', TO_DATE('07/AUG/1995','DD/MON/YYYY'), 'david.wilson@monash.edu', 'Y', '0410000005');
INSERT INTO competitor VALUES (6, 'Jessica', 'Taylor', 'F', TO_DATE('14/DEC/1994','DD/MON/YYYY'), 'jessica.taylor@monash.edu', 'Y', '0410000006');
INSERT INTO competitor VALUES (14, 'Linda', 'Scott', 'F', TO_DATE('09/JAN/1993','DD/MON/YYYY'), 'linda.scott@monash.edu', 'Y', '0410000014');

-- Non-Monash competitors (comp_unistatus = 'N')
INSERT INTO competitor VALUES (7, 'James', 'Martin', 'M', TO_DATE('25/JAN/1992','DD/MON/YYYY'), 'james.martin@gmail.com', 'N', '0420000007');
INSERT INTO competitor VALUES (8, 'Rebecca', 'White', 'F', TO_DATE('08/APR/1997','DD/MON/YYYY'), 'rebecca.white@yahoo.com', 'N', '0420000008');
INSERT INTO competitor VALUES (9, 'Kevin', 'Lee', 'M', TO_DATE('16/OCT/1991','DD/MON/YYYY'), 'kevin.lee@hotmail.com', 'N', '0420000009');
INSERT INTO competitor VALUES (10, 'Amanda', 'Clark', 'F', TO_DATE('02/MAY/1998','DD/MON/YYYY'), 'amanda.clark@outlook.com', 'N', '0420000010');
INSERT INTO competitor VALUES (11, 'Robert', 'Harris', 'M', TO_DATE('19/SEP/1990','DD/MON/YYYY'), 'robert.harris@gmail.com', 'N', '0420000011');
INSERT INTO competitor VALUES (12, 'Sophie', 'Green', 'F', TO_DATE('26/JUL/1999','DD/MON/YYYY'), 'sophie.green@yahoo.com', 'N', '0420000012');
INSERT INTO competitor VALUES (13, 'Alexander', 'King', 'M', TO_DATE('13/DEC/1989','DD/MON/YYYY'), 'alex.king@hotmail.com', 'N', '0420000013');
INSERT INTO competitor VALUES (15, 'Brian', 'Young', 'M', TO_DATE('30/JUN/1988','DD/MON/YYYY'), 'brian.young@gmail.com', 'N', '0420000015');

-- =======================================
-- ENTRY
-- =======================================



-- =======================================
-- TEAM
-- =======================================

