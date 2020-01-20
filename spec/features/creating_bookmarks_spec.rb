feature 'Adding a new bookmark' do
    scenario 'A user can add a new bookmark to the Bookmark Manager' do
      visit('/bookmarks/new')
      fill_in('url', with: 'http://testbookmark.com')
      click_button('submit')
  
      expect(page).to have_content 'http://testbookmark.com'
    end
  end