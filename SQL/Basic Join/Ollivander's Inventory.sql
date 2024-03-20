SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property wp ON w.code = wp.code
WHERE WP.IS_EVIL = 0 AND W.COINS_NEEDED = (
    SELECT MIN(COINS_NEEDED) 
    FROM WANDS AS X
    JOIN WANDS_PROPERTY AS Y 
    ON (X.CODE = Y.CODE) 
    WHERE X.POWER = W.POWER AND Y.AGE = WP.AGE
) 
ORDER BY w.power DESC, wp.age DESC;