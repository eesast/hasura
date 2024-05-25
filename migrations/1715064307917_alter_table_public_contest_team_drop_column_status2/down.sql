comment on column "public"."contest_team"."status2" is E'比赛队伍';
alter table "public"."contest_team" alter column "status2" drop not null;
alter table "public"."contest_team" add column "status2" text;
