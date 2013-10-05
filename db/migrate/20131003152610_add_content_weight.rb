class AddContentWeight < ActiveRecord::Migration
  
  def up
    add_column :portfolio, 'weight', :integer, :default => 0
    add_column :text_pages, 'weight', :integer, :default => 0
  end
  
  def down
    remove_column :portfolio, 'weight'
    remove_column :text_pages, 'weight'
  end
end
