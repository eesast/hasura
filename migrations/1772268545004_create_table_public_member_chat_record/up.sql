CREATE TABLE "public"."member_chat_record" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "updated_at" timestamptz NOT NULL DEFAULT now(), "user_id" uuid NOT NULL, "semester" text NOT NULL, "member_chat_confirm" boolean NOT NULL DEFAULT false, PRIMARY KEY ("id") , FOREIGN KEY ("id") REFERENCES "public"."users"("uuid") ON UPDATE cascade ON DELETE cascade, UNIQUE ("id"));COMMENT ON TABLE "public"."member_chat_record" IS E'积极分子谈话记录';
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
CREATE TRIGGER "set_public_member_chat_record_updated_at"
BEFORE UPDATE ON "public"."member_chat_record"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_member_chat_record_updated_at" ON "public"."member_chat_record"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
