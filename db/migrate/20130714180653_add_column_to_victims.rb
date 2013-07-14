class AddColumnToVictims < ActiveRecord::Migration
  def change
    add_column :victims, :facebook_id, :bigint
  end
end
