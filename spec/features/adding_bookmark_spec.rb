feature 'adding a new bookmark' do
  scenario 'add a new bookmark to bookmark manager' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks/add')
    fill_in('url', with: 'http://www.wtf.com')
    click_button('save')
    # expect(page).to_not have_content "Error"
    expect(page).to have_content "http://www.wtf.com"
  end
end
