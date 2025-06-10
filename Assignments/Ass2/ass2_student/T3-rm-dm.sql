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
-- Transaction 1: Add both competitors
INSERT INTO competitor (comp_no, comp_fname, comp_lname, comp_gender, comp_dob, comp_phone, comp_email, comp_unistatus)
VALUES (comp_no_seq.NEXTVAL, 'Keith', 'Rose', 'M', TO_DATE('15/JAN/1995','DD/MON/YYYY'), '0422141112', 'keith.rose@monash.edu', 'Y');

INSERT INTO competitor (comp_no, comp_fname, comp_lname, comp_gender, comp_dob, comp_phone, comp_email, comp_unistatus)
VALUES (comp_no_seq.NEXTVAL, 'Jackson', 'Bull', 'M', TO_DATE('20/MAR/1996','DD/MON/YYYY'), '0422412524', 'jackson.bull@monash.edu', 'Y');

COMMIT;

-- Transaction 2: Add entries for both competitors
INSERT INTO entry (event_id, entry_no, comp_no, char_id)
SELECT ev.event_id,
       (SELECT NVL(MAX(entry_no),0)+1 FROM entry WHERE event_id = ev.event_id) AS next_entry_no,
       comp.comp_no,
       ch.char_id
FROM event        ev
JOIN carnival     c  ON ev.carn_date = c.carn_date
JOIN eventtype    et ON ev.eventtype_code = et.eventtype_code
JOIN competitor   comp ON comp.comp_fname = 'Keith' AND comp.comp_lname = 'Rose'
JOIN charity      ch   ON ch.char_name  = 'Salvation Army'
WHERE UPPER(c.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
  AND UPPER(et.eventtype_desc) = UPPER('10 km run');
 
INSERT INTO entry (event_id, entry_no, comp_no, char_id)
SELECT ev.event_id,
       (SELECT NVL(MAX(entry_no),0)+1 FROM entry WHERE event_id = ev.event_id) AS next_entry_no,
       comp.comp_no,
       ch.char_id
FROM event        ev
JOIN carnival     c  ON ev.carn_date = c.carn_date
JOIN eventtype    et ON ev.eventtype_code = et.eventtype_code
JOIN competitor   comp ON comp.comp_fname = 'Jackson' AND comp.comp_lname = 'Bull'
JOIN charity      ch   ON ch.char_name  = 'RSPCA'
WHERE UPPER(c.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
  AND UPPER(et.eventtype_desc) = UPPER('10 km run');

COMMIT;

-- Transaction 3: Create team and assign members
INSERT INTO team (team_id, team_name, carn_date, event_id, entry_no)
SELECT team_id_seq.NEXTVAL,
       'Super Runners',
       ev.carn_date,
       ev.event_id,
       e.entry_no
FROM event ev
JOIN carnival c ON ev.carn_date = c.carn_date
JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
JOIN entry e     ON e.event_id = ev.event_id
JOIN competitor comp ON comp.comp_no = e.comp_no
WHERE UPPER(c.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
  AND UPPER(et.eventtype_desc) = UPPER('10 km run')
  AND comp.comp_fname = 'Keith'
  AND comp.comp_lname = 'Rose';

UPDATE entry SET team_id = (SELECT team_id FROM team WHERE team_name='Super Runners' AND carn_date=(SELECT carn_date FROM carnival WHERE carn_name='RM Winter Series Caulfield 2025'))
WHERE comp_no IN (SELECT comp_no FROM competitor WHERE (comp_fname='Keith' AND comp_lname='Rose') OR (comp_fname='Jackson' AND comp_lname='Bull'));

COMMIT;

--(c)
-- Transaction 4: Jackson downgrades to 5 Km and changes charity
UPDATE entry
SET    event_id  = (SELECT ev5.event_id
                    FROM event ev5
                    JOIN carnival c5 ON ev5.carn_date = c5.carn_date
                    JOIN eventtype et5 ON ev5.eventtype_code = et5.eventtype_code
                    WHERE UPPER(c5.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
                      AND REPLACE(UPPER(et5.eventtype_desc), ' ', '') = REPLACE(UPPER('5km run'), ' ', '')),
       entry_no  = (SELECT NVL(MAX(e2.entry_no),0)+1
                    FROM entry e2
                    WHERE e2.event_id = (SELECT ev6.event_id
                                        FROM event ev6
                                        JOIN carnival c6 ON ev6.carn_date = c6.carn_date
                                        JOIN eventtype et6 ON ev6.eventtype_code = et6.eventtype_code
                                        WHERE UPPER(c6.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
                                          AND REPLACE(UPPER(et6.eventtype_desc), ' ', '') = REPLACE(UPPER('5km run'), ' ', ''))),
       char_id   = (SELECT char_id FROM charity WHERE char_name = 'Beyond Blue'),
       team_id = (SELECT team_id FROM team WHERE team_name = 'Super Runners')
WHERE  comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Jackson' AND comp_lname = 'Bull')
  AND  event_id = (SELECT ev10.event_id
                   FROM event ev10
                   JOIN carnival c10 ON ev10.carn_date = c10.carn_date
                   JOIN eventtype et10 ON ev10.eventtype_code = et10.eventtype_code
                   WHERE UPPER(c10.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
                     AND REPLACE(UPPER(et10.eventtype_desc), ' ', '') = REPLACE(UPPER('10 km run'), ' ', ''));

COMMIT;

--(d)



