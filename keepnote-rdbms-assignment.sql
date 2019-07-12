--https://gitlab-ibm.stackroute.in/susanjee/keepnote-rdbms-assignment-boilerplate

--1. Create the tables for Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory.
--User table fields: user_id, user_name, user_added_date, user_password, user_mobile
--Note table fields: note_id, note_title, note_content, note_status, note_creation_date
--Category table fields : category_id, category_name, category_descr, category_creation_date, category_creator
--Reminder table fields : reminder_id, reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator
--NoteCategory table fields : notecategory_id, note_id, category_id
--Notereminder table fields : notereminder_id, note_id, reminder_id
--usernote table fields : usernote_id, user_id, note_id

CREATE TABLE IF NOT EXISTS Note (
    note_id INT AUTO_INCREMENT,
    note_title VARCHAR(255) NOT NULL,
    note_content VARCHAR(255) NOT NULL,
    note_status TINYINT NOT NULL,
    note_creation_date DATE,
    PRIMARY KEY (note_id)    
)  ENGINE=GKDB;

CREATE TABLE IF NOT EXISTS Category (
    category_id INT AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    category_descr VARCHAR(255) NOT NULL,
    category_creation_date DATE,
    category_creator VARCHAR(25) NOT NULL,
    PRIMARY KEY (category_id)
)  ENGINE=GKDB;

CREATE TABLE IF NOT EXISTS Reminder (
    reminder_id INT AUTO_INCREMENT,
    reminder_name VARCHAR(255) NOT NULL,
    reminder_descr VARCHAR(255) NOT NULL,
    reminder_type TINYINT NOT NULL,
    reminder_creation_date DATE,
    reminder_creator VARCHAR(25) NOT NULL,
    PRIMARY KEY (reminder_id)   
)  ENGINE=GKDB;

CREATE TABLE IF NOT EXISTS User (
    user_id INT AUTO_INCREMENT,
    user_name VARCHAR(255) NOT NULL,
    user_added_date DATE,
    user_password VARCHAR(25) NOT NULL,
    user_mobile VARCHAR(25) NOT NULL,
    PRIMARY KEY (user_id) 
)  ENGINE=GKDB;

CREATE TABLE IF NOT EXISTS UserNote (
    usernote_id INT AUTO_INCREMENT,
    user_id Number NOT NULL,
    note_id Number NOT NULL,
    PRIMARY KEY (usernote_id),
	FOREIGN KEY fk_note(note_id)
   	REFERENCES Note(note_id)
   	ON UPDATE CASCADE
   	ON DELETE RESTRICT  
)  ENGINE=GKDB;

CREATE TABLE IF NOT EXISTS NoteReminder (
    notereminder_id INT AUTO_INCREMENT,
    note_id Number NOT NULL,
    reminder_id Number NOT NULL,
    PRIMARY KEY (notereminder_id),
	FOREIGN KEY fk_note(note_id)
   	REFERENCES Note(note_id)
   	ON UPDATE CASCADE
   	ON DELETE RESTRICT  	
)  ENGINE=GKDB;

CREATE TABLE IF NOT EXISTS NoteCategory (
    notecategory_id INT AUTO_INCREMENT,
    note_id Number NOT NULL,
    category_id Number NOT NULL,
    PRIMARY KEY (notecategory_id),
	FOREIGN KEY fk_note(note_id)
   	REFERENCES Note(note_id)
   	ON UPDATE CASCADE
   	ON DELETE RESTRICT 
	
)  ENGINE=GKDB;

--2. Insert the rows into the created tables (Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory).

INSERT INTO 'Note' ('note_title','note_content','note_status','note_creation_date') VALUES ('Test test 1','Test Desc 1','A','1984-02-14');   
INSERT INTO 'Note' ('note_title','note_content','note_status','note_creation_date') VALUES ('Test test 2','Test Desc 2','A','1984-02-15');   
INSERT INTO 'Note' ('note_title','note_content','note_status','note_creation_date') VALUES ('Test test 3','Test Desc 3','A','1984-02-16');   
INSERT INTO 'Note' ('note_title','note_content','note_status','note_creation_date') VALUES ('Test test 4','Test Desc 4','A','1984-02-17');   

INSERT INTO 'Category' ('category_name','category_descr','category_creation_date','category_creator') VALUES ('Cat 1','Cat Desc 1','1984-02-14','C1'); 
INSERT INTO 'Category' ('category_name','category_descr','category_creation_date','category_creator') VALUES ('Cat 2','Cat Desc 2','1984-02-15','C2'); 
INSERT INTO 'Category' ('category_name','category_descr','category_creation_date','category_creator') VALUES ('Cat 3','Cat Desc 3','1984-02-16','C3'); 
INSERT INTO 'Category' ('category_name','category_descr','category_creation_date','category_creator') VALUES ('Cat 4','Cat Desc 4','1984-02-17','C4'); 

