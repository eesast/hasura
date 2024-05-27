alter table "public"."mentor_message" alter column "from_id" drop not null;
alter table "public"."mentor_message" add column "from_id" text;
