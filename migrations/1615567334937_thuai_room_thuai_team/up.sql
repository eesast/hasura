
CREATE TABLE "public"."thuai_code"("team_id" uuid NOT NULL, "code_1" text NOT NULL, "code_2" text NOT NULL, "code_3" text NOT NULL, "code_4" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("team_id") , FOREIGN KEY ("team_id") REFERENCES "public"."thuai"("team_id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("team_id"));
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
CREATE TRIGGER "set_public_thuai_code_updated_at"
BEFORE UPDATE ON "public"."thuai_code"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_thuai_code_updated_at" ON "public"."thuai_code" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';

CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."thuai_room"("room_id" uuid NOT NULL DEFAULT gen_random_uuid(), "status" boolean NOT NULL DEFAULT false, "result" text, PRIMARY KEY ("room_id") , UNIQUE ("room_id"));

CREATE TABLE "public"."thuai_manager"("manager_id" text NOT NULL, PRIMARY KEY ("manager_id") , FOREIGN KEY ("manager_id") REFERENCES "public"."user"("_id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "public"."thuai_room_team"("room_id" uuid NOT NULL, "thuai_team_id" uuid NOT NULL, PRIMARY KEY ("room_id","thuai_team_id") , FOREIGN KEY ("room_id") REFERENCES "public"."thuai_room"("room_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("thuai_team_id") REFERENCES "public"."thuai"("team_id") ON UPDATE restrict ON DELETE restrict);

COMMENT ON TABLE "public"."thuai_room_team" IS E'room-team多对多映射表';

COMMENT ON TABLE "public"."thuai" IS E'队伍信息';

ALTER TABLE "public"."thuai" ADD COLUMN "score" integer NULL DEFAULT 0;
