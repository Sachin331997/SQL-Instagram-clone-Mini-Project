USE ig_clone;

select * from comments;
select * from follows;
select * from likes;
select * from photo_tags;
select * from photos;
select * from tags;
select * from users;

-- Q1  We want to reward the user who has been around the longest, Find the 5 oldest users ------

SELECT 
    username,created_at
FROM
    users
ORDER BY created_at
LIMIT 5;

-- Q2 To target inactive users in an email ad campaign, find the users who have never posted a photo --

WITH cte1 AS
       (SELECT * FROM   users),
cte2  AS 
       (SELECT user_id,Count(id) AS photo_count
         FROM photos
         GROUP BY user_id)
SELECT cte1.id,cte1.username
FROM  cte1
LEFT JOIN cte2
ON cte1.id = cte2.user_id
WHERE cte2.user_id IS NULL; 

-- Q3  Suppose you are running a contest to find out who got the most likes on a photo. Find out who won? --

SELECT
    u.id,
	u.username,
	l.photo_id,
    p.image_url,
    COUNT(l.user_id) as like_counts
FROM  photos p
inner JOIN likes l ON p.id = l.photo_id
inner JOIN users u ON u.id = p.user_id
GROUP BY l.photo_id
ORDER BY like_counts DESC
LIMIT 1;


-- Q4 The investors want to know how many times does the average user post.--\

select (
    (SELECT COUNT(*) FROM Photos) / (SELECT COUNT(*) FROM Users) 
    )
AS avg_posts_per_user;


-- Q5 A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags. --

WITH tag_summary AS
	(SELECT t.id,t.tag_name,pt.photo_id
	FROM tags t
	INNER JOIN photo_tags pt ON t.id=pt.tag_id)
SELECT 
    tag_name, COUNT(photo_id) AS tag_count
FROM tag_summary
GROUP BY tag_name
ORDER BY tag_count DESC
LIMIT 5;


-- Q6 To find out if there are bots, find users who have liked every single photo on the site --

SELECT 
    u.username AS bot, COUNT(l.photo_id) AS like_count
FROM
users u
INNER JOIN likes l ON u.id = l.user_id
GROUP BY bot
HAVING like_count = 
             (SELECT COUNT(*) FROM photos);
             
             
-- Q7 Find the users whose name starts with c 
-- and ends with any number and have posted the photos as well as liked the photos?

WITH name_summary AS
    (SELECT u.username, l.user_id, l.photo_id
     FROM users u
	 INNER JOIN likes l ON u.id = l.user_id)
SELECT DISTINCT username
FROM name_summary
WHERE username REGEXP '^c'
	AND username REGEXP '[0-9]$';


-- Q8 Demonstrate the top 30 usernames to the company who have posted photos in the range of 3 to 5 --

SELECT 
     u.username, COUNT(p.id) AS photos_posted
FROM
photos p 
INNER JOIN users u ON p.user_id = u.id
GROUP BY p.user_id , u.username
HAVING photos_posted BETWEEN 3 AND 5
ORDER BY photos_posted DESC
LIMIT 30;



