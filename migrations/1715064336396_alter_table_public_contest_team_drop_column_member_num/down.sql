comment on column "public"."contest_team"."member_num" is E'比赛队伍';
alter table "public"."contest_team" alter column "member_num" set default 1;
alter table "public"."contest_team" alter column "member_num" drop not null;
alter table "public"."contest_team" add column "member_num" int4;
