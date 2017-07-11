feature 'Search by location' do
  scenario 'User can search by location' do
    visit '/listings'
    fill_in 'location', with: 'London'
    click_button 'Search'
    visit '/search/London'
    expect(page).to have_content('London')
  end

  scenario 'User can search by number of guests' do
    visit '/listings'
    check('1 guest')
    click_button 'Search'
    visit '/search/1'
    expect(page).to have_content('1')
  end
end
