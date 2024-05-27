alter table "public"."users" add constraint "users_id_key" unique (id);
alter table "public"."users" alter column "id" drop not null;
alter table "public"."users" add column "id" text;
