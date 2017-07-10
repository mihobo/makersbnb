feature 'adding a user' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('jsmith')
    expect(User.first.email).to eq('johnsmith@aol.com')
  end
end
