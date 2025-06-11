/*

   Assignment 2 Test SCRIPT

   Copy this script into the folder holding your Assignment 2 files
   2nd June 2025
   Authors: L Smith, D Rahayu

*/

set pagesize 200
set linesize 600
set SQLBLANKLINES on
set DEFINE off

spool ass2_run_test.txt

set echo on
--========================== START RUN =====================================---
-- Running rm-schema-insert.sql
set echo off
spool off
@rm-schema-insert.sql
spool ass2_run_test.txt append;

set echo on
------------- Task 1 Create Tables -----------------------------------------
@T1-rm-schema.sql

------------- COMPETITOR ------------------------------------------
describe COMPETITOR
------------- ENTRY --------------------------------------------
describe ENTRY
------------- TEAM --------------------------------------------
describe TEAM

------------- Task 2 Load Student Data  -------------------------------------
@T2-rm-insert.sql

---------------------- Task 3 DML -----------------------------------------
@T3-rm-dm.sql

------------- Task 4 ALTER ------------------------------------------------
@T4-rm-mods.sql

------------- Task 5 SQL SELECT --------------------------------------------
@T5-rm-select.sql

------------- Task 6 MongoDB (a) --------------------------------------------
@T6-rm-json.sql

--============================== END RUN ======================================---
set echo off
spool off