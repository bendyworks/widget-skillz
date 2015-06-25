require 'rails_helper'

feature "Widgets page", type: :feature, js: true do
  scenario "User visits widget page" do
      visit "/widgets"
    expect(page).to have_text("Ember")
  end
end
