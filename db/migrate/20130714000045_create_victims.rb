class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :name
      t.string :facebook_url
      t.string :gender
      t.string :city

      t.timestamps
    end
  end
end
