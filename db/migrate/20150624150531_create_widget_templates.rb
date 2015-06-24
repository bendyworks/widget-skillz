class CreateWidgetTemplates < ActiveRecord::Migration
  def change
    create_table :widget_templates do |t|
      t.string :title
      t.json :fields

      t.timestamps null: false
    end
  end
end
