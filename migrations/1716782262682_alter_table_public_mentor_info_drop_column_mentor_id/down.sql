comment on column "public"."mentor_info"."mentor_id" is E'新生导师信息';
alter table "public"."mentor_info" alter column "mentor_id" drop not null;
alter table "public"."mentor_info" add column "mentor_id" text;
