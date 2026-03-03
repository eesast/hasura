CREATE TABLE "public"."member_list" ("student_no" text NOT NULL, "realname" text NOT NULL, PRIMARY KEY ("student_no") , UNIQUE ("student_no"));COMMENT ON TABLE "public"."member_list" IS E'入党积极分子';
