CREATE TABLE public.user_llm_usage (
    student_no text NOT NULL,
    total_tokens_used bigint DEFAULT 0 NOT NULL,
    token_limit bigint DEFAULT 100000 NOT NULL, -- 默认限额
    last_updated_at timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now(),
    PRIMARY KEY (student_no)
);

-- 记录 Access Key 的发放记录 (可选，用于审计)
CREATE TABLE public.access_key_log (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    student_no text NOT NULL,
    jti text NOT NULL, -- 对应 JWT 的 ID
    email text,
    created_at timestamp with time zone DEFAULT now(),
    is_revoked boolean DEFAULT false
);
