SELECT c.hacker_id, h.name, count(c.challenge_id) AS TOTAL_COUNT 
FROM Hackers  h 
JOIN Challenges c ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name 
HAVING TOTAL_COUNT = (
    SELECT count(c1.challenge_id) FROM Challenges c1 
    GROUP BY c1.hacker_id 
    ORDER BY count(*) desc limit 1
) 
or
TOTAL_COUNT NOT IN (
    SELECT count(c2.challenge_id) 
    FROM Challenges c2 
    GROUP BY c2.hacker_id 
    HAVING c2.hacker_id <> c.hacker_id)
ORDER BY TOTAL_COUNT DESC, c.hacker_id;