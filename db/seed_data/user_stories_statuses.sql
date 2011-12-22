insert into user_stories_statuses ( id, name, position, is_default) VALUES ( 1,'Sin estado',1,1); 
insert into user_stories_statuses ( id ,name ,position ,is_default ) VALUES ( 2,'Backlog',2,0); 
insert into user_stories_statuses ( id ,name ,position ,is_default ) VALUES ( 3,'AnÎáÎõÎİlisis: En Proceso',3,0); 
insert into user_stories_statuses ( id ,name ,position ,is_default ) VALUES ( 4,'AnÎáÎõÎİlisis: Hecho',4,0); 
insert into user_stories_statuses ( id ,name ,position ,is_default ) VALUES ( 5,'Desarrollo: En proceso',5,0); 
insert into user_stories_statuses ( id ,name ,position ,is_default ) VALUES ( 6,'Desarrollo: Hecho',6,0); 
insert into user_stories_statuses ( id ,name ,position ,is_default ) VALUES ( 7,'AceptaciÎáÎõÎån: En proceso',7,0); 
insert into user_stories_statuses ( id ,name ,position ,is_default ) VALUES ( 8,'AceptaciÎáÎõÎån: Hecho',8,0); 

insert into user_stories_assignments(user_story_id,user_stories_status_id)
(select id,1 from user_stories where project_id);

update user_stories SET
   user_stories_status_id = 1;
