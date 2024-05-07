alter table "public"."contest" alter column "contest_type" drop not null;
alter table "public"."contest" add column "contest_type" text;
