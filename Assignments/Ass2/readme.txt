🏃 Run Monash Database Project
📌 Project Overview

Run Monash (RM) is a seasonal running carnival hosted at Monash campuses. Each carnival runs on a single date, with multiple running events (marathon, half marathon, 10km, etc.).
The database system needs to support:

Competitors (unique ID, contact details, uni status)

Carnivals (season, campus, year)

Events (within carnivals)

Entries (registration, start/finish/elapsed times)

Teams (per carnival, with leader and members)

Charities (supported by entrants)

This project delivers the full database lifecycle:

Schema completion (DDL)

Data population

Transaction management (DML)

Live database modifications

Reporting queries

JSON/MongoDB integration

📂 Deliverables

Seven standalone scripts must exist in the repo and be submitted to Moodle:

File	Purpose
T1-rm-schema.sql	Define missing tables + constraints
T2-rm-insert.sql	Insert sample competitors, entries, teams
T3-rm-dm.sql	Transactions: insert, update, delete
T4-rm-mods.sql	Structural changes (new columns/tables)
T5-rm-select.sql	Reporting queries
T6-rm-json.sql	Export JSON team documents from Oracle
T6-rm-mongo.mongodb.js	MongoDB operations

All files must be pushed to GitLab with a clear history (≥14 pushes, at least 2 per file).

🛠️ Development Workflow
1. Setup

Extract ass2_student.zip into /Assignments/Ass2.

Run rm-schema-insert.sql (provided) to create the base schema.

2. Schema (Task 1 – 15 marks)

Hand-code the missing COMPETITOR, ENTRY, TEAM tables.

Use correct names, order, types.

Add PKs + constraints.

3. Populate Data (Task 2 – 20 marks)

Insert at least:

15 competitors (5 Monash, 5 non-Monash).

30 entries (across ≥6 events, 3 carnivals).

5 teams (with reused names across carnivals).

All inserts in one transaction.

Hardcode PKs < 100 (no sequences here).

4. Transactions (Task 3 – 15 marks)

Implement sequences for COMPETITOR + TEAM (start 100, step 5).

Handle competitor/team creation, charity assignment, event changes, withdrawals.

Must commit/rollback as a single unit per scenario.

5. Modifications (Task 4 – 10 marks)

Add column for completed events.

Support multiple charities with percentages.

Keep existing data intact.

6. Reporting Queries (Task 5 – 20 marks)

Write queries for:

Most popular team names.

Record holders per event.

Carnival entry distributions.

Must match required output format.

7. JSON + MongoDB (Task 6 – 15 marks)

Generate JSON docs of teams + members.

Import into MongoDB.

Write queries to:

List 5km/10km team participation.

Create “The Great Runners” team and add members.

📊 Repo Guidelines

Use ANSI joins, no manual PK lookups.

Handle dates with TO_DATE / TO_CHAR.

No PL/SQL, no WITH, no VIEWS.

No SPOOL or ECHO commands in final scripts.

Each script must run cleanly as a batch (except DROP errors).

Commit messages must be meaningful.

🚀 Running the Project

Run rm-schema-insert.sql.

Execute T1-rm-schema.sql → T2-rm-insert.sql → T3-rm-dm.sql.

Apply T4-rm-mods.sql for structural changes.

Run T5-rm-select.sql for reporting queries.

Export JSON via T6-rm-json.sql.

Load JSON into MongoDB and run T6-rm-mongo.mongodb.js.
