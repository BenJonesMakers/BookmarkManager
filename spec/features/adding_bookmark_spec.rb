feature 'adding a new bookmark' do
  scenario 'add a new bookmark to bookmark manager' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all Software');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google US');")

    visit('/bookmarks/add')
    fill_in('url', with: 'http://www.wtf.com')
    fill_in('title', with: 'WTF')
    click_button('save')
    # expect(page).to_not have_content "Error"
    expect(page).to have_content "WTF"
  end
end
