feature 'adding a user' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('jsmith')
    expect(User.first.email).to eq('johnsmith@aol.com')
  end
  scenario 'but not with the wrong password confirmation' do
    expect { sign_up(password_confirmation: "wrong") }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end 
  scenario 'nor without specifying an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end 
  scenario 'nor without a valid email format' do
    expect { sign_up(email: "invalid") }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end   
  scenario 'I cannot signup with an existing email' do
    sign_up 
    expect { sign_up  }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end 
  scenario 'I cannot signup with an existing username' do
    sign_up(email: "jsmth@aol.com")
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
  end 
end
