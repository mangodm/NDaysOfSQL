SELECT 
    agg.hacker_id,
    agg.name,
    SUM(max_score) AS total_score
FROM (
SELECT 
    Submissions.hacker_id,
    Submissions.challenge_id,
    Hackers.name,
    MAX(score) AS max_score
FROM Submissions
INNER JOIN Hackers
ON Submissions.hacker_id = Hackers.hacker_id
GROUP BY Submissions.hacker_id,
         Submissions.challenge_id,
         Hackers.name) AS agg
GROUP BY agg.hacker_id,
         agg.name
HAVING SUM(max_score) <> 0
ORDER BY SUM(max_score) DESC, agg.hacker_id;