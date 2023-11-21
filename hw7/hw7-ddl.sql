# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;


# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int not null,
    name varchar(255) not null,
    description varchar(255) not null,
    tag varchar(255) not null,
    url varchar(255),
    time_commitment int,
    primary key (skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills ( skills_id, name, description, tag) values
( 1, 'kick boxing', 'kicking and punching', 'Skill 1'),
( 2, 'python coding', 'writing python programs', 'Skills 2'),
( 3, 'cooking', 'preparing meals that taste delcious', 'Skill 3'),
( 4, 'basketball', 'dribbling, shooting, passing, and defense', 'Skill 4'),
( 5, 'carpentry', 'using tools to make furniture and decorative items', 'Skill 5'),
( 6, 'writing', 'being able to encompass storytelling using plot and character development', 'Skill 6'),
( 7, 'yoga', 'posing, breathing techniques, and meditation', 'Skill 7'),
( 8, 'rock climbing', 'climbing technqiues, knot tying, and belaying', 'Skill 8');

select * from people;

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int not null,
    first_name varchar(255),
    last_name varchar(255) not null,
    email varchar(255),
    linkedin_url varchar(255),
    headshot_url varchar(255),
    discord_handle varchar(255),
    brief_bio varchar(255),
    date_joined date not null,
    primary key(people_id)
);



# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,last_name,date_joined) values 
(1,'Person 1','2023-02-06'),
(2,'Person 2','2023-03-10'),
(3,'Person 3','2023-09-03'),
(4,'Person 4','2023-09-15'),
(5,'Person 5','2023-09-26'),
(6,'Person 6','2023-10-10');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id int not null auto_increment,
    skills_id int not null,
    people_id int not null,
    date_acquired date not null,
    primary key(id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id, skills_id, date_acquired) values
(1, 1, '2023-01-01'), (1, 1, '2023-05-25'), (1, 1, '2023-02-06'),
(2, 3, '2023-02-02'), (2, 4, '2023-02-05'), (2, 5, '2023-02-28'),
(3, 1, '2023-03-03'), (3, 5, '2023-03-10'),
(5, 3, '2023-04-04'), (5, 6, '2023-09-26'),
(6, 2, '2023-05-05'), (6, 3, '2023-09-03'), (6, 4, '2023-09-01'),
(7, 3, '2023-06-06'), (7, 5, '2023-09-15'), (7, 6, '2023-10-06'),
(8, 1, '2023-07-07'), (8, 3, '2023-11-16'), (8, 5, '2023-04-06'), (8, 6, '2023-02-06'),
(9, 2, '2023-08-08'), (9, 5, '2022-12-17'), (9, 6, '2023-10-08'),
(10, 1, '2023-09-09'), (10, 4, '2023-11-08'), (10, 5, '2023-11-01');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id int not null auto_increment,
    name varchar(255) not null,
    sort_priority int not null,
    primary key(id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (name, sort_priority) values
('Designer', 10),
('Developer', 20),
('Recruit', 30),
('Team Lead', 40),
('Boss', 50),
('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id int not null auto_increment,
    people_id int not null,
    role_id int not null,
    date_assigned date not null,
    primary key(id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id, role_id, date_assigned) values
(1, 20, '2023-01-01'),
(2, 50, '2023-02-01'), (2, 60, '2023-11-01'),
(3, 20, '2023-03-01'), (3, 40, '2023-06-02'),
(4, 30, '2023-04-01'),
(5, 30, '2023-05-01'),
(6, 20, '2023-06-01'), (6, 10, '2023-08-03'),
(7, 10, '2023-07-01'),
(8, 10, '2023-08-01'), (8, 40, '2023-10-17'),
(9, 20, '2023-09-01'),
(10, 20, '2023-10-01'), (10, 10, '2023-11-11');

