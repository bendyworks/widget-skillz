class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name
      t.text :body
      t.integer :location_x
      t.integer :location_y
      t.integer :width
      t.integer :height

      t.timestamps null: false
    end
  end
end
