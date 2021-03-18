
alter table "public"."postgraduate_mentor_info" drop constraint "postgraduate_mentor_info_editor_fkey";

ALTER TABLE "public"."postgraduate_mentor_info" ALTER COLUMN "editor" DROP NOT NULL;

COMMENT ON COLUMN "public"."postgraduate_mentor_info"."editor" IS E'';

ALTER TABLE "public"."postgraduate_mentor_info" DROP COLUMN "editor";

COMMENT ON COLUMN "public"."postgraduate_mentor_info"."phd_quota" IS E'';

COMMENT ON COLUMN "public"."postgraduate_mentor_info"."phd_quota_unfixed" IS E'';

ALTER TABLE "public"."postgraduate_mentor_info" DROP COLUMN "phd_quota_unfixed";
