feature 'viewing listings' do
  scenario 'I can see a list of properties on the main page' do
    sign_up
    sign_in(email: "johnsmith@aol.com", password: "password")
    new_listing
    visit '/listings'
    expect(page.status_code).to eq 200
    within 'ul#listings' do
      expect(page).to have_content('London')
    end
  end
end
