feature 'User sign in' do
  let!(:user) do
    User.create(email: 'user@example.com',
                first_name: 'Jacky',
                last_name: 'Chan',
                username: 'Jaycee',
                password: 'chinanumbawan',
                password_confirmation: 'chinanumbawan')
  end

  scenario 'correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "#{user.username}"
  end
end
