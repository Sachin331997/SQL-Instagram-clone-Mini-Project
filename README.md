# SQL-Instagram-clone-Mini-Project

With roughly one billion monthly active users, Instagram belongs to the most popular social networks worldwide, according to statista.com. It is certain that Instagram has very large user data on their database.

In this project, we have a database that is similar to how Instagram’s database works.

The database name is ig_clone. Here are more details about the 7 tables in this database:

users: Table of Instagram users, contains user id, username, and account creation time.

photos: Table of photos that has been uploaded on Instagram, contains photo id, user id of the user that upload the photos, url of the photo, and post creation time.

comments: Table of comments that has been added to each photos on Instagram, contains comment id, comment text, id of the photo commented, id of the user that post the comment, comment creation time.

likes: Table of likes given to each photos on Instagram, contains id of the user who gave the like, id of the photo liked, the time the like was given.

follows: Tables of which users follows other user, contains id of the follower and the user followed, and the time follower started following.

tags: containing id of the hashtag, hashtag name, and the time it’s created.

photo_tags: Tables of hashtags that has been added to a photo’s caption, contains id of the photo, and id of the hashtag.

