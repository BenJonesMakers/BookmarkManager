feature 'Feature: adding a new bookmark' do
  scenario 'add a new bookmark to bookmark manager' do

    connect_and_insert_test_data()

    visit('/bookmarks/add')
    fill_in('url', with: 'http://www.wtf.com')
    fill_in('title', with: 'WTF')
    click_button('save')
    # expect(page).to_not have_content "Error"
    expect(page).to have_content "WTF"
  end
end
