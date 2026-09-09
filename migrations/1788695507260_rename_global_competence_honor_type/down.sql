DELETE FROM public.honor_type
WHERE type_name = '全球胜任力优秀奖'
  AND EXISTS (
    SELECT 1
    FROM public.honor_type
    WHERE type_name = '全球胜任力优秀奖学金/荣誉'
  );

UPDATE public.honor_type
SET type_name = '全球胜任力优秀奖学金/荣誉'
WHERE type_name = '全球胜任力优秀奖';
