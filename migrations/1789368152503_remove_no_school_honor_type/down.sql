INSERT INTO "public"."honor_type" ("type_name")
VALUES ('无校级荣誉')
ON CONFLICT ("type_name") DO NOTHING;
