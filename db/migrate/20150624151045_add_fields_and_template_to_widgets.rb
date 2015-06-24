class AddFieldsAndTemplateToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :custom_field_types, :json
    add_column :widgets, :template_fields, :json
    add_column :widgets, :custom_fields, :json
    add_reference :widgets, :widget_template, index: :true
  end
end
