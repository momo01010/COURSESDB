CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "phone" varchar,
  "rol_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "duration" time NOT NULL,
  "level_id" uuid NOT NULL,
  "teacher_id" uuid NOT NULL,
  "category_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "courses_users" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "course_id" uuid NOT NULL,
  "percentage_to_complete" int NOT NULL,
  "is_completed" boolean DEFAULT false,
  "review_available" boolean DEFAULT false
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid NOT NULL,
  "url" varchar NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "courses_levels" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" varchar NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "courses_levels" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "courses_users" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_users" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");


insert into courses_levels (
id,
name
)values (
'7170d21f-0173-4d60-bd5b-f588bfc2a472',
'beginners'
),
(
'158520dd-c577-4ab9-aada-121add9bd51c',
'intermediate'
),
(
'd7f7eeab-810d-47c6-bc7a-13e79eb7939f',
'advanced'
);

insert into roles (
id,
name,
description 
)values (
'c6cbfd85-d8a6-4504-83d6-7dcb64439190',
'student',
'student of the platform, would be able to take any class'
),
(
'a481a266-276d-40a7-b875-4cc0c897f87e',
'teacher',
'Teacher of the platform, responsible for the right education of every student in his/her class'
),
(
'30a440cb-6ce7-4af4-83c0-7241a1b5ec4d',
'admin',
'Administrator of the platform, responsible for the correct performance of the site and all the components in it'
);


insert into categories (
id,
name,
description 
)values (
'fd349717-b107-4fde-b19e-4427056fad15',
'Web development',
'building and maintenance of websites; it is the work that happens behind the scenes to make a website look great, work fast and perform well with a seamless user experience. '
),
(
'dfeca02a-a225-4aba-9f1d-817315558b27',
'Languages',
'This course emphasizes the development of fluency and intelligibility in different languages. Through individual and group activities, students work on improving pronunciation, practicing conversation strategies and delivering oral presentations'
),
(
'5ef00f50-1b45-4e69-b006-c2c8a54a69d1',
'Cooking lessons',
'Learn the fundamentals of really good cooking. We teach classic French style with emphasis on techniques.'
);


insert into users (
id,
first_name,
last_name,
email,
"password",
age,
phone,
rol_id
)values (
'6763e61f-72c3-4def-a075-3337ee7fe6a4',
'Martha',
'Hernandez',
'marthaH@example.com',
'1234Martha',
21,
'+52 2245639984',
'c6cbfd85-d8a6-4504-83d6-7dcb64439190'
),
(
'078e5231-87da-481c-b6ba-a12bbe68d6c3',
'Juan',
'Benavente',
'benaventeJ@example.com',
'1234Juan',
35,
'+52 87340639984',
'c6cbfd85-d8a6-4504-83d6-7dcb64439190'
),
(
'cea7caf4-acff-4a71-9647-a9b2195912a3',
'Josefina',
'Fernandez',
'finaFer@example.com',
'1234Josefina',
41,
'+52 22477665984',
'c6cbfd85-d8a6-4504-83d6-7dcb64439190'
),
(
'63da0f97-1974-4ab9-938d-003f8043c801',
'Mario',
'Pinal',
'mariomario@example.com',
'1234Mario',
24,
'+52 2564899984',
'a481a266-276d-40a7-b875-4cc0c897f87e'
),
(
'769de402-dd5c-494e-a1f6-62a6656651a3',
'Pedro',
'Vega',
'pvega@example.com',
'1234PedroVega',
32,
'+52 9834699984',
'a481a266-276d-40a7-b875-4cc0c897f87e'
),
(
'c55aac94-1602-4d8a-8663-538fab400f0e',
'Victoria',
'Rojas',
'vrojas@example.com',
'1234RVictoria',
52,
'+52 9837694984',
'a481a266-276d-40a7-b875-4cc0c897f87e'
),
(
'326d337a-baab-4d52-82b8-abfa3d8cd008',
'Merlin',
'Rodriguez',
'admin@example.com',
'1234admin',
22,
'+52 9836669784',
'30a440cb-6ce7-4af4-83c0-7241a1b5ec4d'
),
(
'372ba5e9-bfef-4ba3-b98b-5a21b6e3aa45',
'Paulina',
'Marquez',
'admin2@example.com',
'1234admin2',
31,
'+52 98389765584',
'30a440cb-6ce7-4af4-83c0-7241a1b5ec4d'
);


