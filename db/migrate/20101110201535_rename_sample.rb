class RenameSample < ActiveRecord::Migration
  def self.up
    rename_column(:datasets, :sample, :conditions)
  end

  def self.down
    rename_column(:datasets, :conditions, :sample)
  end
end
