with query_1_cast as (select user_id, cast(unix_timestamp as numeric ) from query_1)

select user_id, unix_timestamp, previous_time, unix_timestamp - previous_time as delta_second_last_one_and_last_one from
(select user_id, 
       unix_timestamp, 
	   lag(unix_timestamp,1) over(partition by user_id order by unix_timestamp) as previous_time,
       row_number() over(partition by user_id order by unix_timestamp desc) as order_desc
from query_1_cast) as tmp
where order_desc = 1
order by user_id;

select * from query_1
order by user_id;
