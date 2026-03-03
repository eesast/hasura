alter table "public"."member_chat_record" drop constraint "member_chat_record_user_id_fkey",
  add constraint "member_chat_record_id_fkey"
  foreign key ("id")
  references "public"."users"
  ("uuid") on update cascade on delete cascade;
