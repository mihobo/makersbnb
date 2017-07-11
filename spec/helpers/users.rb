module SessionHelpers
  def sign_up(email: "johnsmith@aol.com", first_name: "John", last_name: "Smith", username: "jsmith", password: "password", password_confirmation: "password")
    visit '/users/new'
    fill_in :email, with: email
    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
