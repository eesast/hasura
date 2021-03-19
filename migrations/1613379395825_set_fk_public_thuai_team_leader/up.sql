alter table "public"."thuai"
           add constraint "thuai_team_leader_fkey"
           foreign key ("team_leader")
           references "public"."user"
           ("_id") on update restrict on delete restrict;
