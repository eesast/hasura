alter table "public"."mentor_application" alter column "student_id" drop not null;
alter table "public"."mentor_application" add column "student_id" text;
