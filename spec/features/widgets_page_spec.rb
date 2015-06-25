require 'rails_helper'

feature "Widgets page", type: :feature, js: true do
  scenario "User visits widget page" do
      visit "/widgets"
    expect(page).to have_text("Ember")
  end

  context 'a widget exists' do
    let(:template) { create :widget_template, fields: {name: :text, title: :text} }
    let!(:widget1) { create :widget, widget_template: template, height: 800,
                       template_fields: { name: 'one', title: 'sir' } }

    scenario "User updates template values in widget" do
      visit "/widgets"
      new_name = 'new name 1'
      within "#widget#{widget1.id}" do
        find("#widget_#{widget1.id}_name").click
        fill_in 'name', with: new_name
        find("#widget_#{widget1.id}_title").click
      end

      visit "/widgets"

      within "#widget#{widget1.id}" do |el|
        expect(find_field('name').value).to match( /#{new_name}/ )
      end
    end

    scenario "User updates multiple template values in widget" do
      visit "/widgets"
      new_name = 'new name 1'
      new_title = 'Professor'
      within "#widget#{widget1.id}" do
        name_el = find("#widget_#{widget1.id}_name")
        title_el = find("#widget_#{widget1.id}_title")

        fill_in 'name', with: new_name

        title_el.click
        fill_in 'title', with: new_title

        name_el.click
      end

      visit "/widgets"

      within "#widget#{widget1.id}" do |el|
        expect(find_field('name').value).to match( /#{new_name}/ )
        expect(find_field('title').value).to match( /#{new_title}/ )
      end
    end
  end
end
