/*The Front Man needs to analyze and rank the teams before the Tug of War game begins. For each team that has exactly 10 players, calculate their average player age. Additionally, categorize the teams based on their average player age into three age groups:

'Fit': Average age < 40
'Grizzled': Average age between 40 and 50 (inclusive)
'Elderly': Average age > 50

Show the team_id, average age, age group, and rank the teams based on their average player age (highest average age = rank 1).*/

with get_avg_age as (
select team_id, (avg(age)) as team_avg_age from player
group by 1
 HAVING count(first_name) = 10
			 
)
SELECT team_id , team_avg_age,
(CASE WHEN team_avg_age < 40 THEN 'Fit' 
	WHEN team_avg_age >= 40 and team_avg_age <= 50 THEN 'Grizzled'
	WHEN team_avg_age > 50 THEN 'Elderly' END) AS team_category,
rank() over( order by team_avg_age desc) as team_rank
FROM get_avg_age
              


                
                    
                       
                
                
                
                
                