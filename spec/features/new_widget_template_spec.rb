
require 'rails_helper'

feature "New Widget Template page", type: :feature, js: true do
  def browse_to_new_widget_template
    visit "/widgets"
    click_on("New Template")
  end

  scenario "User visits new widget template page" do
    browse_to_new_widget_template

    expect(page).to have_text("Widget Template")
  end

  describe "creating a new widget template" do
    let(:new_template_title) { "Platonic Shape" }
    let(:new_template_fields) do
      {
        size: :text,
        shape: :text,
        birthday: :date
      }
    end

    scenario do
      browse_to_new_widget_template

      fill_in('Title', with: new_template_title)
      new_template_fields.each do |name, value|
        click_on('Add Field')
        all('input').last.set(name)
        all('select').last.find(:option, value).select_option
      end

      click_on('Create')

      expect(page).to have_content('Widgets')

      created_template = WidgetTemplate.last
      expect(created_template.title).to eq(new_template_title)
      expect(created_template.fields).to eq(new_template_fields.as_json)
    end
  end
end
