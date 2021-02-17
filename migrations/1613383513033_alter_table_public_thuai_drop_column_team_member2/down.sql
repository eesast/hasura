ALTER TABLE "public"."thuai" ADD COLUMN "team_member2" uuid;
ALTER TABLE "public"."thuai" ALTER COLUMN "team_member2" DROP NOT NULL;
