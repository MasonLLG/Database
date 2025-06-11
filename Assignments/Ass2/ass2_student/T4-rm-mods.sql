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
SAVEPOINT before_charity_changes;

CREATE TABLE entry_charity (
    event_id     NUMBER(6) NOT NULL,
    entry_no     NUMBER(5) NOT NULL,
    char_id      NUMBER(3) NOT NULL,
    percentage   NUMBER(3) NOT NULL,
    CONSTRAINT pk_entry_charity PRIMARY KEY (event_id, entry_no, char_id),
    CONSTRAINT fk_entry_charity_entry FOREIGN KEY (event_id, entry_no) REFERENCES entry (event_id, entry_no),
    CONSTRAINT fk_entry_charity_charity FOREIGN KEY (char_id) REFERENCES charity (char_id),
    CONSTRAINT chk_percentage_range CHECK (percentage >= 0 AND percentage <= 100)
);

COMMENT ON COLUMN entry_charity.event_id IS 'Event identifier - part of composite foreign key to entry table';
COMMENT ON COLUMN entry_charity.entry_no IS 'Entry number - part of composite foreign key to entry table';
COMMENT ON COLUMN entry_charity.char_id IS 'Charity identifier - foreign key to charity table';
COMMENT ON COLUMN entry_charity.percentage IS 'Percentage of funds (0-100) to be donated to this charity';

INSERT INTO entry_charity (event_id, entry_no, char_id, percentage)
SELECT event_id, entry_no, char_id, 100
FROM entry
WHERE char_id IS NOT NULL;

ALTER TABLE entry DROP CONSTRAINT charity_entry_fk;
ALTER TABLE entry DROP COLUMN char_id;

DESC entry;
DESC entry_charity;

SELECT ec.event_id, ec.entry_no, c.comp_fname, c.comp_lname, ch.char_name, ec.percentage
FROM entry_charity ec
JOIN entry e ON ec.event_id = e.event_id AND ec.entry_no = e.entry_no
JOIN competitor c ON e.comp_no = c.comp_no
JOIN charity ch ON ec.char_id = ch.char_id
ORDER BY ec.event_id, ec.entry_no, ch.char_name;

COMMIT;



