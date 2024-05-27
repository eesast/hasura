alter table "public"."course_comment"
  add constraint "course_comment_parent_uuid_fkey"
  foreign key ("parent_uuid")
  references "public"."course_comment"
  ("uuid") on update restrict on delete restrict;
