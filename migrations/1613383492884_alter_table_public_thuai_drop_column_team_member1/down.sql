ALTER TABLE "public"."thuai" ADD COLUMN "team_member1" uuid;
ALTER TABLE "public"."thuai" ALTER COLUMN "team_member1" DROP NOT NULL;
