alter table "public"."mentor_message" alter column "to_id" drop not null;
alter table "public"."mentor_message" add column "to_id" text;
