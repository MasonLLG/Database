/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T1-rm-schema.sql

--Student ID:34274723
--Student Name:Jichao Liang

/* Comments for your marker:




*/

/* drop table statements - do not remove*/

DROP TABLE competitor CASCADE CONSTRAINTS PURGE;

DROP TABLE entry CASCADE CONSTRAINTS PURGE;

DROP TABLE team CASCADE CONSTRAINTS PURGE;

/* end of drop table statements*/

-- Task 1 Add Create table statements for the Missing TABLES below.
-- Ensure all column comments, and constraints (other than FK's)are included.
-- FK constraints are to be added at the end of this script

-- COMPETITOR
CREATE TABLE competitor (
    comp_no         NUMBER(5) NOT NULL,
    comp_fname      VARCHAR2(30) ,
    comp_lname      VARCHAR2(30) ,
    comp_gender     CHAR(1) NOT NULL,
    comp_dob        DATE NOT NULL,
    comp_email      VARCHAR2(50) NOT NULL,
    comp_unistatus  CHAR(1) NOT NULL,
    comp_phone      CHAR(10) NOT NULL,
    CONSTRAINT pk_competitor PRIMARY KEY (comp_no),
    CONSTRAINT uq_comp_email UNIQUE (comp_email),
    CONSTRAINT uq_comp_phone UNIQUE (comp_phone),
    CONSTRAINT chk_competitor_gender CHECK (comp_gender IN ('M', 'F', 'U')),
    CONSTRAINT chk_competitor_unistatus CHECK (comp_unistatus IN ('Y', 'N'))
);

COMMENT ON COLUMN competitor.comp_no IS 'Competitor number - primary key';
COMMENT ON COLUMN competitor.comp_fname IS 'Competitor first name';
COMMENT ON COLUMN competitor.comp_lname IS 'Competitor last name';
COMMENT ON COLUMN competitor.comp_gender IS 'Competitor gender (M=Male, F=Female, U=Undisclosed)';
COMMENT ON COLUMN competitor.comp_dob IS 'Competitor date of birth';
COMMENT ON COLUMN competitor.comp_email IS 'Competitor email address - must be unique';
COMMENT ON COLUMN competitor.comp_unistatus IS 'University status (Y=Yes, N=No)';
COMMENT ON COLUMN competitor.comp_phone IS 'Competitor phone number - must be unique';

--ENTRY
CREATE TABLE entry (
    event_id            NUMBER(6) NOT NULL,
    entry_no            NUMBER(5) NOT NULL,
    entry_starttime     DATE,
    entry_finishtime    DATE,
    entry_elapsedtime   DATE,
    comp_no             NUMBER(5) NOT NULL,
    team_id             NUMBER(3),
    char_id             NUMBER(3),
    CONSTRAINT pk_entry PRIMARY KEY (event_id, entry_no)
);

COMMENT ON COLUMN entry.event_id IS 'Event identifier - foreign key to event table';
COMMENT ON COLUMN entry.entry_no IS 'Entry number - unique within an event';
COMMENT ON COLUMN entry.entry_starttime IS 'Entry start time in HH24:MI:SS format';
COMMENT ON COLUMN entry.entry_finishtime IS 'Entry finish time in HH24:MI:SS format';
COMMENT ON COLUMN entry.entry_elapsedtime IS 'Entry elapsed time in HH24:MI:SS format';
COMMENT ON COLUMN entry.comp_no IS 'Competitor number - foreign key to competitor table';
COMMENT ON COLUMN entry.team_id IS 'Team identifier - foreign key to team table ';
COMMENT ON COLUMN entry.char_id IS 'Charity identifier - foreign key to charity table';


--TEAM
CREATE TABLE team (
    team_id     NUMBER(3) NOT NULL,
    team_name   VARCHAR2(30) NOT NULL,
    carn_date   DATE NOT NULL,
    event_id    NUMBER(6) NOT NULL,
    entry_no    NUMBER(5) NOT NULL,
    CONSTRAINT pk_team PRIMARY KEY (team_id),
    CONSTRAINT uq_team_name_carn UNIQUE (team_name, carn_date)
);

COMMENT ON COLUMN team.team_id IS 'Team identifier - primary key';
COMMENT ON COLUMN team.team_name IS 'Team name';
COMMENT ON COLUMN team.carn_date IS 'Carnival Date';

-- Add all missing FK Constraints below here
--ENTRY
ALTER TABLE entry ADD CONSTRAINT event_entry_fk FOREIGN KEY (event_id) REFERENCES event (event_id);

ALTER TABLE entry ADD CONSTRAINT competitor_entry_fk FOREIGN KEY (comp_no) REFERENCES competitor (comp_no);

ALTER TABLE entry ADD CONSTRAINT team_entry_fk FOREIGN KEY (team_id) REFERENCES team (team_id);

ALTER TABLE entry ADD CONSTRAINT charity_entry_fk FOREIGN KEY (char_id) REFERENCES charity (char_id);

--TEAM
ALTER TABLE team ADD CONSTRAINT carnival_team_fk FOREIGN KEY (carn_date) REFERENCES carnival (carn_date);

ALTER TABLE team ADD CONSTRAINT entry_team_fk FOREIGN KEY (event_id, entry_no) REFERENCES entry (event_id, entry_no);