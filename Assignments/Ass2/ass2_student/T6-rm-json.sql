/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-rm-json.sql

--Student ID:34274723
--Student Name:Jichao Liang


/* Comments for your marker:




*/


-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT JSON_OBJECT(
    '_id' VALUE t.team_id,
    'carn_name' VALUE c.carn_name,
    'carn_date' VALUE TO_CHAR(t.carn_date, 'DD-Mon-YYYY'),
    'team_name' VALUE t.team_name,
    'team_leader' VALUE JSON_OBJECT(
        'name' VALUE CASE 
            WHEN leader.comp_fname IS NULL AND leader.comp_lname IS NULL THEN '-'
            WHEN leader.comp_fname IS NULL THEN TRIM(leader.comp_lname)
            WHEN leader.comp_lname IS NULL THEN TRIM(leader.comp_fname)
            ELSE TRIM(leader.comp_fname) || ' ' || TRIM(leader.comp_lname)
        END,
        'phone' VALUE NVL(leader.comp_phone, '-'),
        'email' VALUE NVL(leader.comp_email, '-')
    ),
    'team_no_of_members' VALUE COUNT(e.entry_no),
    'team_members' VALUE JSON_ARRAYAGG(
        JSON_OBJECT(
            'competitor_name' VALUE CASE 
                WHEN comp.comp_fname IS NULL AND comp.comp_lname IS NULL THEN '-'
                WHEN comp.comp_fname IS NULL THEN TRIM(comp.comp_lname)
                WHEN comp.comp_lname IS NULL THEN TRIM(comp.comp_fname)
                ELSE TRIM(comp.comp_fname) || ' ' || TRIM(comp.comp_lname)
            END,
            'competitor_phone' VALUE NVL(comp.comp_phone, '-'),
            'event_type' VALUE et.eventtype_desc,
            'entry_no' VALUE e.entry_no,
            'starttime' VALUE NVL(TO_CHAR(e.entry_starttime, 'HH24:MI:SS'), '-'),
            'finishtime' VALUE NVL(TO_CHAR(e.entry_finishtime, 'HH24:MI:SS'), '-'),
            'elapsedtime' VALUE NVL(TO_CHAR(e.entry_elapsedtime, 'HH24:MI:SS'), '-')
        )
        ORDER BY e.entry_no
    )
) AS team_json
FROM team t
JOIN carnival c ON t.carn_date = c.carn_date
JOIN event ev ON t.event_id = ev.event_id
JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
JOIN entry e ON t.team_id = e.team_id
JOIN competitor comp ON e.comp_no = comp.comp_no
JOIN entry leader_entry ON t.event_id = leader_entry.event_id AND t.entry_no = leader_entry.entry_no
JOIN competitor leader ON leader_entry.comp_no = leader.comp_no
GROUP BY t.team_id, t.team_name, t.carn_date, c.carn_name, et.eventtype_desc, 
         leader.comp_fname, leader.comp_lname, leader.comp_phone, leader.comp_email
ORDER BY t.team_id;


