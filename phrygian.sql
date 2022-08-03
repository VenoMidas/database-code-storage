CREATE TABLE "songs" (
	"id" serial primary key,
	"duration" integer, -- Data types are required
	"artist" varchar(120), -- 120 character max
	"track" varchar(120)
); -- CMD Enter will run a highlighted statement

-- CMD R will refrish Postico

-- create / INSERT INTO
INSERT INTO "songs" ("duration", "artist", "track")
-- single quotes for values
VALUES (3, 'Tom Waits', 'Goin'' Out West'); -- escape character is an empty single quote

-- Insert many records
INSERT INTO "songs" ("duration", "artist", "track")
-- single quotes for values
VALUES (3, 'Maggie Rogers', 'Fallingwater'),
	   (45, 'LCD Soundsystem', '45:33'),
	   (4, 'Phoebe Bridgers', 'Georgia');
	   
-- Read / SELECT

/* Items in [] are optional. In summary;
SELECT column
FROM table
[WHERE BY column]
[ORDER BY column [ ASC | DESC ]]
LIMIT number_rows [ OFFSET offset_value ];
*/

SELECT * FROM "songs"; -- * selects all

SELECT "artist" FROM "songs";

SELECT * FROM "songs" ORDER BY "artist" DESC;

SELECT SUM("duration") FROM "songs";

SELECT * FROM "songs" WHERE "duration" > 3;

-- Select songs with 'a' in the track
SELECT * FROM "songs" WHERE "track" ILIKE '%a%';
-- ends with 'a'
SELECT * FROM "songs" WHERE "track" ILIKE '%a';

-- limit of 10 or 100 are common
-- set limit of returned to 2
SELECT * FROM "songs" LIMIT 2;

-- gets 100, when you get to the bottom of the list, gets the next 100
SELECT * FROM "songs" LIMIT 100 OFFSET 100;

SELECT "artist", "duration" FROM "songs" WHERE "duration" = 3 AND "artist" LIKE 'Maggie Rogers';

-- Update / UPDATE
UPDATE "songs" SET "artist" = 'Dev' WHERE "id" = 1;

-- Delete / DELETE
-- Delete ALL SONGS
DELETE FROM "songs";
-- Delete song with id of 2
DELETE FROM "songs" WHERE id = 2;
-- Delete song with id of 3
DELETE FROM "songs" WHERE id = 3;