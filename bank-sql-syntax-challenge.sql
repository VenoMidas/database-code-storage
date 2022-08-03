CREATE TABLE "accounts" (
    "id" serial PRIMARY KEY,
    "username" varchar(12) NOT NULL,
    "city" varchar(128),
    "transactions_completed" integer,
    "transactions_attempted" integer,
    "account_balance" numeric(12,2)
);

INSERT INTO "accounts" ("username", "city", "transactions_completed", "transactions_attempted", "account_balance")
VALUES ('Shawn', 'Chicago', 5, 10, 355.80),
('Cherise', 'Minneapolis', 9, 9, 4000.00),
('Larry', 'Minneapolis', 3, 4, 77.01),
('Dorothy', 'New York', 6, 12, 0.99),
('Anthony', 'Chicago', 0, 0, 0.00),
('Travis', 'Miami', 10, 100, 500000.34),
('Davey', 'Chicago', 9, 99, 98.04),
('Ora', 'Phoenix', 88, 90, 3.33),
('Grace', 'Miami', 7, 9100, 34.78),
('Hope', 'Phoenix', 4, 10, 50.17);

-- Get all users from Chicago
SELECT * FROM "accounts" WHERE "city" = 'Chicago';

-- All users with usernames containing the letter 'a'
SELECT * FROM "accounts" WHERE "username" ILIKE '%a%';

-- Update all records with an account balance of 0.00 and transactions_attempted of 0 with a balance of 10.00
UPDATE "accounts" SET "account_balance" = '10.00' WHERE "transactions_attempted" = '0' AND "account_balance" = '0.00';

-- Select all users that have attempted 9 or more transactions
SELECT * FROM "accounts" WHERE "transactions_attempted" >= '9';

-- Select username and account balance of the 3 users with the highest balance, sorted highest to lowest balance
SELECT "username", "account_balance" FROM "accounts" ORDER BY "account_balance" DESC LIMIT 3;

-- Select username and account balance of the 3 users with the lowest balances, sorted lowest to highest balance
SELECT "username", "account_balance" FROM "accounts" ORDER BY "account_balance" LIMIT 3;

-- Select users with account balances that are more than $100
SELECT * FROM "accounts" WHERE "account_balance" > '100';

-- Add a new account
INSERT INTO "accounts" ("username", "city", "transactions_completed", "transactions_attempted", "account_balance")
VALUES ('Mark', 'Lakeville', 32, 32, 1987.34);

-- Delete users that reside in miami OR phoenix and have completed fewer than 5 transactions
DELETE FROM "accounts" WHERE "transactions_completed" < 5 AND ("city" = 'Miami' OR "city" = 'Phoenix');

-- Anthony moved to Santa Fe. Update his location in the table
UPDATE "accounts" SET "city" = 'Santa Fe' WHERE "id" = '5';

-- 2. Grace closed her account. Remove her from the database.
DELETE FROM "accounts" WHERE "id" = '9';

-- 3. Travis made a withdrawal of $20,000.
UPDATE "accounts" SET "account_balance" = "account_balance" - '20000.00' WHERE "id" = '6' RETURNING "account_balance";

-- 4. The Bank needs to track last names
ALTER TABLE "accounts" ADD "lastname" varchar(120);

-- Total amount of money held by the bank
SELECT SUM("account_balance") FROM "accounts";

-- Total amount of money held by the bank at each location
SELECT "city", SUM("account_balance") FROM "accounts" GROUP BY "city" ORDER BY "sum" DESC;