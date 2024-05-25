comment on column "public"."course_comment"."star" is E'用户评论表';
alter table "public"."course_comment" alter column "star" set default 0;
alter table "public"."course_comment" alter column "star" drop not null;
alter table "public"."course_comment" add column "star" int4;
