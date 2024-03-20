SELECT REPEAT('* ', 1 + (n - 1)) AS Pattern
FROM (
    SELECT ROW_NUMBER() OVER () AS n
    FROM information_schema.columns
    LIMIT 20
) AS nums;