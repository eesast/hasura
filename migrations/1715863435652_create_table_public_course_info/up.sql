CREATE TABLE "public"."course_info" ("course_id" uuid NOT NULL, "key" text NOT NULL, "value" text, PRIMARY KEY ("course_id","key") , FOREIGN KEY ("course_id") REFERENCES "public"."course"("uuid") ON UPDATE restrict ON DELETE cascade);COMMENT ON TABLE "public"."course_info" IS E'课程信息键值对表，对manager开放编辑';
