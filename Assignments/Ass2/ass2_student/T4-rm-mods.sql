--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-mods.sql

--Student ID:34274723
--Student Name:Jichao Liang

/* Comments for your marker:




*/

--(a)
SAVEPOINT before_add_column;

ALTER TABLE competitor ADD comp_completed_events NUMBER(3);

COMMENT ON COLUMN competitor.comp_completed_events IS 'Number of completed events for the competitor (finish time is not null)';

UPDATE competitor 
SET comp_completed_events = (
    SELECT COUNT(*)
    FROM entry
    WHERE entry.comp_no = competitor.comp_no
    AND entry.entry_finishtime IS NOT NULL
);

DESC competitor;

SELECT comp_no, comp_fname, comp_lname, comp_completed_events
FROM competitor
ORDER BY comp_no;

COMMIT;

--(b)



