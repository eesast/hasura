CREATE TABLE "public"."llm_usage" ("uuid" uuid NOT NULL DEFAULT gen_random_uuid(), "total_tokens_used" int8 NOT NULL DEFAULT 0, "token_limit" int8 NOT NULL DEFAULT 100000, "created_at" timestamptz NOT NULL DEFAULT now(), "last_updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("uuid") , UNIQUE ("uuid"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
