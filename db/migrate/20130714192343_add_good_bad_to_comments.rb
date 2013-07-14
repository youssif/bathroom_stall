class AddGoodBadToComments < ActiveRecord::Migration
  def change
    add_column :comments, :good_bad, :string
  end
end
