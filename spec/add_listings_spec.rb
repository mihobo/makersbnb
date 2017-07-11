feature 'Add listings' do
  before(:each) do
    User.create(email: 'easy@aol.com',
    first_name: 'meepo',
    last_name: 'ronaldo',
    username: 'uzer',
    password: 'password',
    password_confirmation: 'password'
    )
  end

  scenario 'I can add a listing' do
    sign_in(email: 'easy@aol.com', password: 'password')
    expect{new_listing}.to change(Listing, :count).by(1)
    visit '/listings'
    expect(page).to have_content('batcave')
  end


  scenario 'cannot add listing unless signed in' do
    expect{new_listing}.to change(Listing, :count).by(0)
  end

end
