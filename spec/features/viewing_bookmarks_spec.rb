feature 'Viewing Bookmarks' do
  scenario 'returns bookmarks at /bookmarks route' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all Software');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google US');")

    visit('/bookmarks')

    # expect(page).to have_content "http://www.makersacademy.com"
    # expect(page).to have_content "http://www.destroyallsoftware.com"
    # expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Destroy all Software"
    expect(page).to have_content "Google US"
  end
end
