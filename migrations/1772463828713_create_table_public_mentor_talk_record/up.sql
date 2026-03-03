CREATE TABLE "public"."mentor_talk_record" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "updated_at" timestamptz NOT NULL DEFAULT now(), "user_id" uuid NOT NULL, "semester" text NOT NULL, "mentor_talk_confirm" boolean NOT NULL DEFAULT false, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."users"("uuid") ON UPDATE cascade ON DELETE cascade, UNIQUE ("id"));
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
CREATE TRIGGER "set_public_mentor_talk_record_updated_at"
BEFORE UPDATE ON "public"."mentor_talk_record"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_mentor_talk_record_updated_at" ON "public"."mentor_talk_record"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
