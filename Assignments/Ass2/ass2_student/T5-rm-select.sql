/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-rm-select.sql

--Student ID:34274723
--Student Name:Jichao Liang


/* Comments for your marker:




*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT team.team_name,
       team.carn_date,
       competitor.comp_fname || ' ' || competitor.comp_lname AS teamleader,
       (SELECT COUNT(*) 
        FROM entry 
        WHERE team_id = team.team_id) AS members
FROM team
JOIN entry ON team.event_id = entry.event_id AND team.entry_no = entry.entry_no
JOIN competitor ON entry.comp_no = competitor.comp_no
WHERE team.carn_date < TO_DATE('01/03/2025','DD/MM/YYYY')
AND team.team_name IN (
    SELECT team_name
    FROM team
    WHERE carn_date < TO_DATE('01/03/2025','DD/MM/YYYY')
    GROUP BY team_name
    HAVING COUNT(*) = (
        SELECT MAX(team_count)
        FROM (
            SELECT COUNT(*) as team_count
            FROM team
            WHERE carn_date < TO_DATE('01/03/2025','DD/MM/YYYY')
            GROUP BY team_name
        )
    )
)
ORDER BY team.team_name, team.carn_date;




/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT eventtype.eventtype_desc AS "Event",
       carnival.carn_name || ', ' || TO_CHAR(carnival.carn_date, 'Day') || ' ' || TO_CHAR(carnival.carn_date, 'DD/MM/YYYY') AS "Carnival",
       TO_CHAR(entry.entry_elapsedtime, 'HH24:MI:SS') AS "Record Time",
       competitor.comp_no || ' ' || competitor.comp_fname || ' ' || competitor.comp_lname AS "Competitor",
       TRUNC(MONTHS_BETWEEN(carnival.carn_date, competitor.comp_dob) / 12) AS "Age"
FROM entry
JOIN event ON entry.event_id = event.event_id
JOIN eventtype ON event.eventtype_code = eventtype.eventtype_code
JOIN competitor ON entry.comp_no = competitor.comp_no
JOIN carnival ON event.carn_date = carnival.carn_date
WHERE entry.entry_elapsedtime IS NOT NULL
AND entry.entry_elapsedtime = (
    SELECT MIN(entry.entry_elapsedtime)
    FROM entry
    JOIN event ON entry.event_id = event.event_id
    WHERE event.eventtype_code = eventtype.eventtype_code
    AND entry.entry_elapsedtime IS NOT NULL
)
ORDER BY eventtype.eventtype_desc, competitor.comp_no;





/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


