require 'rails_helper'

RSpec.feature 'Signup' do
  scenario 'A user signup with without invitation' do
    visit '/signup'

    expect(page).to have_content('You haven`t provide a valid token invitation')
    expect(page.current_path).to eq(root_path)
  end

  scenario 'A user signup with no valid invitation' do
    visit '/signup?token=111111'

    expect(page).to have_content('You haven`t provide a valid token invitation')
    expect(page.current_path).to eq(root_path)
  end

  scenario 'A user signup with valid invitation is allowed to signup' do
    invitation = Invitation.create(email_recipient: 'test@test.com')

    visit "/signup?token=#{invitation.token}"

    expect(page.current_path).to eq(signup_path)
  end

  scenario 'A user signup with valid invitation signup' do
    invitation = Invitation.create(email_recipient: 'test@test.com')

    visit "/signup?token=#{invitation.token}"

    fill_in 'Username', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '1234'
    click_button 'Sign up'

    expect(page).to have_content('Welcome to test page')

    user_created = User.last
    expect(page.current_path).to eq(user_path(user_created))
  end

  scenario 'A user signup with valid invitation signup but diferent email' do
    invitation = Invitation.create(email_recipient: 'test@test.com')

    visit "/signup?token=#{invitation.token}"

    fill_in 'Username', with: 'test'
    fill_in 'Email', with: 'other@test.com'
    fill_in 'Password', with: '1234'

    click_button 'Sign up'

    expect(page).to have_content('You have filled in different email that invitation was sended')
  end
end