insert into courses (
id,
name,
duration,
level_id,
teacher_id,
category_id
)values (
'dfcb91bb-fdee-412e-8634-2613fd708ff1',
'Foundation of html, css and JavaScript',
'02:30:00',
'7170d21f-0173-4d60-bd5b-f588bfc2a472',
'63da0f97-1974-4ab9-938d-003f8043c801',
'fd349717-b107-4fde-b19e-4427056fad15'
),
(
'13af7cbe-9e30-4c1b-845b-eaca8f96505b',
'French A1',
'09:30:00',
'7170d21f-0173-4d60-bd5b-f588bfc2a472',
'769de402-dd5c-494e-a1f6-62a6656651a3',
'dfeca02a-a225-4aba-9f1d-817315558b27'
),
(
'9b5021df-0033-443a-9dd5-c8d4f6e1be65',
'SQL data bases',
'05:45:00',
'158520dd-c577-4ab9-aada-121add9bd51c',
'63da0f97-1974-4ab9-938d-003f8043c801',
'fd349717-b107-4fde-b19e-4427056fad15'
),
(
'9455cdc1-1263-4387-bd7a-d125c039746b',
'German C1',
'07:15:00',
'd7f7eeab-810d-47c6-bc7a-13e79eb7939f',
'c55aac94-1602-4d8a-8663-538fab400f0e',
'dfeca02a-a225-4aba-9f1d-817315558b27'
),
(
'5317184b-5984-477f-889c-533a6be76aa0',
'Tiramisu',
'02:45:00',
'd7f7eeab-810d-47c6-bc7a-13e79eb7939f',
'c55aac94-1602-4d8a-8663-538fab400f0e',
'5ef00f50-1b45-4e69-b006-c2c8a54a69d1'
);

insert into courses_videos (
id,
course_id,
url
)values (
'6dc4473b-3d22-45d9-9cc8-7e4a5d729715',
'5317184b-5984-477f-889c-533a6be76aa0',
'https://www.youtube.com/watch?v=UNRwY7wkn-g'
),
(
'ded7de1c-2298-4e04-b6f8-7061f494b79e',
'9455cdc1-1263-4387-bd7a-d125c039746b',
'https://www.youtube.com/watch?v=V0T9jPDPKqk'
),
(
'2f0d21e9-7c6e-42fb-8e8f-38ff8167471d',
'9b5021df-0033-443a-9dd5-c8d4f6e1be65',
'https://www.youtube.com/watch?v=uUdKAYl-F7g'
),
(
'17892a24-8fc3-4a52-a974-bac1c2d4bd41',
'13af7cbe-9e30-4c1b-845b-eaca8f96505b',
'https://www.youtube.com/watch?v=oSulEWeZlPA'
);

insert into courses_users (
id,
user_id, 
course_id,
percentage_to_complete
)values (
'b8df1c70-e643-4028-86c0-a8da48ecec9e',
'6763e61f-72c3-4def-a075-3337ee7fe6a4',
'13af7cbe-9e30-4c1b-845b-eaca8f96505b',
10
),(
'fde3971b-83d0-46e1-a24f-523c28a72276',
'078e5231-87da-481c-b6ba-a12bbe68d6c3',
'9b5021df-0033-443a-9dd5-c8d4f6e1be65',
20
), (
'0f771462-5388-4e52-abae-5463b9d5f171',
'cea7caf4-acff-4a71-9647-a9b2195912a3',
'dfcb91bb-fdee-412e-8634-2613fd708ff1',
90
);


select c."name", users.first_name as teacher, c.level_id, c.category_id as category from courses as c left join users on c.teacher_id = users.id;  




