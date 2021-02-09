# Chase_Hovel_P1

## Project Description
This is my solution for the guidelines given for project one. The requirements were to create and handle an enterprise style database for the distribution chain of Apple Inc
Inside this repository are the scripts to create each of the tables and procedures used within the database.

## Technologies Used
- [T-SQL]
- [Microsoft SQL Services Integration Software]
- MS SQL Server 2016
- MS SQL Server Management Studio 2018

## Features

##### List of Features
- Automatically loaded data from different sources using SSIS
- Database will update all rows and records automatically with triggers once a procedure is executed
- Normalized Database to reduce redundancy
- Indexes created via the Sql Server Traces and Trace analysis
- Views created to make information more understandable to users

##### To Do
- Removal of useless triggers and tables
- Addition of SQL Server Analysis Services and SQL Server Reporting Services
- Connecting Cities table to Countries table

## Getting Started

##### Requirements
-Visual Studio 2017
-MS SQL Server 2016
-SQL Server Integration Server
-SQL Server Management Studio 2018

##### Steps to pulling repo to a directory
1. Create a new local repository on your machine
2. Type Git Init and click enter
3. Type Git Pull and include the link below to transfer the project to your local system
   - https://github.com/210104-msbi-reston/Chase_Hovel_P1.git

##### Adding Database to SSMS
1. Open SSMS and connect to your server
2. hit (CTRL + o) to begin opening files
3. locate the repository folder
4. Starting with the tables open the files 1 by 1 and then run them
5. After all the tables have been created add procedures and triggers


## Usage
You can use the SQL procedures and views to explore the database and have a product be created, shipped down each step all the way to the customer, and then returned back upwards to the production house

## License
[Microsoft SQL Server 2016 License](https://www.microsoft.com/en-us/sql-server/sql-server-2016), [Visual Studio 2019 License](https://visualstudio.microsoft.com/vs/)
