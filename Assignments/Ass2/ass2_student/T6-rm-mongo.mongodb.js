// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-rm-mongo.mongodb.js

// Student ID:34274723
// Student Name:Jichao Liang

// Comments for your marker:

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("jlia0084");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.run_monash_teams.drop();

// Create collection and insert documents
db.run_monash_teams.insertMany([
    {"_id":50,"carn_name":"RM Spring Series Clayton 2024","carn_date":"22-Sep-2024","team_name":"Running Rebels","team_leader":{"name":"John Smith","phone":"0410000001","email":"john.smith@monash.edu"},"team_no_of_members":3,"team_members":[{"competitor_name":"John Smith","competitor_phone":"0410000001","event_type":"5 Km Run","entry_no":1,"starttime":"09:30:00","finishtime":"10:05:00","elapsedtime":"00:35:00"},{"competitor_name":"Sarah Johnson","competitor_phone":"0410000002","event_type":"5 Km Run","entry_no":2,"starttime":"09:30:00","finishtime":"10:07:30","elapsedtime":"00:37:30"},{"competitor_name":"Kevin Lee","competitor_phone":"0420000009","event_type":"5 Km Run","entry_no":4,"starttime":"08:30:00","finishtime":"09:35:15","elapsedtime":"01:05:15"}]},
    {"_id":51,"carn_name":"RM Spring Series Caulfield 2024","carn_date":"05-Oct-2024","team_name":"Running Rebels","team_leader":{"name":"Sarah Johnson","phone":"0410000002","email":"sarah.johnson@monash.edu"},"team_no_of_members":1,"team_members":[{"competitor_name":"Sarah Johnson","competitor_phone":"0410000002","event_type":"5 Km Run","entry_no":1,"starttime":"09:00:00","finishtime":"09:33:20","elapsedtime":"00:33:20"}]},
    {"_id":52,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"Speed Demons","team_leader":{"name":"Michael Brown","phone":"0410000003","email":"michael.brown@monash.edu"},"team_no_of_members":3,"team_members":[{"competitor_name":"Michael Brown","competitor_phone":"0410000003","event_type":"5 Km Run","entry_no":1,"starttime":"08:30:00","finishtime":"09:06:00","elapsedtime":"00:36:00"},{"competitor_name":"David Wilson","competitor_phone":"0410000005","event_type":"5 Km Run","entry_no":2,"starttime":"08:30:00","finishtime":"09:02:30","elapsedtime":"00:32:30"},{"competitor_name":"Linda Scott","competitor_phone":"0410000014","event_type":"5 Km Run","entry_no":4,"starttime":"08:30:00","finishtime":"09:05:15","elapsedtime":"00:35:15"}]},
    {"_id":53,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"Marathon Masters","team_leader":{"name":"Emily Davis","phone":"0410000004","email":"emily.davis@monash.edu"},"team_no_of_members":1,"team_members":[{"competitor_name":"Emily Davis","competitor_phone":"0410000004","event_type":"10 Km Run","entry_no":1,"starttime":"08:00:00","finishtime":"08:54:40","elapsedtime":"00:54:40"}]},
    {"_id":54,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"Fitness Friends","team_leader":{"name":"Robert Harris","phone":"0420000011","email":"robert.harris@gmail.com"},"team_no_of_members":1,"team_members":[{"competitor_name":"Robert Harris","competitor_phone":"0420000011","event_type":"10 Km Run","entry_no":2,"starttime":"08:00:00","finishtime":"08:51:55","elapsedtime":"00:51:55"}]}
]);

// List all documents you added
db.run_monash_teams.find();



// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

db.run_monash_teams.find(
    {
        $or: [
            {"team_members.event_type": "5 Km Run"},
            {"team_members.event_type": "10 Km Run"}
        ]
    },
    {
        _id: 0,
        carn_date: 1,
        carn_name: 1,
        "team_members.competitor_name": 1,
        "team_members.competitor_phone": 1,
        "team_members.event_type": 1
    }
);





// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer


// (i) Add new team
db.run_monash_teams.insertOne({
    "_id": 55,
    "carn_name": "RM Winter Series Caulfield 2025",
    "carn_date": "29-Jun-2025",
    "team_name": "The Great Runners",
    "team_leader": {
        "name": "Jackson Bull",
        "phone": "0422412524",
        "email": "jackson.bull@example.com"
    },
    "team_no_of_members": 1,
    "team_members": [
        {
            "competitor_name": "Jackson Bull",
            "competitor_phone": "0422412524",
            "event_type": "5 Km Run",
            "entry_no": 1,
            "starttime": "-",
            "finishtime": "-",
            "elapsedtime": "-"
        }
    ]
});

// Illustrate/confirm changes made
db.run_monash_teams.find(
    {"team_name": "The Great Runners"},
    {_id: 0}
);

// (ii) Add new team member
db.run_monash_teams.updateOne(
    {"team_name": "The Great Runners"},
    {
        $push: {
            "team_members": {
                "competitor_name": "Steve Bull",
                "competitor_phone": "0422251427",
                "event_type": "10 Km Run",
                "entry_no": 2,
                "starttime": "-",
                "finishtime": "-",
                "elapsedtime": "-"
            }
        },
        $set: {"team_no_of_members": 2}
    }
);

// Illustrate/confirm changes made
db.run_monash_teams.find(
    {"team_name": "The Great Runners"},
    {_id: 0}
);


