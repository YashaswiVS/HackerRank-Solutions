SELECT CT.contest_id, CT.hacker_id, CT.name, SUM(TS), SUM(TAS), SUM(TV), SUM(TUV)
FROM Contests AS CT
JOIN Colleges AS CL ON CT.contest_id = CL.contest_id
JOIN Challenges AS CH ON CH.college_id = CL.college_id
LEFT JOIN (
    SELECT CHALLENGE_ID, 
        SUM(total_views) AS TV, 
        SUM(total_unique_views) AS TUV 
    FROM View_Stats 
    GROUP BY CHALLENGE_ID
) AS VS ON CH.challenge_id = VS.challenge_id
LEFT JOIN (
    SELECT CHALLENGE_ID, 
        SUM(TOTAL_SUBMISSIONS) AS TS,  
        SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TAS 
    FROM Submission_Stats 
    GROUP BY CHALLENGE_ID
) AS SS ON CH.challenge_id = SS.challenge_id
GROUP BY CT.contest_id, CT.hacker_id, CT.name
ORDER BY CT.contest_id;
