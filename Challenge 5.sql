/* 
For the Marbles game, the Front Man needs you to discover who Player 456's closest companion is. First, find the player who has interacted with Player 456 the most frequently in daily activities. Then, confirm this player is still alive and return a row with both players' first names, and the number of interactions they've had.
*/


-- Brute force, need to optimize 

WITH most_interactions AS (
    SELECT 
        player1_id, 
        player2_id, 
        COUNT(player2_id) AS no_of_interaction 
    FROM (
        SELECT player1_id, player2_id 
        FROM daily_interactions 
        WHERE player1_id = 456

        UNION ALL 

        SELECT player2_id AS player1_id, player1_id AS player2_id 
        FROM daily_interactions 
        WHERE player2_id = 456
    ) AS interactions
    GROUP BY player1_id, player2_id
)
SELECT  player1_first_name, player2_first_name, no_of_interaction FROM (
SELECT 
    most_interactions.player1_id, 
    a.first_name AS player1_first_name, 
    most_interactions.player2_id, 
    b.first_name AS player2_first_name,
    most_interactions.no_of_interaction,
	row_number() over(order by no_of_interaction desc) as rnk
FROM most_interactions
JOIN player a ON most_interactions.player1_id = a.id
JOIN player b ON most_interactions.player2_id = b.id
WHERE b.status = 'alive'
)
where rnk = 1