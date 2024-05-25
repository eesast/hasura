alter table "public"."contest" alter column "status" set default ''000'::text';
alter table "public"."contest" alter column "status" drop not null;
alter table "public"."contest" add column "status" text;
