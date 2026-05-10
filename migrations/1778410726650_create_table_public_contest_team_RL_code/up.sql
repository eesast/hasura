CREATE TABLE "public"."contest_team_RL_code" ("submit_id" uuid NOT NULL DEFAULT gen_random_uuid(), "team_id" uuid NOT NULL, "created_at" Timestamp NOT NULL DEFAULT now(), "url" text NOT NULL, PRIMARY KEY ("submit_id") , UNIQUE ("submit_id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
