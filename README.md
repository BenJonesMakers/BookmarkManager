## Bookmarks pairing challenge


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
