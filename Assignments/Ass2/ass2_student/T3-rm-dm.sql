--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

--Student ID:34274723
--Student Name:Jichao Liang

/* Comments for your marker:




*/ 

--(a)
DROP SEQUENCE comp_no_seq;
DROP SEQUENCE team_id_seq;

CREATE SEQUENCE comp_no_seq START WITH 100 INCREMENT BY 5 MINVALUE 100;
CREATE SEQUENCE team_id_seq START WITH 100 INCREMENT BY 5 MINVALUE 100;

COMMIT;

--(b)
-- Add competitor Keith Rose - transaction 1
INSERT INTO competitor (comp_no, comp_fname, comp_lname, comp_gender, comp_dob, comp_phone, comp_email, comp_unistatus)
VALUES (comp_no_seq.NEXTVAL, 'Keith', 'Rose', 'M', TO_DATE('15/JAN/1995','DD/MON/YYYY'), '0422141112', 'keith.rose@monash.edu', 'Y');

INSERT INTO entry (event_id, entry_no, comp_no, char_id)
VALUES (13, 1, comp_no_seq.CURRVAL, 3);  

INSERT INTO team (team_id, team_name, carn_date, event_id, entry_no)
VALUES (team_id_seq.NEXTVAL, 'Super Runners', TO_DATE('29/JUN/2025','DD/MON/YYYY'), 13, 1);

UPDATE entry 
SET team_id = team_id_seq.CURRVAL
WHERE event_id = 13 AND entry_no = 1;

COMMIT;

-- Add competitor Jackson Bull - transaction 2
INSERT INTO competitor (comp_no, comp_fname, comp_lname, comp_gender, comp_dob, comp_phone, comp_email, comp_unistatus)
VALUES (comp_no_seq.NEXTVAL, 'Jackson', 'Bull', 'M', TO_DATE('20/MAR/1996','DD/MON/YYYY'), '0422412524', 'jackson.bull@monash.edu', 'Y');

INSERT INTO entry (event_id, entry_no, comp_no, char_id)
VALUES (13, 2, comp_no_seq.CURRVAL, 1);

UPDATE entry 
SET team_id = team_id_seq.CURRVAL
WHERE event_id = 13 AND entry_no = 2;

COMMIT;

--(c)


--(d)
