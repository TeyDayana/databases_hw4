CREATE TABLE "city" (
  "name" varchar PRIMARY KEY,
  "region" varchar
);

CREATE TABLE "station" (
  "name" varchar PRIMARY KEY,
  "tracks" integer,
  "city_name" varchar
);

CREATE TABLE "train" (
  "number" integer PRIMARY KEY,
  "length" integer,
  "start_station_name" varchar,
  "end_station_name" varchar
);

CREATE TABLE "connection" (
  "train_number" integer,
  "departure_time" datetime,
  "arrival_time" datetime,
  "current_station_name" varchar,
  "arrival_station_name" varchar,
  PRIMARY KEY ("train_number", "departure_time")
);

ALTER TABLE "station" ADD FOREIGN KEY ("city_name") REFERENCES "city" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("start_station_name") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("end_station_name") REFERENCES "station" ("name");

ALTER TABLE "connection" ADD FOREIGN KEY ("train_number") REFERENCES "train" ("number");

ALTER TABLE "connection" ADD FOREIGN KEY ("current_station_name") REFERENCES "station" ("name");

ALTER TABLE "connection" ADD FOREIGN KEY ("arrival_station_name") REFERENCES "station" ("name");
