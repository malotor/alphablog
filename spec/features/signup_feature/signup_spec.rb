require 'rails_helper'

RSpec.feature "Signup" do

  scenario "A user signup with without invitation" do

    visit "/signup"

    expect(page).to have_content("You haven`t provide a token invitation")
    expect(page.current_path).to eq(root_path)

  end

  scenario "A user signup with no valid invitation" do

    visit "/signup?token=111111"

    expect(page).to have_content("You haven`t provide a valid token invitation")
    expect(page.current_path).to eq(root_path)

  end

  scenario "A user signup with valid invitation" do

    invitation = Invitation.create(email_recipient: "test@test.com")

    visit "/signup?token=#{invitation.token.to_s}"

    expect(page.current_path).to eq(signup_path)

  end

end