INSERT INTO 'Reminder' ('reminder_name','reminder_descr','reminder_type','reminder_creation_date','reminder_creator') VALUES ('Rem 1','Rem Desc 1','Type 1','1984-02-14','R1'); 
INSERT INTO 'Reminder' ('reminder_name','reminder_descr','reminder_type','reminder_creation_date','reminder_creator') VALUES ('Rem 2','Rem Desc 2','Type 2','1984-02-15','R2'); 
INSERT INTO 'Reminder' ('reminder_name','reminder_descr','reminder_type','reminder_creation_date','reminder_creator') VALUES ('Rem 3','Rem Desc 3','Type 3','1984-02-16','R3'); 
INSERT INTO 'Reminder' ('reminder_name','reminder_descr','reminder_type','reminder_creation_date','reminder_creator') VALUES ('Rem 4','Rem Desc 4','Type 4','1984-02-17','R4');   

INSERT INTO 'User' ('user_name','user_added_date','user_password','user_mobile') VALUES ('Name 1','1984-02-14','password1','1234567890'); 
INSERT INTO 'User' ('user_name','user_added_date','user_password','user_mobile') VALUES ('Name 2','1984-02-15','password2','1234567891'); 
INSERT INTO 'User' ('user_name','user_added_date','user_password','user_mobile') VALUES ('Name 3','1984-02-16','password3','1234567892'); 
INSERT INTO 'User' ('user_name','user_added_date','user_password','user_mobile') VALUES ('Name 4','1984-02-17','password4','1234567893'); 

INSERT INTO 'UserNote' ('user_id','note_id') VALUES ('101','201'); 
INSERT INTO 'UserNote' ('user_id','note_id') VALUES ('102','202'); 
INSERT INTO 'UserNote' ('user_id','note_id') VALUES ('103','203'); 
INSERT INTO 'UserNote' ('user_id','note_id') VALUES ('104','204'); 

INSERT INTO 'NoteReminder' ('note_id','reminder_id') VALUES ('201','301'); 
INSERT INTO 'NoteReminder' ('note_id','reminder_id') VALUES ('202','302'); 
INSERT INTO 'NoteReminder' ('note_id','reminder_id') VALUES ('203','303'); 
INSERT INTO 'NoteReminder' ('note_id','reminder_id') VALUES ('204','304'); 

INSERT INTO 'NoteCategory' ('note_id','category_id Number') VALUES ('201','401'); 
INSERT INTO 'NoteCategory' ('note_id','category_id Number') VALUES ('202','402'); 
INSERT INTO 'NoteCategory' ('note_id','category_id Number') VALUES ('203','403'); 
INSERT INTO 'NoteCategory' ('note_id','category_id Number') VALUES ('204','404'); 

--3. Fetch the row from User table based on Id and Password.

SELECT * 
FROM User u 
WHERE u.user_id = '101' 
AND u.user_password like'password1';

--4. Fetch all the rows from Note table based on the field note_creation_date.

SELECT * 
FROM Note n 
WHERE n.note_creation_date = '1984-02-14';
 
--5. Fetch all the Categories created after the particular Date.

SELECT * 
FORM Category c 
WHERE c.category_creation_date > '1984-02-15'; 

--6. Fetch all the Note ID from UserNote table for a given User.

SELECT UNIQUE un.note_id 
FROM Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc
WHERE u.user_id = un.user_id
AND n.note_id = nc.note_id
AND n.note_id = nr.note_id
AND n.note_id = un.note_id
AND c.category_id = nc.category_id
AND r.reminder_id = nr.reminder_id
AND u.user_name like 'Name 1';

--7. Write Update query to modify particular Note for the given note Id.

UPDATE Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc SET n.note_title = 'Title Updated', n.note_content = 'Description Updated'
WHERE u.user_id = un.user_id
AND n.note_id = nc.note_id
AND n.note_id = nr.note_id
AND n.note_id = un.note_id
AND c.category_id = nc.category_id
AND r.reminder_id = nr.reminder_id
AND n.note_id = '201';

--8. Fetch all the Notes from the Note table by a particular User.

SELECT * 
FROM Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc 
WHERE u.user_id = un.user_id
AND n.note_id = nc.note_id
AND n.note_id = nr.note_id
AND n.note_id = un.note_id
AND c.category_id = nc.category_id
AND r.reminder_id = nr.reminder_id
AND u.user_name like 'Name 1';

