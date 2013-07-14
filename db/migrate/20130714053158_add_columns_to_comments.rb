class AddColumnsToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :message, :text
  	add_column :comments, :user_id, :integer
  	add_column :comments, :victim_id, :integer
  end
end
