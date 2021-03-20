alter table "public"."team_member"
           add constraint "team_member_team_id_fkey"
           foreign key ("team_id")
           references "public"."thuai"
           ("team_id") on update restrict on delete restrict;
