SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM 
    (
    SELECT 
        Occupation,
        Name,
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS rn
    FROM 
        OCCUPATIONS
    ) AS Sorted
GROUP BY 
    rn;