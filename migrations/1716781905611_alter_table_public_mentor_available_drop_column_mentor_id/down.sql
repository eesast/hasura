alter table "public"."mentor_available" alter column "mentor_id" drop not null;
alter table "public"."mentor_available" add column "mentor_id" text;
