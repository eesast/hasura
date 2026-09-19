DROP INDEX "public"."honor_application_student_uuid_year_honor_new_key";

ALTER TABLE "public"."honor_application"
DROP COLUMN "enforce_unique";
