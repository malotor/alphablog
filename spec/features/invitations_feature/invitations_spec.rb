require 'rails_helper'

RSpec.feature 'Invitations feature' do
  scenario 'A logged user are not allowed to see the invitations page' do
    visit '/invitations'

    expect(page).to have_content('You haven`t provide a valid token invitation')
    expect(page.current_path).to eq(root_path)
  end
end
