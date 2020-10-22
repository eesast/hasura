CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."team"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "invite_code" text NOT NULL, "leader_id" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("leader_id") REFERENCES "public"."user"("_id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));
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
CREATE TRIGGER "set_public_team_updated_at"
BEFORE UPDATE ON "public"."team"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_team_updated_at" ON "public"."team" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
