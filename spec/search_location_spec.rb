feature 'Search by location' do
  scenario 'User can search by location' do
    visit '/listings'
    fill_in 'location', with: 'London'
    click_button 'Search'
    visit '/search/London'
    expect(page).to have_content('London')
  end
end
