alter table "public"."mentor_application" alter column "mentor_id" drop not null;
alter table "public"."mentor_application" add column "mentor_id" text;
