-- Analyze the average completion times for each shape in the honeycomb game during the hottest and coldest months, using data from the past 20 years only. Order the results by average completion time.

with temp_type as (
SELECT 
    month,
    CASE 
        WHEN avg_temperature = (SELECT MIN(avg_temperature) FROM monthly_temperatures) THEN 'coldest'
        WHEN avg_temperature = (SELECT MAX(avg_temperature) FROM monthly_temperatures) THEN 'hottest'
        ELSE 'normal'
    END AS temperature_type
FROM monthly_temperatures
)
SELECT shape,extract(month from date) as mon,
avg(average_completion_time) as average_completion_time
FROM honeycomb_game
LEFT JOIN temp_type on extract(month from date) = month
WHERE date >= current_date - INTERVAL '20' Year
AND temperature_type in ('coldest','hottest')
GROUP BY 1,2
order by avg(average_completion_time) asc
                
                
                
                