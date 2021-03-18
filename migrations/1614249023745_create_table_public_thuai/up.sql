
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."thuai"("team_id" uuid NOT NULL DEFAULT gen_random_uuid(), "team_name" text NOT NULL, "team_sum" text NOT NULL, PRIMARY KEY ("team_id") , UNIQUE ("team_id"), UNIQUE ("team_name"));

ALTER TABLE "public"."thuai" ADD COLUMN "team_leader" uuid NOT NULL;

ALTER TABLE "public"."thuai" ADD COLUMN "team_member1" uuid NULL;

ALTER TABLE "public"."thuai" ADD COLUMN "team_member2" uuid NULL;

ALTER TABLE "public"."thuai" ALTER COLUMN "team_leader" DROP NOT NULL;

ALTER TABLE "public"."thuai" ADD COLUMN "created_at" timestamptz NULL DEFAULT now();

ALTER TABLE "public"."thuai" ALTER COLUMN "team_leader" TYPE text;

ALTER TABLE "public"."thuai" ADD COLUMN "invited_code" text NULL UNIQUE;

alter table "public"."thuai"
           add constraint "thuai_team_leader_fkey"
           foreign key ("team_leader")
           references "public"."user"
           ("_id") on update restrict on delete restrict;

ALTER TABLE "public"."thuai" DROP COLUMN "team_member1" CASCADE;

ALTER TABLE "public"."thuai" DROP COLUMN "team_member2" CASCADE;

ALTER TABLE "public"."thuai" ADD CONSTRAINT "thuai_team_leader_key" UNIQUE ("team_leader");
