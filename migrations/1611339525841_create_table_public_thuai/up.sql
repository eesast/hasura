CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."thuai"("team_id" uuid NOT NULL DEFAULT gen_random_uuid(), "team_name" text NOT NULL, "team_sum" text NOT NULL, PRIMARY KEY ("team_id") , UNIQUE ("team_id"), UNIQUE ("team_name"));
