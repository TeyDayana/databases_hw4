CREATE TABLE "book" (
  "isbn" varchar PRIMARY KEY,
  "name" varchar,
  "author" varchar,
  "publ_year" int,
  "num_pages" int,
  "publisher_name" varchar
);

CREATE TABLE "copy" (
  "isbn" varchar,
  "num" int,
  "position" int,
  PRIMARY KEY ("isbn", "num")
);

CREATE TABLE "publisher" (
  "name" varchar PRIMARY KEY,
  "address" varchar
);

CREATE TABLE "category" (
  "name" varchar PRIMARY KEY,
  "parent_name" varchar
);

CREATE TABLE "reader" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "address" varchar,
  "birth_date" date
);

CREATE TABLE "rental" (
  "isbn" varchar,
  "copy_num" int,
  "reader_id" int,
  "return_date" date,
  PRIMARY KEY ("isbn", "copy_num")
);

CREATE TABLE "categorization" (
  "category_name" varchar,
  "isbn" varchar,
  PRIMARY KEY ("category_name", "isbn")
);

ALTER TABLE "book" ADD FOREIGN KEY ("isbn") REFERENCES "copy" ("isbn");

ALTER TABLE "book" ADD FOREIGN KEY ("publisher_name") REFERENCES "publisher" ("name");

ALTER TABLE "category" ADD FOREIGN KEY ("parent_name") REFERENCES "category" ("name");

ALTER TABLE "rental" ADD FOREIGN KEY ("isbn") REFERENCES "copy" ("isbn");

ALTER TABLE "rental" ADD FOREIGN KEY ("copy_num") REFERENCES "copy" ("num");

ALTER TABLE "rental" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("id");

ALTER TABLE "categorization" ADD FOREIGN KEY ("category_name") REFERENCES "category" ("name");

ALTER TABLE "categorization" ADD FOREIGN KEY ("isbn") REFERENCES "book" ("isbn");
