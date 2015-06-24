require 'rails_helper'

feature "Widgets page", type: :feature, js: true do
  scenario "User visits widget page" do
    begin
      visit "/widgets"
    rescue
      binding.pry
      puts "wrong line"
    end
      binding.pry
    expect(page).to have_text("Ember")
  end
end
