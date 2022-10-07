CREATE TABLE "station" (
  "number" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "station_personell" (
  "number" integer,
  "names" varchar,
  "station_number" integer,
  PRIMARY KEY ("number", "station_number")
);

CREATE TABLE "caregiver" (
  "number" integer PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "doctor" (
  "number" integer PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "patient" (
  "number" integer PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "doctor_number" integer
);

CREATE TABLE "room" (
  "number" integer,
  "beds" integer,
  "station_number" integer,
  PRIMARY KEY ("number", "station_number")
);

CREATE TABLE "admission" (
  "station_number" integer PRIMARY KEY,
  "current_room_number" integer,
  "prev_room_number" integer
);

ALTER TABLE "station_personell" ADD FOREIGN KEY ("station_number") REFERENCES "station" ("number");

ALTER TABLE "caregiver" ADD FOREIGN KEY ("number") REFERENCES "station_personell" ("number");

ALTER TABLE "doctor" ADD FOREIGN KEY ("number") REFERENCES "station_personell" ("number");

ALTER TABLE "patient" ADD FOREIGN KEY ("doctor_number") REFERENCES "doctor" ("number");

ALTER TABLE "room" ADD FOREIGN KEY ("station_number") REFERENCES "station" ("number");

ALTER TABLE "admission" ADD FOREIGN KEY ("station_number") REFERENCES "station" ("number");

ALTER TABLE "admission" ADD FOREIGN KEY ("current_room_number") REFERENCES "room" ("number");

ALTER TABLE "admission" ADD FOREIGN KEY ("prev_room_number") REFERENCES "room" ("number");
