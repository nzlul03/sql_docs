SELECT h.hacker_id, 
       h.name 
FROM   submissions s 
       JOIN challenges c 
         ON s.challenge_id = c.challenge_id 
       JOIN difficulty d 
         ON c.difficulty_level = d.difficulty_level 
       JOIN hackers h 
         ON s.hacker_id = h.hacker_id 
            AND s.score = d.score 
GROUP  BY 
    h.hacker_id, 
    h.name 
HAVING 
    count(s.hacker_id) > 1 
ORDER  BY 
    count(s.hacker_id) desc, 
    s.hacker_id asc; 