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


-- Note: team_id set to NULL initially for captain entries to resolve circular FK dependencies
-- Carnival 1: 22/SEP/2024 (Event IDs 1 & 2)
-- Event 1 (5K) entries
INSERT INTO entry VALUES (1, 1, TO_DATE('22/SEP/2024 09:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('22/SEP/2024 10:05:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:35:00','HH24:MI:SS'), 1, NULL, 1);
INSERT INTO entry VALUES (1, 2, TO_DATE('22/SEP/2024 09:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('22/SEP/2024 10:07:30','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:37:30','HH24:MI:SS'), 2, NULL, 2);
INSERT INTO entry VALUES (1, 3, TO_DATE('22/SEP/2024 09:30:00','DD/MON/YYYY HH24:MI:SS'), NULL, NULL, 3, NULL, 3); -- Unfinished
INSERT INTO entry VALUES (1, 4, TO_DATE('22/SEP/2024 09:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('22/SEP/2024 09:58:10','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:28:10','HH24:MI:SS'), 7, NULL, 1);
INSERT INTO entry VALUES (1, 5, TO_DATE('22/SEP/2024 09:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('22/SEP/2024 10:15:20','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:45:20','HH24:MI:SS'), 8, NULL, 2);
INSERT INTO entry VALUES (1, 6, TO_DATE('22/SEP/2024 09:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('22/SEP/2024 10:01:40','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:31:40','HH24:MI:SS'), 9, NULL, 3);


-- Event 2 (10K) entries
INSERT INTO entry VALUES (2, 1, TO_DATE('22/SEP/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('22/SEP/2024 09:25:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:55:00','HH24:MI:SS'), 1, NULL, 2);
INSERT INTO entry VALUES (2, 2, TO_DATE('22/SEP/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('22/SEP/2024 09:20:45','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:50:45','HH24:MI:SS'), 4, NULL, 1);
INSERT INTO entry VALUES (2, 3, TO_DATE('22/SEP/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('22/SEP/2024 09:12:30','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:42:30','HH24:MI:SS'), 5, NULL, 2);
INSERT INTO entry VALUES (2, 4, TO_DATE('22/SEP/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('22/SEP/2024 09:35:15','DD/MON/YYYY HH24:MI:SS'), TO_DATE('01:05:15','HH24:MI:SS'), 9, NULL, 1);
INSERT INTO entry VALUES (2, 5, TO_DATE('22/SEP/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), NULL, NULL, 10, NULL, 3); -- Unfinished


-- Carnival 2: 05/OCT/2024 (Event IDs 3 & 4 & 5)
-- Event 3 (5K) entries
INSERT INTO entry VALUES (3, 1, TO_DATE('05/OCT/2024 09:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:33:20','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:33:20','HH24:MI:SS'), 2, NULL, 2);
INSERT INTO entry VALUES (3, 2, TO_DATE('05/OCT/2024 09:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:37:10','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:37:10','HH24:MI:SS'), 3, NULL, 1);
INSERT INTO entry VALUES (3, 3, TO_DATE('05/OCT/2024 09:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:45:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:45:00','HH24:MI:SS'), 4, NULL, 3);
INSERT INTO entry VALUES (3, 4, TO_DATE('05/OCT/2024 09:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:40:30','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:40:30','HH24:MI:SS'), 11, NULL, 2);
INSERT INTO entry VALUES (3, 5, TO_DATE('05/OCT/2024 09:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:48:25','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:48:25','HH24:MI:SS'), 7, NULL, 1);
INSERT INTO entry VALUES (3, 6, TO_DATE('05/OCT/2024 09:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:38:50','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:38:50','HH24:MI:SS'), 12, NULL, 2);


-- Event 4 (10K) entries
INSERT INTO entry VALUES (4, 1, TO_DATE('05/OCT/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:21:45','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:51:45','HH24:MI:SS'), 2, NULL, 2);
INSERT INTO entry VALUES (4, 2, TO_DATE('05/OCT/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:18:35','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:48:35','HH24:MI:SS'), 3, NULL, 1);
INSERT INTO entry VALUES (4, 3, TO_DATE('05/OCT/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:30:20','DD/MON/YYYY HH24:MI:SS'), TO_DATE('01:00:20','HH24:MI:SS'), 4, NULL, 3);
INSERT INTO entry VALUES (4, 4, TO_DATE('05/OCT/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:40:10','DD/MON/YYYY HH24:MI:SS'), TO_DATE('01:10:10','HH24:MI:SS'), 6, NULL, 1);
INSERT INTO entry VALUES (4, 5, TO_DATE('05/OCT/2024 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 09:25:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:55:00','HH24:MI:SS'), 13, NULL, 2);


-- Event 5 (21K) entries – added to give competitors 5 and 6 a third race
INSERT INTO entry VALUES (5, 1, TO_DATE('05/OCT/2024 08:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 10:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02:00:00','HH24:MI:SS'), 5, NULL, 2);
INSERT INTO entry VALUES (5, 2, TO_DATE('05/OCT/2024 08:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('05/OCT/2024 10:05:30','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02:05:30','HH24:MI:SS'), 6, NULL, 1);


-- Carnival 3: 02/FEB/2025 (Event IDs 7 & 8)
-- Event 7 (5K) entries
INSERT INTO entry VALUES (7, 1, TO_DATE('02/FEB/2025 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02/FEB/2025 09:06:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:36:00','HH24:MI:SS'), 3, NULL, 1);
INSERT INTO entry VALUES (7, 2, TO_DATE('02/FEB/2025 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02/FEB/2025 09:02:30','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:32:30','HH24:MI:SS'), 5, NULL, 2);
INSERT INTO entry VALUES (7, 3, TO_DATE('02/FEB/2025 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02/FEB/2025 09:10:45','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:40:45','HH24:MI:SS'), 10, NULL, 3);
INSERT INTO entry VALUES (7, 4, TO_DATE('02/FEB/2025 08:30:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02/FEB/2025 09:05:15','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:35:15','HH24:MI:SS'), 14, NULL, 1);


-- Event 8 (10K) entries
INSERT INTO entry VALUES (8, 1, TO_DATE('02/FEB/2025 08:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02/FEB/2025 08:54:40','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:54:40','HH24:MI:SS'), 4, NULL, 2);
INSERT INTO entry VALUES (8, 2, TO_DATE('02/FEB/2025 08:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02/FEB/2025 08:51:55','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:51:55','HH24:MI:SS'), 11, NULL, 1);
INSERT INTO entry VALUES (8, 3, TO_DATE('02/FEB/2025 08:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02/FEB/2025 08:57:20','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:57:20','HH24:MI:SS'), 15, NULL, 2);
INSERT INTO entry VALUES (8, 4, TO_DATE('02/FEB/2025 08:00:00','DD/MON/YYYY HH24:MI:SS'), TO_DATE('02/FEB/2025 08:59:35','DD/MON/YYYY HH24:MI:SS'), TO_DATE('00:59:35','HH24:MI:SS'), 6, NULL, 3);


-- =======================================
-- TEAM
-- =======================================


-- Insert teams referencing existing captain entries
INSERT INTO team VALUES (50, 'Running Rebels', TO_DATE('22/SEP/2024','DD/MON/YYYY'), 1, 1);
INSERT INTO team VALUES (51, 'Running Rebels', TO_DATE('05/OCT/2024','DD/MON/YYYY'), 3, 1);
INSERT INTO team VALUES (52, 'Speed Demons', TO_DATE('02/FEB/2025','DD/MON/YYYY'), 7, 1);
INSERT INTO team VALUES (53, 'Marathon Masters', TO_DATE('02/FEB/2025','DD/MON/YYYY'), 8, 1);
INSERT INTO team VALUES (54, 'Fitness Friends', TO_DATE('02/FEB/2025','DD/MON/YYYY'), 8, 2);


-- Update captain entries to reflect their team membership
UPDATE entry SET team_id = 50 WHERE event_id = 1 AND entry_no = 1;
UPDATE entry SET team_id = 51 WHERE event_id = 3 AND entry_no = 1;
UPDATE entry SET team_id = 52 WHERE event_id = 7 AND entry_no = 1;
UPDATE entry SET team_id = 53 WHERE event_id = 8 AND entry_no = 1;
UPDATE entry SET team_id = 54 WHERE event_id = 8 AND entry_no = 2;


-- Add additional members to meet team size requirements (>2 members for two teams)
-- Running Rebels (Carnival 1) – add Sarah (entry 1-2) and Kevin (event 2 entry 4)
UPDATE entry SET team_id = 50 WHERE (event_id = 1 AND entry_no = 2) OR (event_id = 2 AND entry_no = 4);


-- Speed Demons – add David (event 7 entry 2) and Linda (event 7 entry 4)
UPDATE entry SET team_id = 52 WHERE (event_id = 7 AND entry_no IN (2, 4));


COMMIT;