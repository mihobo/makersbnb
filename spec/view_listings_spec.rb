feature 'viewing listings' do
  scenario 'I can see a list of properties on the main page' do
    Listing.create(title: 'Contemporary Artist Home',
                   location: 'London',
                   beds: 1,
                   price: "£500",
                   max_guests: 1)
    visit '/listings'
    expect(page.status_code).to eq 200
    within 'ul#listings' do
      expect(page).to have_content('London')
    end
  end
end
