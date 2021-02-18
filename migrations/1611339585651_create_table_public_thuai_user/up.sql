CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."thuai_user"("thuai_id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, PRIMARY KEY ("thuai_id") , UNIQUE ("thuai_id"));
