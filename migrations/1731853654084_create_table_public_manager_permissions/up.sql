CREATE TABLE "public"."manager_permissions" ("permission_id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "description" text, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("permission_id") , UNIQUE ("permission_id"), UNIQUE ("name"), UNIQUE ("description"));COMMENT ON TABLE "public"."manager_permissions" IS E'管理员权限列表';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
