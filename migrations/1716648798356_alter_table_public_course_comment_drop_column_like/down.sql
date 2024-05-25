comment on column "public"."course_comment"."like" is E'用户评论表';
alter table "public"."course_comment" alter column "like" set default 0;
alter table "public"."course_comment" alter column "like" drop not null;
alter table "public"."course_comment" add column "like" int4;
