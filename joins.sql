CREATE TABLE "cohort" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(25) NOT NULL,
	"start_date" date
);

CREATE TABLE "student" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	-- foreign key
	"cohort_id" INT REFERENCES "cohort"
);

INSERT INTO "cohort" ("name", "start_date")
VALUES ('Phrygian', '06/06/2022'), ('Proth', '07/12/2021'), ('Beta', '03/02/2015');

INSERT INTO "student" ("name", "cohort_id")
VALUES ('Holly', '1'), ('Alex', '1'), ('Tu', '1'), ('Daniel', '2'), ('Sarah', '2'), ('Alicia', '3'), ('Casie', '3');

SELECT * FROM "student"
JOIN "cohort" ON "cohort"."id" = "student"."cohort_id";

SELECT "student"."name", "cohort"."start_date" FROM "cohort"
JOIN "student" ON "cohort"."id" = "student"."cohort_id";

SELECT "student"."name" AS "student_name",
       "cohort"."name" AS "cohort_name" FROM "cohort"
JOIN "student" ON "cohort"."id" = "student"."cohort_id";

-- Other aggregate functions like COUNT
-- MAX
-- SUM
-- AVERAGE

SELECT COUNT("student".*), "cohort"."name" FROM "student"
-- RIGHT JOIN would include cohorts without any students
JOIN "cohort" ON "cohort"."id" = "student"."cohort_id"
GROUP BY "cohort"."name"
ORDER BY "cohort"."name";

INSERT INTO "cohort" ("name", "start_date")
VALUES ('Alpha', '05/22/2032');
