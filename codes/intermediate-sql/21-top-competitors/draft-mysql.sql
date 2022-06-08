SELECT 
    Submissions.hacker_id,
    Hackers.name
FROM Submissions
INNER JOIN Challenges
ON Submissions.challenge_id = Challenges.challenge_id
INNER JOIN Difficulty
ON Challenges.difficulty_level = Difficulty.difficulty_level
AND Submissions.score = Difficulty.score
INNER JOIN Hackers
ON Submissions.hacker_id = Hackers.hacker_id
GROUP BY Submissions.hacker_id,
         Hackers.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, Submissions.hacker_id;