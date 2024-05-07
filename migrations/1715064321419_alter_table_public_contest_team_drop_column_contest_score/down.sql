comment on column "public"."contest_team"."contest_score" is E'比赛队伍';
alter table "public"."contest_team" alter column "contest_score" drop not null;
alter table "public"."contest_team" add column "contest_score" text;
