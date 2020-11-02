feature 'Viewing Bookmarks' do
  scenario 'returns bookmarks at /bookmarks route' do
    visit('/bookmarks')
    expect(page).to have_content "google.co.uk"
  end
end
