alter table "public"."contest_room" alter column "updated_at" set default now();
alter table "public"."contest_room" alter column "updated_at" drop not null;
alter table "public"."contest_room" add column "updated_at" timestamptz;
