ALTER TABLE "public"."honor_application"
ADD COLUMN "application_form_url" text NULL;

UPDATE "public"."honor_application"
SET
  "application_form_url" = "attachment_url",
  "attachment_url" = NULL
WHERE "application_form_url" IS NULL
  AND "attachment_url" ~ '^honor_application/[^/]+/[0-9]{4}/application_form/';
