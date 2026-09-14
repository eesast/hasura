UPDATE "public"."honor_application"
SET "attachment_url" = "application_form_url"
WHERE "attachment_url" IS NULL
  AND "application_form_url" IS NOT NULL;

ALTER TABLE "public"."honor_application"
DROP COLUMN "application_form_url";
