CREATE TABLE "public"."course_rating" ("course" uuid NOT NULL, "user" uuid NOT NULL, "dim1" integer NOT NULL, "dim2" integer NOT NULL, "dim3" integer NOT NULL, "dim4" integer NOT NULL, "dim5" integer NOT NULL, "dim6" integer NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("course","user") , FOREIGN KEY ("course") REFERENCES "public"."course"("uuid") ON UPDATE restrict ON DELETE cascade, FOREIGN KEY ("user") REFERENCES "public"."users"("uuid") ON UPDATE restrict ON DELETE cascade);COMMENT ON TABLE "public"."course_rating" IS E'用户评分表';
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
CREATE TRIGGER "set_public_course_rating_updated_at"
BEFORE UPDATE ON "public"."course_rating"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_course_rating_updated_at" ON "public"."course_rating" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
