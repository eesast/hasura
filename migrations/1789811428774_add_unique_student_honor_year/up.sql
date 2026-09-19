ALTER TABLE "public"."honor_application"
ADD COLUMN "enforce_unique" boolean NOT NULL DEFAULT true;

WITH ranked_applications AS (
  SELECT
    "id",
    ROW_NUMBER() OVER (
      PARTITION BY "student_uuid", "year", "honor"
      ORDER BY "created_at" ASC, "id" ASC
    ) AS row_number
  FROM "public"."honor_application"
)
UPDATE "public"."honor_application" AS application
SET "enforce_unique" = false
FROM ranked_applications AS ranked
WHERE application."id" = ranked."id"
  AND ranked.row_number > 1;

CREATE UNIQUE INDEX "honor_application_student_uuid_year_honor_new_key"
ON "public"."honor_application" ("student_uuid", "year", "honor")
WHERE "enforce_unique" = true;
