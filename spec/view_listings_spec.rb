feature 'viewing listings' do
  before(:each) do
    sign_up
    sign_in(email: "johnsmith@aol.com", password: "password")
    new_listing
  end

  scenario 'I can see a list of properties on the main page' do
    visit '/listings'
    expect(page.status_code).to eq 200
    within 'ul#listings' do
      expect(page).to have_content('London')
    end
  end

  scenario 'viewing a particular listing' do
    visit '/listings'
    click_link 'Title: batcave Location: London Beds: 2 Price: 100 Max guests: 3'
    expect(page).to have_content('batcave')
  end
end
