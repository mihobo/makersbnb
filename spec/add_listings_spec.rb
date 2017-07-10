feature 'Add listings' do
  scenario 'I can add a listing' do
    visit '/listings/new'
    fill_in 'title', with: '2 bed home'
    fill_in 'location', with: 'London'
    fill_in 'beds', with: 2
    fill_in 'price', with: '£400'
    fill_in 'max_guests', with: 4
    click_button 'Add listing'
    visit '/listings'
    expect(page).to have_content('2 bed home')
  end
end
