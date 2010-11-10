class ReadsInM < ActiveRecord::Migration
  def self.up
    change_column(:datasets, :numReads, :decimal)
    change_column(:datasets, :mappedReads, :decimal)
    change_column(:datasets, :unmappedReads, :decimal)
  end

  def self.down
    change_column(:datasets, :numReads, :integer)
    change_column(:datasets, :mappedReads, :integer)
    change_column(:datasets, :unmappedReads, :integer)
  end
end
