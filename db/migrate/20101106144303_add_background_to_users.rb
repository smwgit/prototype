class AddBackgroundToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :background, :string
  end

  def self.down
    remove_column :users, :background
  end
end
