## Bookmarks pairing challenge

# To run the app:

clone the repo then run 'bundle'

''''
rackup
''''

To view bookmarks, navigate to:
'http://localhost:9292/bookmarks'


Database setup instructions:

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

# Show a list of bookmarks

As an internet user
So that I can remember sites I have visited
I would like to see a list of bookmarked web pages

Domain Model:

Objects:

Bookmark
Bookmarks = []

Method: .all (owned by Bookmark)

A controller (app.rb)
route: /bookmarks
Model: Bookmark
View: Bookmark
