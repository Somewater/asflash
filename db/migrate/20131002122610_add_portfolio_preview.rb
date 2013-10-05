class AddPortfolioPreview < ActiveRecord::Migration
  
  def up
    add_column :portfolio, 'preview_ru', :text, :limit => 16777215
    add_column :portfolio, 'preview_en', :text, :limit => 16777215
  end
  
  def down
    remove_column :portfolio, 'preview_ru'
    remove_column :portfolio, 'preview_en'
  end
end
