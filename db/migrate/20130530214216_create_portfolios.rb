class CreatePortfolios < ActiveRecord::Migration
  
  def up
    create_table :portfolio do |t|
      t.string   "name"
      t.integer  "section_id"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.string   "title_ru"
      t.string   "title_en"
      t.text     "body_ru",    :limit => 16777215
      t.text     "body_en",    :limit => 16777215
    end
  end
  
  def down
    drop_table :portfolio
  end
end