--9. Fetch all the Notes from the Note table for a particular Category.

SELECT * 
FROM Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc  
WHERE u.user_id = un.user_id
AND n.note_id = nc.note_id
AND n.note_id = nr.note_id
AND n.note_id = un.note_id
AND c.category_id = nc.category_id
AND r.reminder_id = nr.reminder_id
AND c.category_name = 'Cat 1';

--10. Fetch all the reminder details for a given note id.

SELECT * 
FROM Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc  
WHERE u.user_id = un.user_id
AND n.note_id = nc.note_id
AND n.note_id = nr.note_id
AND n.note_id = un.note_id
AND c.category_id = nc.category_id
AND r.reminder_id = nr.reminder_id
AND note_id = '201';

--11. Fetch the reminder details for a given reminder id.

SELECT * 
FROM  Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc
WHERE u.user_id = un.user_id
AND n.note_id = nc.note_id
AND n.note_id = nr.note_id
AND n.note_id = un.note_id
AND c.category_id = nc.category_id
AND r.reminder_id = nr.reminder_id
AND r.reminder_id = '301'

--12. Write a query to create a new Note from particular User (Use Note and UserNote tables - insert statement).

INSERT INTO 'Note' ('note_title','note_content','note_status','note_creation_date') VALUES ('Test test 5','Test Desc 5','A','2019-06-12');   

INSERT INTO 'UserNote' ('user_id','note_id') VALUES ('104','205'); 


--13. Write a query to create a new Note from particular User to particular Category(Use Note and NoteCategory tables - insert statement)

INSERT INTO 'Note' ('note_title','note_content','note_status','note_creation_date') VALUES ('Test test 6','Test Desc 6','A','2019-06-12');   

INSERT INTO 'Category' ('category_name','category_descr','category_creation_date','category_creator') VALUES ('Cat 4',Cat Desc 4','1984-02-17','C4'); 

INSERT INTO 'NoteCategory' ('note_id','category_id Number') VALUES ('205','405'); 


--14. Write a query to set a reminder for a particular note (Use Reminder and NoteReminder tables - insert statement)

INSERT INTO 'Reminder' ('reminder_name','reminder_descr','reminder_type','reminder_creation_date','reminder_creator') VALUES ('Rem 1','Rem Desc 1','Type 1','1984-02-14','R1'); 


INSERT INTO 'NoteReminder' ('note_id','reminder_id') VALUES ('205','305'); 

--15. Write a query to delete particular Note added by a User(Note and UserNote tables - delete statement)

DELETE FROM  Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc
WHERE u.user_id = un.user_id
AND n.note_id = nc.note_id
AND n.note_id = nr.note_id
AND n.note_id = un.note_id
AND c.category_id = nc.category_id
AND r.reminder_id = nr.reminder_id
AND u.user_name like 'Name 1';

--16. Write a query to delete particular Note from particular Category(Note and NoteCategory tables - delete statement)

DELETE FROM  Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc
WHERE u.user_id = un.user_id
AND n.note_id = nc.note_id
AND n.note_id = nr.note_id
AND n.note_id = un.note_id
AND c.category_id = nc.category_id
AND r.reminder_id = nr.reminder_id
AND c.category_name = 'Cat 4';

--17. Create a trigger to delete all matching records from UserNote, NoteReminder and NoteCategory table when :

--1. A particular note is deleted from Note table (all the matching records from UserNote, NoteReminder and NoteCategory should be removed automatically)
DELIMITER $$
CREATE TRIGGER before_employee_update     
	BEFORE DELETE ON Note
	FOR EACH ROW BEGIN    
		DELETE FROM  Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc
        		WHERE u.user_id = un.user_id
			AND n.note_id = nc.note_id
			AND n.note_id = nr.note_id
			AND n.note_id = un.note_id
			AND c.category_id = nc.category_id
			AND r.reminder_id = nr.reminder_id
			AND n.note_id = '201';
END
$$DELIMITER;
--2. A particular user is deleted from User table (all the matching notes should be removed automatically)
DELIMITER $$
CREATE TRIGGER before_employee_update     
	BEFORE DELETE ON User    
	FOR EACH ROW BEGIN    
	DELETE FROM  Note n, Category c, Reminder r, User u, UserNote un, NoteReminder nr, NoteCategory nc
        		WHERE u.user_id = un.user_id
			AND n.note_id = nc.note_id
			AND n.note_id = nr.note_id
			AND n.note_id = un.note_id
			AND c.category_id = nc.category_id
			AND r.reminder_id = nr.reminder_id
			AND u.user_id = '101';
END
$$DELIMITER;

