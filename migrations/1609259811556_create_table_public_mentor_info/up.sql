
COMMENT ON COLUMN "public"."mentor_application"."status" IS E'approved | submitted';

CREATE TABLE "public"."mentor_info"("mentor_id" text NOT NULL, "intro" text, "background" text, "field" text, "achievement" text, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("mentor_id") , FOREIGN KEY ("mentor_id") REFERENCES "public"."user"("_id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("mentor_id")); COMMENT ON TABLE "public"."mentor_info" IS E'新生导师信息';
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_mentor_info_updated_at"
BEFORE UPDATE ON "public"."mentor_info"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_mentor_info_updated_at" ON "public"."mentor_info" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';

COMMENT ON COLUMN "public"."mentor_info"."intro" IS E'简要信息：联系方式、职位等';

COMMENT ON COLUMN "public"."mentor_info"."background" IS E'教育背景';

COMMENT ON COLUMN "public"."mentor_info"."field" IS E'研究领域';

COMMENT ON COLUMN "public"."mentor_info"."achievement" IS E'学术成果';
