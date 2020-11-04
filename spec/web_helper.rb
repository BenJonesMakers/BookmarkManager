def connect_and_insert_test_data
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all Software');")
  connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google US');")
end
