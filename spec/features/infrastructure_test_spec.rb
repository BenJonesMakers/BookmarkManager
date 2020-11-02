feature "test site is up" do
  scenario "Check the test route" do
    visit('/test')
    expect(page).to have_content "Hello World"
  end
end
