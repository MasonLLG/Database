🌊 Ocean Odyssey Database Project
📌 Project Overview

Ocean Odyssey is a global cruise booking company. They need a database system to manage:

Operators and their ships

Ship cabins and cabin classes

Cruises (schedule, ship, itinerary)

Passengers and guardians

Bookings and manifests

This project covers the full database lifecycle:

Conceptual modelling (ERD)

Data normalisation

Logical modelling in Oracle Data Modeler

Database schema + implementation in Oracle

📂 Deliverables

All deliverables live in this repo (and must be pushed with history to GitLab).

Deliverable	File	Tool/Notes
Conceptual ERD	oo_conceptual.pdf	LucidChart, crow’s foot, A4 portrait
Normalisation steps	oo_normalisation.pdf	Word/Pages/Google Doc → export PDF
Logical model (PDF)	oo_logical.pdf	Oracle Data Modeler
Data Modeler project	oo_model.zip	Must include .dmd + folder
Database schema	oo_schema.sql	Auto-generated from Data Modeler
Schema run output	oo_schema_output.txt	Captured with SPOOL in Oracle
Assumptions doc	oo_assumptions.pdf	State assumptions (or “No assumptions made”)
🛠️ Workflow

Conceptual Design

Build ERD in LucidChart.

Identify entities, attributes, and relationships.

No surrogate keys at this stage.

Commit regularly (oo_conceptual.pdf).

Normalisation

Take one sample itinerary form.

Show UNF → 1NF → 2NF → 3NF.

Document keys + dependencies.

Export as oo_normalisation.pdf.

Logical Model

Use Oracle Data Modeler.

Add surrogate key(s) where justified.

Create lookup table for cabin classes.

Export to oo_logical.pdf.

Save full project as oo_model.zip.

Schema & Test

Generate schema from logical model → oo_schema.sql.

Run in Oracle, capture output → oo_schema_output.txt.

Include attribute comments and drop table statements.

Assumptions

Document assumptions in oo_assumptions.pdf.

📊 Repo Standards

Push to GitLab regularly with meaningful commit messages.

Minimum history:

Conceptual model → 3 commits

Normalisation → 3 commits

Logical model → 6 commits

Use correct author details.

🚀 How to Run

Open oo_model.zip in Oracle Data Modeler.

Engineer to relational model.

Generate schema → save as oo_schema.sql.

Run schema in Oracle SQL*Plus or SQL Developer.

Confirm tables created via oo_schema_output.txt.

✅ Project Checklist

 ERD created (oo_conceptual.pdf)

 Normalisation completed (oo_normalisation.pdf)

 Logical model done (oo_logical.pdf)

 Data Modeler project zipped (oo_model.zip)

 Schema generated (oo_schema.sql)

 Schema tested + output captured (oo_schema_output.txt)

 Assumptions documented (oo_assumptions.pdf)

 All files pushed with history to GitLab
