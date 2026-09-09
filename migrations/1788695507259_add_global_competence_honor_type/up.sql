INSERT INTO public.honor_type (type_name)
SELECT '全球胜任力优秀奖'
WHERE NOT EXISTS (
  SELECT 1
  FROM public.honor_type
  WHERE type_name IN ('全球胜任力优秀奖', '全球胜任力优秀奖学金/荣誉')
);
