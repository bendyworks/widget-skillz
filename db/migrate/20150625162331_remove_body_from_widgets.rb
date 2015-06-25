class RemoveBodyFromWidgets < ActiveRecord::Migration
  def change
    remove_column :widgets, :body
  end
end
