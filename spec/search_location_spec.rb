feature 'Search by location' do
  before(:each) do
    sign_up
    sign_in(email: "johnsmith@aol.com", password: "password")
    new_listing(title: "Nice room")
    new_listing
  end
  scenario 'User can search by two criteria' do
    visit '/listings'
    fill_in 'location', with: 'London'
    fill_in 'max_guests', with: 3
    click_button 'Search'
    expect(page).to have_content('Nice room')
  end

  scenario 'User can search by one criteria' do
    visit '/listings'
    fill_in 'location', with: 'London'
    click_button 'Search'
    expect(page).to have_content('Nice room')
  end

end
