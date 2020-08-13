
with cte as (select user_id, date,
       row_number() over(partition by user_id order by date asc) as order_num 
from query_3
order by user_id)

select user_id, date
from cte
where order_num = 10;
