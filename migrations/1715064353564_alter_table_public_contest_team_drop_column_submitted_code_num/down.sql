comment on column "public"."contest_team"."submitted_code_num" is E'比赛队伍';
alter table "public"."contest_team" alter column "submitted_code_num" set default 0;
alter table "public"."contest_team" alter column "submitted_code_num" drop not null;
alter table "public"."contest_team" add column "submitted_code_num" int4;
