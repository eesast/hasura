alter table "public"."contest_team_software_code"
  add constraint "contest_team_software_code_contest_id_fkey"
  foreign key ("contest_id")
  references "public"."contest"
  ("id") on update cascade on delete cascade;
