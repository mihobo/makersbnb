feature 'User sign out' do
  before(:each) do
    User.create(email: 'easy@aol.com',
               first_name: 'meepo',
               last_name: 'ronaldo',
               username: 'uzer',
               password: 'password',
               password_confirmation: 'password'
               )
  end 
  scenario 'can log out while I am signed in' do
    sign_in(email: 'easy@aol.com', password: 'password')
    click_button 'Sign out'
    expect(page).not_to have_content('uzer')
  end 
end 
