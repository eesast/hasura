
ALTER TABLE "public"."postgraduate_mentor_info" ADD COLUMN "phd_quota_unfixed" numeric NOT NULL DEFAULT 0;

COMMENT ON COLUMN "public"."postgraduate_mentor_info"."phd_quota_unfixed" IS E'非固定名额';

COMMENT ON COLUMN "public"."postgraduate_mentor_info"."phd_quota" IS E'固定名额';

ALTER TABLE "public"."postgraduate_mentor_info" ADD COLUMN "editor" text NULL;

COMMENT ON COLUMN "public"."postgraduate_mentor_info"."editor" IS E'修改者id';

ALTER TABLE "public"."postgraduate_mentor_info" ALTER COLUMN "editor" SET NOT NULL;

alter table "public"."postgraduate_mentor_info"
           add constraint "postgraduate_mentor_info_editor_fkey"
           foreign key ("editor")
           references "public"."user"
           ("_id") on update restrict on delete restrict;
