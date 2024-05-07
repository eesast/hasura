comment on column "public"."contest_team"."score" is E'比赛队伍';
alter table "public"."contest_team" alter column "score" set default ''200'::text';
alter table "public"."contest_team" alter column "score" drop not null;
alter table "public"."contest_team" add column "score" text;
