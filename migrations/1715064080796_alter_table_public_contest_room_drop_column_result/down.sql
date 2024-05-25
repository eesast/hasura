alter table "public"."contest_room" alter column "result" drop not null;
alter table "public"."contest_room" add column "result" text;
