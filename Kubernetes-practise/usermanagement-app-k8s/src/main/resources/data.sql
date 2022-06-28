INSERT INTO webappdb.user (userid, email_address, first_name, last_name, password, ssn, user_name) 
VALUES ("101", "romu.tiwari@something.com", "Romu", "Tiwari", "$2a$12$DMlBc7Szwk3bAjDgrFVygenFYc0GIj/gK3rcuoubfLzbidB6SBRnK", "tiwari11221", "romu101");	
INSERT INTO webappdb.role (roleid, role) VALUES ("201", "ADMIN");
INSERT INTO webappdb.user_role (userid, roleid) VALUES ("101", "201");
