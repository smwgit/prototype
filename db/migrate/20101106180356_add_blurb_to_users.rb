class AddBlurbToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :blurb, :text
  end

  def self.down
    remove_column :users, :blurb
  end
end
