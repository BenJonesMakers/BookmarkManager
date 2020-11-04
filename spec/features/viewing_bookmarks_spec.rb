feature 'Feature: Viewing Bookmarks' do
  scenario 'returns bookmarks at /bookmarks route' do

    connect_and_insert_test_data()

    visit('/bookmarks')

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Destroy all Software"
    expect(page).to have_content "Google US"
  end

  scenario 'click on a link' do

    connect_and_insert_test_data()

    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
