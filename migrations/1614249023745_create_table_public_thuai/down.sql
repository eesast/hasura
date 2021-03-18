
ALTER TABLE "public"."thuai" DROP CONSTRAINT "thuai_team_leader_key";

ALTER TABLE "public"."thuai" ADD COLUMN "team_member2" uuid;
ALTER TABLE "public"."thuai" ALTER COLUMN "team_member2" DROP NOT NULL;

ALTER TABLE "public"."thuai" ADD COLUMN "team_member1" uuid;
ALTER TABLE "public"."thuai" ALTER COLUMN "team_member1" DROP NOT NULL;

alter table "public"."thuai" drop constraint "thuai_team_leader_fkey";

ALTER TABLE "public"."thuai" DROP COLUMN "invited_code";

ALTER TABLE "public"."thuai" ALTER COLUMN "team_leader" TYPE uuid;

ALTER TABLE "public"."thuai" DROP COLUMN "created_at";

ALTER TABLE "public"."thuai" ALTER COLUMN "team_leader" SET NOT NULL;

ALTER TABLE "public"."thuai" DROP COLUMN "team_member2";

ALTER TABLE "public"."thuai" DROP COLUMN "team_member1";

alter table "public"."thuai" drop constraint "thuai_team_leader_fkey";

ALTER TABLE "public"."thuai" DROP COLUMN "team_leader";

DROP TABLE "public"."thuai";
