--The organizers need to calculate how many food portions to withhold to create the right amount of tension. In a table, calculate how many rations would feed 90% of the remaining non-insider players (rounded down), and in another column, indicate if the current rations supply is sufficient. (True or False)

WITH required_ration_calc AS (
    SELECT FLOOR(COUNT(*) * 0.90) AS required_ration
    FROM player 
    WHERE isinsider = 'false'
    AND status = 'alive'
),
rations AS (
    SELECT amount AS current_ration
    FROM rations
    LIMIT 1  -- Assuming there's only one row in the rations table
)
SELECT 
    required_ration,
    (CASE 
        WHEN current_ration >= required_ration THEN 'true' 
        ELSE 'false' 
    END) AS sufficient_check
FROM required_ration_calc, rations;
   
                