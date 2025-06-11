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






/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


