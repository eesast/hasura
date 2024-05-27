alter table "public"."honor_application" alter column "student_id" drop not null;
alter table "public"."honor_application" add column "student_id" text;
