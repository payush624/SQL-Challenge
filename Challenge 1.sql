--The organizers want to identify vulnerable living players who might be easily manipulated for the next game. Find all players who are alive, in severe debt (debt > 400,000,000 won), and are either elderly (age > 65) OR are gamblers with no family connections.
--  Mandatory condition (status = 'alive and debt > 400000000)
--  Optional Condition (age > 65) OR (vice in Gambling and has_family = 'False')


SELECT *
FROM player
WHERE status = 'alive'
  AND debt > 400000000
  AND (age > 65 OR (vice = 'Gambling' AND has_close_family = 'false'));

                
                