SELECT 100*SUM(CASE WHEN m.user_id IS null THEN 1 ELSE 0 END)/COUNT(*) as WEB_ONLY,
 100*SUM(CASE WHEN w.user_id IS null THEN 1 ELSE 0 END)/COUNT(*) as MOBILE_ONLY,
 100*SUM(CASE WHEN m.user_id IS NOT null AND w.user_id IS NOT null THEN 1 ELSE 0
END)/COUNT(*) as BOTH
FROM
(SELECT distinct user_id FROM query_2_web ) w
FULL OUTER JOIN
(SELECT distinct user_id FROM query_2_mobile ) m
ON m.user_id = w.user_id;

