comment on column "public"."contest_team"."status" is E'比赛队伍';
alter table "public"."contest_team" alter column "status" drop not null;
alter table "public"."contest_team" add column "status" text;
