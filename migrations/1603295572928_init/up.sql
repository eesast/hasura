CREATE FUNCTION public.set_current_timestamp_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$;
CREATE TABLE public.aid_application (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    aid text NOT NULL,
    amount integer NOT NULL,
    status text DEFAULT 'approved'::text NOT NULL,
    student_id text NOT NULL,
    thank_letter text,
    code text NOT NULL,
    form_url text
);
CREATE TABLE public.article (
    id integer NOT NULL,
    title text NOT NULL,
    alias text NOT NULL,
    content text NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    visible boolean DEFAULT false NOT NULL,
    "authorId" text NOT NULL,
    abstract text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
COMMENT ON TABLE public.article IS 'article 数据';
CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;
CREATE TABLE public.article_liker (
    article_id integer NOT NULL,
    user_id text NOT NULL
);
COMMENT ON TABLE public.article_liker IS 'article - liker 多对多映射表';
CREATE VIEW public.article_public AS
 SELECT article.id,
    article.title,
    article.alias,
    article.content,
    article.views,
    article.abstract,
    article.created_at,
    article.visible,
    article."authorId"
   FROM public.article;
CREATE TABLE public.article_tag (
    article_id integer NOT NULL,
    tag_id uuid NOT NULL
);
COMMENT ON TABLE public.article_tag IS 'article - id 多对多映射表';
CREATE TABLE public.comment (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id text NOT NULL,
    article_id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE TABLE public.honor_application (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    student_id text NOT NULL,
    statement text NOT NULL,
    attachment_url text,
    honor text NOT NULL,
    status text DEFAULT 'submitted'::text NOT NULL
);
CREATE TABLE public.info_notice (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    content text NOT NULL,
    files text DEFAULT '"{}"'::text,
    title text NOT NULL,
    notice_type text NOT NULL
);
CREATE TABLE public.mentor_application (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    statement text NOT NULL,
    mentor_id text NOT NULL,
    student_id text NOT NULL,
    status text DEFAULT 'submitted'::text NOT NULL
);
CREATE TABLE public.mentor_available (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    mentor_id text NOT NULL,
    available boolean DEFAULT true NOT NULL
);
CREATE TABLE public.mentor_message (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    from_id text NOT NULL,
    to_id text NOT NULL,
    payload text NOT NULL
);
CREATE TABLE public.postgraduate_application (
    user_id text NOT NULL,
    mentor_info_id integer NOT NULL,
    status text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    verified boolean DEFAULT false NOT NULL
);
COMMENT ON TABLE public.postgraduate_application IS '学生填报保研申请信息（有意向、联络中、已确认）';
COMMENT ON COLUMN public.postgraduate_application.status IS 'intend, in_contact, confirmed';
CREATE TABLE public.postgraduate_application_history (
    user_id text NOT NULL,
    mentor_info_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    status text NOT NULL
);
COMMENT ON TABLE public.postgraduate_application_history IS '学生申请历史记录';
COMMENT ON COLUMN public.postgraduate_application_history.status IS 'intend, in_contact, confirmed_unverified, confirmed_verified, delete';
CREATE TABLE public.postgraduate_mentor_info (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    mentor text NOT NULL,
    field text NOT NULL,
    phd_quota numeric DEFAULT 0 NOT NULL,
    contact text NOT NULL,
    home_page text,
    alternate_contact text,
    detail_info text,
    user_id text NOT NULL,
    verified boolean DEFAULT false NOT NULL
);
COMMENT ON TABLE public.postgraduate_mentor_info IS '保研导师信息';
COMMENT ON COLUMN public.postgraduate_mentor_info.user_id IS '创建此信息用户id，有权更改';
CREATE SEQUENCE public.postgraduate_mentor_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.postgraduate_mentor_info_id_seq OWNED BY public.postgraduate_mentor_info.id;
CREATE TABLE public.postgraduate_mentor_info_pending (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    mentor text NOT NULL,
    lab text NOT NULL,
    phd_quota numeric DEFAULT 0 NOT NULL,
    contact text NOT NULL,
    home_page text,
    alternate_contact text,
    detail_info text,
    user_id text NOT NULL,
    info_id integer NOT NULL
);
COMMENT ON COLUMN public.postgraduate_mentor_info_pending.info_id IS '展示的信息的id';
CREATE TABLE public.scholarship_application (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    scholarship text NOT NULL,
    amount integer NOT NULL,
    status text DEFAULT 'approved'::text NOT NULL,
    student_id text NOT NULL,
    thank_letter text,
    code text NOT NULL,
    honor text NOT NULL,
    form_url text
);
CREATE TABLE public.tag (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    tag_name text NOT NULL
);
CREATE TABLE public."user" (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    username text,
    name text,
    department text,
    class text,
    phone text,
    id bigint,
    _id text NOT NULL,
    email text
);
ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);
ALTER TABLE ONLY public.postgraduate_mentor_info ALTER COLUMN id SET DEFAULT nextval('public.postgraduate_mentor_info_id_seq'::regclass);
ALTER TABLE ONLY public.aid_application
    ADD CONSTRAINT aid_application_pkey1 PRIMARY KEY (id);
ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_alias_key UNIQUE (alias);
ALTER TABLE ONLY public.article_liker
    ADD CONSTRAINT article_liker_pkey PRIMARY KEY (article_id, user_id);
ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.article_tag
    ADD CONSTRAINT article_tag_pkey PRIMARY KEY (article_id, tag_id);
ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.honor_application
    ADD CONSTRAINT honor_application_pkey1 PRIMARY KEY (id);
ALTER TABLE ONLY public.mentor_application
    ADD CONSTRAINT mentor_application_pkey1 PRIMARY KEY (id);
ALTER TABLE ONLY public.mentor_available
    ADD CONSTRAINT mentor_available_mentor_id_key UNIQUE (mentor_id);
ALTER TABLE ONLY public.mentor_available
    ADD CONSTRAINT mentor_available_pkey PRIMARY KEY (mentor_id);
ALTER TABLE ONLY public.mentor_message
    ADD CONSTRAINT mentor_message_pkey1 PRIMARY KEY (id);
ALTER TABLE ONLY public.info_notice
    ADD CONSTRAINT notice_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.postgraduate_application_history
    ADD CONSTRAINT postgraduate_application_history_pkey PRIMARY KEY (user_id, mentor_info_id, created_at);
ALTER TABLE ONLY public.postgraduate_application
    ADD CONSTRAINT postgraduate_application_pkey PRIMARY KEY (user_id, mentor_info_id);
ALTER TABLE ONLY public.postgraduate_mentor_info_pending
    ADD CONSTRAINT postgraduate_mentor_info_pending_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.postgraduate_mentor_info
    ADD CONSTRAINT postgraduate_mentor_info_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.scholarship_application
    ADD CONSTRAINT scholarship_application_pkey1 PRIMARY KEY (id);
ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_tag_key UNIQUE (tag_name);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_id_key UNIQUE (_id);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (_id);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_student_id_key UNIQUE (id);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
CREATE TRIGGER set_public_aid_application_updated_at BEFORE UPDATE ON public.aid_application FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_aid_application_updated_at ON public.aid_application IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_article_updated_at BEFORE UPDATE ON public.article FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_article_updated_at ON public.article IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_comment_updated_at BEFORE UPDATE ON public.comment FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_comment_updated_at ON public.comment IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_honor_application_updated_at BEFORE UPDATE ON public.honor_application FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_honor_application_updated_at ON public.honor_application IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mentor_application_updated_at BEFORE UPDATE ON public.mentor_application FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mentor_application_updated_at ON public.mentor_application IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mentor_available_updated_at BEFORE UPDATE ON public.mentor_available FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mentor_available_updated_at ON public.mentor_available IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mentor_message_updated_at BEFORE UPDATE ON public.mentor_message FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mentor_message_updated_at ON public.mentor_message IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_notice_updated_at BEFORE UPDATE ON public.info_notice FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_notice_updated_at ON public.info_notice IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_postgraduate_application_history_updated_at BEFORE UPDATE ON public.postgraduate_application_history FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_postgraduate_application_history_updated_at ON public.postgraduate_application_history IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_postgraduate_application_updated_at BEFORE UPDATE ON public.postgraduate_application FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_postgraduate_application_updated_at ON public.postgraduate_application IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_postgraduate_mentor_info_pending_updated_at BEFORE UPDATE ON public.postgraduate_mentor_info_pending FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_postgraduate_mentor_info_pending_updated_at ON public.postgraduate_mentor_info_pending IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_postgraduate_mentor_info_updated_at BEFORE UPDATE ON public.postgraduate_mentor_info FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_postgraduate_mentor_info_updated_at ON public.postgraduate_mentor_info IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_scholarship_application_updated_at BEFORE UPDATE ON public.scholarship_application FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_scholarship_application_updated_at ON public.scholarship_application IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_user_updated_at BEFORE UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_user_updated_at ON public."user" IS 'trigger to set value of column "updated_at" to current timestamp on row update';
ALTER TABLE ONLY public.aid_application
    ADD CONSTRAINT aid_application_student_id_fkey FOREIGN KEY (student_id) REFERENCES public."user"(_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.article
    ADD CONSTRAINT "article_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."user"(_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.article_liker
    ADD CONSTRAINT "article_liker_articleId_fkey" FOREIGN KEY (article_id) REFERENCES public.article(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.article_liker
    ADD CONSTRAINT "article_liker_userId_fkey" FOREIGN KEY (user_id) REFERENCES public."user"(_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.article_tag
    ADD CONSTRAINT "article_tag_articleId_fkey" FOREIGN KEY (article_id) REFERENCES public.article(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.article_tag
    ADD CONSTRAINT "article_tag_tagId_fkey" FOREIGN KEY (tag_id) REFERENCES public.tag(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.honor_application
    ADD CONSTRAINT honor_application_student_id_fkey FOREIGN KEY (student_id) REFERENCES public."user"(_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.mentor_application
    ADD CONSTRAINT mentor_application_mentor_id_fkey1 FOREIGN KEY (mentor_id) REFERENCES public."user"(_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.mentor_application
    ADD CONSTRAINT mentor_application_student_id_fkey1 FOREIGN KEY (student_id) REFERENCES public."user"(_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.mentor_available
    ADD CONSTRAINT mentor_available_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public."user"(_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.mentor_message
    ADD CONSTRAINT mentor_message_from_id_fkey FOREIGN KEY (from_id) REFERENCES public."user"(_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.mentor_message
    ADD CONSTRAINT mentor_message_to_id_fkey FOREIGN KEY (to_id) REFERENCES public."user"(_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.postgraduate_application_history
    ADD CONSTRAINT postgraduate_application_history_mentor_info_id_fkey FOREIGN KEY (mentor_info_id) REFERENCES public.postgraduate_mentor_info(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.postgraduate_application_history
    ADD CONSTRAINT postgraduate_application_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.postgraduate_application
    ADD CONSTRAINT postgraduate_application_mentor_info_id_fkey FOREIGN KEY (mentor_info_id) REFERENCES public.postgraduate_mentor_info(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.postgraduate_application
    ADD CONSTRAINT postgraduate_application_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.postgraduate_mentor_info_pending
    ADD CONSTRAINT postgraduate_mentor_info_pending_info_id_fkey FOREIGN KEY (info_id) REFERENCES public.postgraduate_mentor_info(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.postgraduate_mentor_info_pending
    ADD CONSTRAINT postgraduate_mentor_info_pending_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.postgraduate_mentor_info
    ADD CONSTRAINT postgraduate_mentor_info_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.scholarship_application
    ADD CONSTRAINT scholarship_application_student_id_fkey FOREIGN KEY (student_id) REFERENCES public."user"(_id) ON UPDATE CASCADE ON DELETE CASCADE;
