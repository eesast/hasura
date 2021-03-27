
ALTER TABLE "public"."thuai" DROP COLUMN "score";

COMMENT ON TABLE "public"."thuai" IS NULL;

COMMENT ON TABLE "public"."thuai_room_team" IS NULL;

DROP TABLE "public"."thuai_room_team";

DROP TABLE "public"."thuai_manager";

DROP TABLE "public"."thuai_room";

DROP TABLE "public"."thuai_code";
