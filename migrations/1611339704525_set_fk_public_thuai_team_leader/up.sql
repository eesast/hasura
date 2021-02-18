alter table "public"."thuai"
           add constraint "thuai_team_leader_fkey"
           foreign key ("team_leader")
           references "public"."thuai_user"
           ("thuai_id") on update restrict on delete restrict;
