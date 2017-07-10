module SessionHelpers
  def sign_up(email: "johnsmith@aol.com", first_name: "John", last_name: "Smith", username: "jsmith", password: "password")
    visit '/users/new'
    fill_in :email, with: email
    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign up'
  end
end
