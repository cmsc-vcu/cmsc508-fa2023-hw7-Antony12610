## Company Resume Database


This project aims to create a database capturing employee skills, certifications, and roles within our company. The database schema comprises tables for skills, people, roles, and their associations, allowing us to manage our team's expertise effectively.

Key Components

Skills: Descriptive information about various skills and certifications.
People: Employee details, including contact info and join dates.
Roles: Different positions within the company, sorted by priority.
People Skills: Links between skills and employees with acquisition dates.
People Roles: Associations between employees and their roles with assignment dates.
Repository Contents

DDL SQL File (hw7-ddl.sql): Contains instructions to create and populate the database tables.
Quarto-Generated HTML Document: Includes an overview, entity diagrams, entity table listings, and query-based reports.
Setup Steps

Clone the repository and set up the Python environment using poetry install.
Configure environment variables in the .env file.
Execute the DDL.SQL file against a new DB connection.