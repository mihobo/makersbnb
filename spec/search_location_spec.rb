feature 'Search by location' do
  before(:each) do
    Listing.create(title: 'Nice room',
    location: 'London',
    beds: 3,
    price: '£200',
    max_guests: 3,
    )
  end
  scenario 'User can search by location' do
    visit '/listings'
    fill_in 'location', with: 'London'
    click_button 'Search'
    expect(page).to have_content('London')
  end
end
