require 'rails_helper'

RSpec.feature "Creating Articles" do

  scenario "A user creates a new article" do

    visit "/"

    click_link "New Article"
    fill_in "Title", with: "Creating and article"
    fill_in "Boby", with: "Lorem ipsum, Dolor sit amen"
    click_button "Create Article"

    except(page).to have_content("Article has been created")
    except(page.current_path).to eq(articles_path)

  end

end
